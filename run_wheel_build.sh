#!/bin/bash

./pants setup-py src/main/python/api:lib --setup-py-run="bdist_wheel --dist-dir=${PWD}/dist"

