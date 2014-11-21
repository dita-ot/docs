# DITA Open Toolkit Documentation

This repository tracks the source files for the [DITA Open Toolkit documentation](http://dita-ot.github.io/2.0/). 


## Contributing

We welcome contributions to the DITA-OT documentation. 

To request changes, you can either [create a new issue](https://github.com/dita-ot/docs/issues/new), or — _even better_

1. [Fork the repository][1]
2. [Create a new branch][2], and 
3. [Send a pull request][3] 

The DITA-OT project uses the [Git Flow][4] branching strategy. 

In this model, change requests are tracked in feature branches that are created by branching off of the main development baseline in the `develop` branch. This makes it easier to keep track of related changes and merge them back into the development stream later.

If you'd like to send a pull request, create a feature branch in your fork with a name like `feature/my-proposed-changes` and issue the pull request from there. 

## Building Output

To generate the documentation output, run the Ant build script from the root level of the `docs` repository and specify the target output format. 

For example, to build HTML output, enter the following on the command line:

    $ ant html

Output will be generated in the `/out` folder of the `docs` repository. This folder is created automatically if it doesn't exist. _(Git ignores the contents of this folder so you don't inadvertently commit these transient files.)_

**NOTE:** The build script assumes that the `$DITA_HOME` environment variable or the `dita.home` Ant property is set to point to a working DITA-OT installation:

either:

    $ export DITA_HOME=/path/to/dita-ot
    $ ant ...

or:

    $ ant -Ddita.home=/path/to/dita-ot

[1]:    <https://help.github.com/articles/fork-a-repo/>
[2]:    <https://help.github.com/articles/using-pull-requests/>
[3]:    <https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/>
[4]:   <http://nvie.com/posts/a-successful-git-branching-model/>

