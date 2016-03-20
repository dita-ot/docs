#!/bin/bash

# CI deployment script

export SITE_DIR=$PWD/dita-ot.github.io

# commit site
cd $SITE_DIR
git commit -a -m "Deploy $TRAVIS_COMMIT_RANGE for dev"
# push
# TODO https://docs.travis-ci.com/user/deployment/custom/#Git
