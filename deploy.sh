#!/bin/bash
mkdir -p apps
cd apps
rm -rf quotes-db-mongo
git clone https://github.com/chosenbreed37/quotes-db-mongo.git
cd quotes-db-mongo
sudo docker rm -f quotes-db-mongo
sudo docker run -d --name quotes-db-mongo -p 27017:27017 --volume $(pwd):/tmp/data mongo mongod
sudo docker exec -it quotes-db-mongo mongoimport --verbose --db quotes --collection quotes --type tsv --headerline --file /tmp/data/quotes.tsv --drop
echo "Quotes database running on  on port 27017..."
