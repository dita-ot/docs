# DITA Open Toolkit Docs [![Build Status][1]](http://travis-ci.org/dita-ot/docs)
[![Slack][2]](http://slack.dita-ot.org/)

This repository tracks the source files for the [DITA Open Toolkit documentation][3].

## Contribution Guidelines

We welcome contributions to the DITA-OT documentation. Please review the [guidelines for contributing][4] to this repository before creating issues or opening pull requests.

For best results, follow the [coding guidelines][5] and [best practices][6] outlined in the docs project wiki:

* [Test before committing][7]
* [Commit related changes][8]
* [Commit often][9]
* [Write good commit messages][10]
* [Sign your work][11]

## Building the documentation output

To generate additional topics and build the HTML and PDF versions of the documentation as included in DITA-OT releases, run the Ant build script from the root level of the `docs` repository by entering `ant` on the command line.

You can also specify a single output format. To build HTML output, enter the following on the command line:

    ant html

Output will be generated in the `/out` folder of the `docs` repository. This folder is created automatically if it doesn't exist. _(Git ignores the contents of this folder so you don't inadvertently commit these transient files.)_

**NOTE:** The build script assumes that the `$DITA_HOME` environment variable or the `dita.home` Ant property points to a working DITA-OT installation. If neither is set or you need to override the value, you can also set it on the command line.

either:

    export DITA_HOME=/path/to/dita-ot
    ant ...

or:

    ant -Ddita.home=/path/to/dita-ot


[1]: https://travis-ci.org/dita-ot/docs.svg?branch=develop
[2]: http://slack.dita-ot.org/badge.svg
[3]: http://www.dita-ot.org/dev/
[4]: CONTRIBUTING.md
[5]: https://github.com/dita-ot/docs/wiki/Coding-guidelines
[6]: https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[7]: https://github.com/dita-ot/docs/wiki/Git-workflow#test-before-committing
[8]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[9]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-often
[10]: https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[11]: http://www.dita-ot.org/DCO
