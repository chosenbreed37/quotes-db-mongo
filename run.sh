#!/bin/bash
docker rm -f quotes-db-mongo
docker run -d --name quotes-db-mongo -p 27017:27017 --volume $(pwd):/tmp/data mongo mongod
docker exec -it quotes-db-mongo mongoimport --verbose --db quotes --collection quotes --type tsv --headerline --file /tmp/data/quotes.tsv --drop

