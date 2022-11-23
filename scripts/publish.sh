#!/bin/bash


cp -rf ./src/components ./src

./node_modules/.bin/babel ./src --out-dir ./lib --ignore '**/stories.tsx'

rm -rf ./src/components
rm -rf ./lib/components

cp ./package.json ./lib
cp ./README.md ./lib

node ./scripts/updateVersion.js
# node ./scripts/removePeers.js

npm publish ./lib

# rm -rf ./