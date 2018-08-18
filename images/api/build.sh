#!/bin/bash

cd ../..
./pants binary src/main/python/api
cp dist/api.pex images/api/
docker build -t pants images/api
