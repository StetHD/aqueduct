#!/bin/bash

pub run test -j 1 -r expanded

if [ $? -eq 0 ]
then
    exit 0
else
    exit 1
fi

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
  pub global activate -sgit https://github.com/stablekernel/codecov_dart.git
  dart_codecov_generator --report-on=lib/ --verbose --no-html
fi