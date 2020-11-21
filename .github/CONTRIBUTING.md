# Contributing to the DITA-OT docs

We welcome your contributions to the DITA-OT documentation.

Thanks for your interest — here’s how you can help us _“write the docs.”_

## Creating an issue

If you find a bug or would like to suggest a new topic for the DITA-OT docs, create an issue:

1. Search [dita-ot/docs/issues][1] to ensure your issue hasn’t already been reported.
2. [Create an issue][2]. If it’s a bug, provide steps to recreate the issue.
3. [Send a pull request][3]. If you know how to fix the issue yourself, submit a pull request with the proposed changes.

_Read on for details…_

## Submitting pull requests

Good pull requests—corrections, improvements, new topics—are a great help. They should remain focused in scope and shouldn’t contain unrelated commits.

Follow this process to ensure your contribution meets our expectations and increase the chances that your changes will be included:

1. [Fork][4] the docs repository, clone your fork, and configure the remotes:

   ```bash
   # Clone your docs fork into the current directory
   git clone https://github.com/<your-username>/docs

   # Navigate to the newly cloned directory
   cd docs

   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/dita-ot/docs
   ```

2. If you cloned a while ago, get the latest changes from upstream:

   ```bash
   git checkout develop
   git pull upstream develop
   ```

3. Create a new feature branch _(off the upstream project’s `develop` branch)_ for your new feature, change, or fix:

   ```bash
   git checkout -b your-new-branch
   ```

4. Commit your changes in logical chunks.

   Please be sure to follow the [coding guidelines][5] and [best practices][6] outlined in the docs project wiki:

   - [Test before committing][7]
   - [Commit related changes][8]
   - [Commit often][9]
   - [Write good commit messages][10]

   Use Git’s [interactive rebase][11] feature to tidy up your commits, if necessary, before making them public.

5. Indicate that you agree to the terms of the Apache License Version 2.0 by "[signing off][12]" your contribution with `git commit -s`.

   This adds a line with your name and e-mail address to your Git commit message:

   ```bash
   Signed-off-by: Jane Doe <jane.doe@example.com>
   ```

6. Locally merge _(or rebase)_ the upstream `develop` branch into your feature branch:

   ```bash
   git pull [--rebase] upstream develop
   ```

7. Push your feature branch up to your fork:

   ```bash
   git push origin your-new-branch
   ```

8. [Open a pull request][3] with a clear title and description.

   **Pro tip:** If there’s no corresponding issue for the changes you're proposing, there’s no need to create one first.
   You can describe the problem and provide the solution all in one step.
   _(Under the hood, pull requests are just a special type of issue.)_

[1]: https://github.com/dita-ot/docs/issues
[2]: https://github.com/dita-ot/docs/issues/new
[3]: https://help.github.com/articles/using-pull-requests/
[4]: https://help.github.com/articles/fork-a-repo/
[5]: https://github.com/dita-ot/docs/wiki/Coding-guidelines
[6]: https://github.com/dita-ot/docs/wiki/Git-workflow#best-practices
[7]: https://github.com/dita-ot/docs/wiki/Git-workflow#test-before-committing
[8]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-related-changes
[9]: https://github.com/dita-ot/docs/wiki/Git-workflow#commit-often
[10]: https://github.com/dita-ot/docs/wiki/Git-workflow#writing-good-commit-messages
[11]: https://help.github.com/articles/interactive-rebase
[12]: https://www.dita-ot.org/DCO
