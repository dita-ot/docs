#!/usr/bin/env sh

# CI install script
echo "TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST"
echo "TRAVIS_BRANCH=$TRAVIS_BRANCH"

if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  openssl aes-256-cbc -K $encrypted_324699cc92df_key -iv $encrypted_324699cc92df_iv -in .travis/ditaotbot_rsa.enc -out .travis/ditaotbot_rsa -d
fi

# Download stable DITA-OT version (`publish.sh` uses this to run the conversion)
curl -L https://github.com/dita-ot/dita-ot/releases/download/$DITA_OT_VERSION/dita-ot-$DITA_OT_VERSION.zip -o dita-ot-$DITA_OT_VERSION.zip
unzip dita-ot-$DITA_OT_VERSION.zip
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# Download latest 'develop' DITA-OT version (`publish.sh` reads plugin configuration for generated topics from here)
curl -L https://s3-eu-west-1.amazonaws.com/dita-ot/dita-ot-develop.zip -o dita-ot-develop.zip
unzip dita-ot-develop.zip

#if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  # Install site plugin
  curl -L https://github.com/dita-ot/org.dita-ot.html/archive/master.zip -o org.dita-ot.html.zip
  $DITA_HOME/bin/dita -install org.dita-ot.html.zip -v

  # Clone site
  git clone -b master https://github.com/dita-ot/website.git
#fi
