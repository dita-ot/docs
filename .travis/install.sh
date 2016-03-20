#!/usr/bin/env sh

# CI install script

# download stable dita-pt
curl -L https://github.com/dita-ot/dita-ot/releases/download/$DITA_OT_VERSION/dita-ot-$DITA_OT_VERSION.zip -o dita-ot-$DITA_OT_VERSION.zip
unzip dita-ot-$DITA_OT_VERSION.zip
export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION

# install site plugin
curl -L https://github.com/dita-ot/org.dita-ot.html/archive/master.zip -o org.dita-ot.html.zip
$DITA_HOME/bin/dita -install org.dita-ot.html.zip -v

# clone site
git clone -b develop git@github.com:dita-ot/docs.git
