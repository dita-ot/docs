# Contribution Guidelines

_Thanks for your interest_ — we welcome your contributions to the DITA-OT documentation. 

Please take a moment to review the guidelines below to make sure your contribution meets our expectations and increase the chances that your changes will be approved.

## Create an Issue

If you find a bug — _and you don’t know how to fix it_, [create an issue][1] to request changes.

Before you do that, [review the open issues][2] to make sure it hasn't already been reported.


_or — even better:_

## Create a Pull Request

If you know how to fix the issue yourself, that's great! Here's what to do:

1. [Fork the repository][3],
2. [Create a new branch][4], 
3. Make your changes on the new branch, and 
4. [Send a pull request][5]. 

### Always create a branch for your changes

The DITA-OT project uses the [Git Flow][6] branching strategy. 

In this model, change requests are tracked in feature branches that are created by branching off of the main development baseline in the `develop` branch. This makes it easier to keep track of related changes and merge them back into the development stream later. To find out more about how this works, see the [Gitflow Workflow][7] tutorial.

To send a pull request, create a feature branch in your fork with a name like `feature/my-changes`, make your changes on that branch in your fork and issue the pull request from there. 

For more information, see [Contributing to Open Source on GitHub][8].

### Follow best practices

To increase the chances of your changes being approved, please be sure to follow the [coding guidelines][9] and [best practices][10] outlined in the docs project wiki:

* [Commit related changes][11]
* [Commit often][12]
* [Write good commit messages][13]:

> 1. Separate subject from body with a blank line
> 2. Limit the subject line to 50 characters
> 3. Capitalize the subject line
> 4. Do not end the subject line with a period
> 5. Use the imperative mood in the subject line
> 6. Wrap the body at 72 characters
> 7. Use the body to explain what and why vs. how

For details on the rationale behind these conventions, see “[How to Write a Git Commit Message][14].”


[1]:	https://github.com/dita-ot/docs/issues/new
[2]:	https://github.com/dita-ot/docs/issues
[3]:	https://help.github.com/articles/fork-a-repo/
[4]:	https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/
[5]:	https://help.github.com/articles/using-pull-requests/
[6]:	http://nvie.com/posts/a-successful-git-branching-model/
[7]:	https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
[8]:	https://guides.github.com/activities/contributing-to-open-source/
[9]:	https://github.com/dita-ot/docs/wiki/Coding-guidelines
[10]:	https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[11]:	https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[12]:	https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[13]:	https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[14]:	http://chris.beams.io/posts/git-commit/
