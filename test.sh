#!/bin/bash

for row in $(jq --raw-output '.entrypoints[]' build/asset-manifest.json); do

  if [[ $row =~ static/js/main.*.js ]]; then
    az storage blob upload \
      --file "build/$row" \
      --container-name "alpha/fint-kontroll-appbar-pod" \
      --account-name stflaiscdn \
      --name main.js \
      --content-cache-control max-age=31536000 \
      --overwrite
  fi

  if [[ $row =~ static/css/main.*.css ]]; then
    az storage blob upload \
      --file "build/$row" \
      --container-name "alpha/fint-kontroll-appbar-pod" \
      --account-name stflaiscdn \
      --name main.css \
      --content-cache-control max-age=31536000 \
      --overwrite
  fi

done