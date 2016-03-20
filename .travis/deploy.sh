#!/usr/bin/env sh

# CI deployment script

export SITE_DIR=$PWD/dita-ot.github.io

git config user.email "ditaotbot@gmail.com"
git config user.name "DITA-OT Bot"

# commit site
cd $SITE_DIR
git commit -a -m "Deploy $TRAVIS_COMMIT_RANGE for dev"
# push
eval "$(ssh-agent -s)"
chmod 600 .travis/ditaotbot_rsa.pub
ssh-add .travis/ditaotbot_rsa.pub
git push origin develop
