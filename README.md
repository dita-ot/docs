# DITA Open Toolkit Documentation

This repository tracks the source files for the [DITA Open Toolkit documentation][1]. 


## Contribution Guidelines

We welcome contributions to the DITA-OT documentation. Please review the [guidelines for contributing][2] to this repository before creating issues or opening pull requests.

To increase the chances of your changes being approved, please be sure to follow the [coding guidelines][3] and [best practices][4] outlined in the docs project wiki:

* [Commit related changes][5]
* [Commit often][6]
* [Write good commit messages][7]

## Building output

To generate additional topics and build the documentation output, run the Ant build script from the root level of the `docs` repository and specify the target output format.

For example, to build HTML output, enter the following on the command line:

	$ ant html

Output will be generated in the `/out` folder of the `docs` repository. This folder is created automatically if it doesn't exist. _(Git ignores the contents of this folder so you don't inadvertently commit these transient files.)_

**NOTE:** The build script assumes that the `$DITA_HOME` environment variable or the `dita.home` Ant property is set to point to a working DITA-OT installation:

either:

	$ export DITA_HOME=/path/to/dita-ot
	$ ant ...

or:

	$ ant -Ddita.home=/path/to/dita-ot

[1]:	http://www.dita-ot.org/dev/
[2]:	CONTRIBUTING.md
[3]:	https://github.com/dita-ot/docs/wiki/Coding-guidelines
[4]:	https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[5]:	https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[6]:	https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[7]:	https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
