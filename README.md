# DITA Open Toolkit Documentation

This repository tracks the source files for the [DITA Open Toolkit documentation][1]. 


## Contribution Guidelines

We welcome contributions to the DITA-OT documentation. Please review the [guidelines for contributing][2] to this repository before creating issues or opening pull requests.


## Building Output

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
