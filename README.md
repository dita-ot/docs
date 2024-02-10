# DITA Open Toolkit Docs [![Build Status][1]](https://github.com/dita-ot/docs/actions/workflows/deploy.yml) [![DITA-OT Discussions][2]](https://github.com/orgs/dita-ot/discussions)

This repository tracks the [documentation][3] source files for the [DITA Open Toolkit project][4].

<!-- MarkdownTOC levels="2" -->

- [Building the documentation output](#building-the-documentation-output)
- [Building with development versions of DITA Open Toolkit](#building-with-development-versions-of-dita-open-toolkit)
- [Contribution guidelines](#contribution-guidelines)
- [Installing formatting tools](#installing-formatting-tools)
- [Running Prettier](#running-prettier)

<!-- /MarkdownTOC -->

## Building the documentation output

> **Note**
>
> The maps in this repository contain references to additional topics that are created at build time from the toolkit’s plug-in configuration.
>
> To generate the missing topics and build the HTML and PDF versions of the documentation, run the Gradle build script from the root level of the `docs` repository and pass the path to your DITA-OT installation as a parameter.

### Prerequisites

You must have a JRE and a local installation of DITA-OT. There is no need to download and install Gradle.

### Steps

1.  Open a command prompt, and change to the directory of your docs repository clone.
2.  Type a variant of the following command for your operating system, adjust the path to your DITA-OT installation, and press <kbd>Enter</kbd>:

    - On **Linux**, **macOS**, or **Git Bash**, use `./gradlew`:

          ./gradlew -PditaHome=/path/to/dita-ot

    - On **Windows**, use `gradlew.bat`:

          gradlew.bat -PditaHome=C:\path\to\dita-ot

<details>
<summary><strong>Alternative:</strong> Using a DITA-OT repository clone</summary>

If you’re using a clone of the [DITA-OT development repository][5] as your toolkit installation alongside your clone of the `docs` repository:

1.  In the root directory of your `dita-ot` repository, run Gradle to compile the Java code and install plugins.

    - On **Linux**, **macOS**, or **Git Bash**, use `./gradlew`.
    - On **Windows**, use `gradlew.bat`.

2.  Then run the Gradle build in the `docs` repository to generate topics and build the documentation output.

    - On **Linux**, **macOS**, or **Git Bash**, run the build script like this:

          ./gradlew -PditaHome=../dita-ot/src/main

    - On **Windows**, use `gradlew.bat`:

          gradlew.bat -PditaHome=C:\path\to\dita-ot\src\main

</details>

You can also specify a single output format. To build HTML for example, add `html` to the end of the command:

    ./gradlew -PditaHome=/path/to/dita-ot html

### Results

If all goes well, you receive a "BUILD SUCCESSFUL" message, and the generated DITA topics are written to the `extension-points` and `parameters` directories in the `out` folder of the `docs` repository.

This folder is created automatically if it doesn’t exist. _(Git ignores the contents so you don’t inadvertently commit these transient output files.)_

## Building with development versions of DITA Open Toolkit

The `develop` branch of the documentation repository may depend on features from recent development versions of DITA Open Toolkit.

To use these features when building the documentation, you may either download the [latest development version][6] of the distribution package, or clone the [DITA-OT repository][5] and install the [bundled plug-ins][7] via `dita install`.

## Contribution guidelines

We welcome contributions to the DITA-OT documentation. Please review the [guidelines for contributing][8] to this repository before creating issues or opening pull requests.

For best results, follow the [coding guidelines][9] and [best practices][10] outlined in the docs project wiki:

- [Test before committing][11]
- [Commit related changes][12]
- [Commit often][13]
- [Write good commit messages][14]
- [Sign your work][15]

## Installing formatting tools

The documentation repository uses the following JavaScript tools to keep source files consistently formatted:

- [Prettier][16] is an opinionated code formatter that enforces a consistent style by parsing code and re-printing it.
- [Husky][17] uses Git hooks to ensure that Prettier runs on all staged changes to format files before committing.

### Prerequisites

- You must have a stand-alone installation of Git from [git-scm.com/downloads][18].
- Include the Git installation location in the [`PATH`][19] environment variable.

### Steps

To set these tools up:

1. Install Node.js® from [nodejs.org][20]
2. Open a command prompt, and change to the directory of your docs repository clone.
3. Run `npm install`

With these tools in place, any changes you make to the documentation source files will be automatically formatted when you commit them with Git. This ensures that commits contain only related changes, and no extra formatting.

<details>
<summary>Troubleshooting</summary>

If the `git` command is not available in your command-line environment, the Husky installation may fail with an error message:

    "Cannot read property 'toString' of null"

_Solution:_ Uninstall Husky via `npm husky uninstall`. Install [Git][18]. Add the installation location to the [`PATH`][19] environment variable. Re-run `npm install`.

</details>

## Running Prettier

If you'd like to check whether your changes are formatted correctly, or format them before committing, you can run Prettier manually from the command line.

### Check formatting

    npm run check

### Format all files

    npm run format

[1]: https://github.com/dita-ot/docs/actions/workflows/deploy.yml/badge.svg
[2]: https://img.shields.io/github/discussions/dita-ot/dita-ot?label=DITA-OT%20Discussions
[3]: https://www.dita-ot.org/dev/
[4]: https://www.dita-ot.org
[5]: https://github.com/dita-ot/dita-ot
[6]: https://s3-eu-west-1.amazonaws.com/dita-ot/dita-ot-develop.zip
[7]: https://github.com/dita-ot/dita-ot/blob/develop/build.gradle#L206-L217
[8]: .github/CONTRIBUTING.md
[9]: https://github.com/dita-ot/docs/wiki/Coding-guidelines
[10]: https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[11]: https://github.com/dita-ot/docs/wiki/Git-workflow#test-before-committing
[12]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[13]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-often
[14]: https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[15]: https://www.dita-ot.org/DCO
[16]: https://prettier.io
[17]: https://github.com/typicode/husky
[18]: https://git-scm.com/downloads
[19]: https://en.wikipedia.org/wiki/PATH_(variable)
[20]: https://nodejs.org
