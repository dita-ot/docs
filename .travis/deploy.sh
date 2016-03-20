#!/usr/bin/env sh

# CI deployment script

export SSH_DIR=$PWD/.travis
export SITE_DIR=$PWD/dita-ot.github.io

# commit site
cd $SITE_DIR
git config user.email "ditaotbot@gmail.com"
git config user.name "DITA-OT Bot"
git commit -a -m "Deploy dita-ot/docs@$TRAVIS_COMMIT to dev"
# push
git push -v origin develop
