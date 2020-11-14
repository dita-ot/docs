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

⚠️ **Important:** The maps in this repository contain references to additional topics that are created at build time from the toolkit’s plug-in configuration.

To generate the missing topics and build the HTML and PDF versions of the documentation, run the Gradle build script from the root level of the `docs` repository and pass the path to your DITA-OT installation as a parameter.

### Prerequisites

You must have a JRE and a local installation of DITA-OT. There is no need to download and install Gradle.

### Steps

1. Open a command prompt, and change to the location of your local repository for the documentation source.
2. Type a variant of the following command for your operating system, adjust the path to your DITA-OT installation, and press <kbd>Enter</kbd>:

    - On Linux or macOS, use `./gradlew`:

          ./gradlew -PditaHome=/path/to/dita-ot

    - On **Windows**, use `gradlew.bat`:

          gradlew.bat -PditaHome=C:\path\to\dita-ot

    <details>
    <summary>Using a `dita-ot` repository clone</summary>

    - If you’re using a clone of the [DITA-OT development repository][13] as your toolkit installation alongside your clone of the docs repository, run the build script on **Linux** or **macOS** like this:

            ./gradlew -PditaHome=../dita-ot/src/main

    - You can also specify a single output format. To build HTML output, enter the following on the command line:

            ./gradlew -PditaHome=../dita-ot/src/main html

    </details>

### Results

If all goes well, you receive a "BUILD SUCCESSFUL" message, and the generated DITA topics are written to the `extension-points` and `parameters` directories in the `out` folder of the `docs` repository.

This folder is created automatically if it doesn’t exist. _(Git ignores the contents so you don’t inadvertently commit these transient output files.)_

## Building with development versions of DITA Open Toolkit

The `develop` branch of the documentation repository may depend on features from recent development versions of DITA Open Toolkit.

To use these features when building the documentation, you may either download the [latest development version][14] of the distribution package, or clone the [DITA-OT repository][13] and install the [bundled plug-ins][15] via `dita --install`.

[1]: https://travis-ci.org/dita-ot/docs.svg?branch=develop
[2]: https://img.shields.io/badge/Slack-Join%20us!-%234A154B?style=flat&logo=slack
[3]: https://www.dita-ot.org/dev/
[4]: https://www.dita-ot.org
[5]: .github/CONTRIBUTING.md
[6]: https://github.com/dita-ot/docs/wiki/Coding-guidelines
[7]: https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[8]: https://github.com/dita-ot/docs/wiki/Git-workflow#test-before-committing
[9]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[10]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-often
[11]: https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[12]: https://www.dita-ot.org/DCO
[13]: https://github.com/dita-ot/dita-ot
[14]: https://s3-eu-west-1.amazonaws.com/dita-ot/dita-ot-develop.zip
[15]: https://github.com/dita-ot/dita-ot/blob/develop/build.gradle#L169-L177
