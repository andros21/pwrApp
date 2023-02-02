#!/usr/bin/env bash
#
# smoke test pwrapp with postgres
# instance with partial db loaded

set -x
set -o errexit -o nounset -o errtrace -o pipefail

# create tuntap network
docker network create --subnet 10.89.0.0/24 tun-tap

# start postgres emulator
mkdir -p "$PWD/test/data"
docker run --rm \
   --detach \
   --interactive \
   --network tun-tap \
   --ip 10.89.0.2 \
   --env POSTGRES_PASSWORD=password \
   --name postgres_emulator \
   --volume "$PWD/test/pwrapp.sql":/home/postgres/pwrapp.sql:Z \
   --volume "$PWD/test/data":/var/lib/postgresql/data:Z \
   cgr.dev/chainguard/postgres:latest

# provising partial pwrapp db
sleep 3
docker exec -u postgres postgres_emulator sh -c 'createdb pwrapp'
docker exec -u postgres postgres_emulator sh -c 'psql pwrapp < pwrapp.sql'

# reconfigure postgres service
# listen all addresses
docker exec -u postgres postgres_emulator \
   sh -c "echo listen_addresses = \'*\' >> /var/lib/postgresql/data/postgresql.conf"
docker restart postgres_emulator

# start and test pwrapp
sleep 3
docker run \
   --detach \
   --network tun-tap \
   --env DATABASE_URL="postgres://postgres:password@10.89.0.2:5432/pwrapp" \
   --name smoke_pwrapp \
   -p 8080:8080 \
   "${PWRAPP_DEVEL}"
sleep 3
curl -X GET http://localhost:8080 || docker logs smoke_pwrapp
docker logs smoke_pwrapp
docker stop smoke_pwrapp
docker stop postgres_emulator
docker rm smoke_pwrapp
docker network rm tun-tap
