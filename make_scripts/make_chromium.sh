#!/bin/bash

# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

cd $sciezka/../src
jq 'del(.applications)' manifest.json > manifest.json.temp
rm -r manifest.json
mv manifest.json.temp manifest.json

if [ -d $sciezka/../src/web-ext-artifacts ]; then
    rm -rvf ./web-ext-artifacts;
fi

npx shipit chrome ./
zip -r PolishCookieConsent_chromium.zip *
mkdir ./web-ext-artifacts
mv ./PolishCookieConsent_chromium.zip ./web-ext-artifacts
