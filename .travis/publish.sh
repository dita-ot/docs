#!/usr/bin/env sh

# CI publish script

export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION
export SITE_DIR=$PWD/dita-ot.github.io

# run site generation into 
./gradlew -b site.gradle -Ddita.home=$DITA_HOME -Doutput.dir=$SITE_DIR/dev --info --stacktrace --no-daemon
