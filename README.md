# DITA Open Toolkit Docs [![Build Status][1]](http://travis-ci.org/dita-ot/docs) [![Slack][2]](http://slack.dita-ot.org/)

This repository tracks the [documentation][3] source files for the [DITA Open Toolkit project][4].

## Contribution Guidelines

We welcome contributions to the DITA-OT documentation. Please review the [guidelines for contributing][5] to this repository before creating issues or opening pull requests.

For best results, follow the [coding guidelines][6] and [best practices][7] outlined in the docs project wiki:

- [Test before committing][8]
- [Commit related changes][9]
- [Commit often][10]
- [Write good commit messages][11]
- [Sign your work][12]

## Building the documentation output

To generate additional topics and build the HTML and PDF versions of the documentation as included in DITA-OT releases, run the Gradle build script from the root level of the `docs` repository and pass the path to your DITA-OT installation as a parameter:

    ./gradlew -PditaHome=../dita-ot/src/main

You can also specify a single output format. To build HTML output, enter the following on the command line:

    ./gradlew -PditaHome=../dita-ot/src/main html

Output will be generated in the `/out` folder of the `docs` repository. This folder is created automatically if it doesn't exist. _(Git ignores the contents of this folder so you don't inadvertently commit these transient files.)_

## Building with development versions of DITA Open Toolkit

The `develop` branch of the documentation repository may depend on features from recent development versions of the DITA Open Toolkit.

To use these features when building the documentation, you may either download the [latest development version][13] of the distribution package, or clone the [DITA-OT repository][14] and install the [bundled plug-ins][15] via `dita --install`.

[1]: https://travis-ci.org/dita-ot/docs.svg?branch=develop
[2]: http://slack.dita-ot.org/badge.svg
[3]: http://www.dita-ot.org/dev/
[4]: http://www.dita-ot.org
[5]: CONTRIBUTING.md
[6]: https://github.com/dita-ot/docs/wiki/Coding-guidelines
[7]: https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[8]: https://github.com/dita-ot/docs/wiki/Git-workflow#test-before-committing
[9]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[10]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-often
[11]: https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[12]: http://www.dita-ot.org/DCO
[13]: https://s3-eu-west-1.amazonaws.com/dita-ot/dita-ot-develop.zip
[14]: https://github.com/dita-ot/dita-ot
[15]: https://github.com/dita-ot/dita-ot/blob/develop/build.gradle#L123-L128
