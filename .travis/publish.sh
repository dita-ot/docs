#!/usr/bin/env sh

# CI publish script

export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION
export DITA_OT_DEV=$(find $PWD -name 'dita-ot-*+*' -type d | head -1)
export SITE_DIR=$PWD/dita-ot.github.io

#if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  # Remove target output directory before generating new output
  for i in `find "$SITE_DIR/dev" -type f`; do
    if grep -q 'Generated from DITA source' "$i"; then
      echo "Skip generated file $i"
    elif grep -q 'generated: true' "$i"; then
      echo "Skip generated file $i"
    else
      rm "$i"
    fi
  done
  # Re-create /dev folder & generate site output there
  ./gradlew site -PditaHome=$DITA_HOME -PoutputDir=$SITE_DIR/dev -PditaHomeSrc=$DITA_OT_DEV --info --stacktrace --no-daemon
#else
#  ./gradlew -PditaHome=$DITA_HOME html --info --stacktrace --no-daemon
#fi
