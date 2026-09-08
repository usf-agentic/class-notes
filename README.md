**Before doing anything else, [fork this
repository](https://github.com/usf-agentic/class-notes/fork) on GitHub and work
on your fork.**

# CS 486/686: Multi-Agent Systems

Collaborative lecture notes for **Fall 2026**.

- Instructor: Mehmet Emre
- TA: Ravneet Singh Bhatia
- [Canvas course](https://usfca.instructure.com/courses/1636110)

## Set up your fork

First, fork this repo (see GitHub docs or come to office hours if you don't
know how to). After forking this repo, clone **your copy**. That's the version
you'll work on.

Work on your fork's `main` branch. From your local clone, add the course
repository as `upstream` once so you can sync future updates:

```sh
git remote add upstream https://github.com/usf-agentic/class-notes.git
```

## Repository structure

```text
.
├── README.md           # Setup and contribution instructions
├── book.toml           # Book title, authors, and build configuration
├── install.sh          # Installs mdBook and its Graphviz preprocessor
├── src/
│   ├── index.md        # Course information and copyright notice
│   ├── SUMMARY.md      # Table of contents and navigation order
│   ├── ...             # Lecture notes
│   └── img/            # Images included in lecture notes
└── book/               # Generated website after building (ignored by Git)
```

Book chapters must be linked in `src/SUMMARY.md` to appear in the navigation.

## Install the tools

1. Install [Rust and Cargo](https://www.rust-lang.org/tools/install). You need
   them to install mdBook.
2. Install [Graphviz](https://graphviz.org/download/) if you don't have it already.
3. Run `./install.sh` from the repository root to install all the required
   tooling. The script is tested only on Fedora Linux with Zsh. If you prefer
   a manual installation, read [install.sh](install.sh) and follow its commands.

## Build the book

You can use `mdbook build` but `mdbook serve` is more ergonomic: it
automatically rebuilds the book, and it lets you view it from your browser.
Run:

```sh
mdbook serve --open
```

Open the local URL printed in the terminal if your browser does not open
automatically. Press `Ctrl+C` to stop the server.

## Create lecture notes

**For your second contribution and every contribution after that, sync your
fork before adding new notes.** Wait until your previous PR is merged, then,
with your previous work committed and a clean working tree, run:

```sh
git switch main
git fetch upstream
git merge upstream/main
git push origin main
```

This updates your local `main` and your GitHub fork with the course
repository's latest notes. If the merge fails, stop and come to office hours
for help before continuing.

1. Create a Markdown file under `src/` with the **two-digit week number** and
   **1** for the first lecture that week, **2** for the second lecture. and a
   short topic in its name, such as `src/03.1-reasoning.md`. Add your notes
   there, using headings for the week and individual lectures:

   ```markdown
   # Week 3 Lecture 1: Reasoning

   ## Lecture: [date]

   ### Topic

   Your notes go here.
   ```

   If that week's file already exists, contribute to it instead of creating a
   duplicate. Put any images in `src/img/` and link them from your notes, for
   example `![Diagram description](img/your-diagram.png)`.

2. Reference the file in [src/SUMMARY.md](src/SUMMARY.md), in week order. Paths
   here are relative to `src/`:

   ```markdown
   - [Week 3 Lecture 1](03-reasoning.md)
   ```

3. Add your name to the `authors` array under `[book]` in
   [book.toml](book.toml). Keep the existing authors and add yourself only
   once:

   ```toml
   authors = ["Mehmet Emre", "Ravneet Singh Bhatia", "Your Name"]
   ```

4. Run `mdbook serve --open` to check that your week appears in the navigation
   and that headings, images, links, and equations display correctly.

## Submit a pull request

1. Review and commit your changes. Before you commit, make sure that you are
   committing only the relevant files and all of them. Make sure you have a
   legible commit message.
2. On GitHub, open a pull request from your fork's **`main`** into
   **`usf-agentic/class-notes`**, with **`main` as the base branch**. Make sure
   that the diff looks correct.
3. Give the PR a clear title, such as `Week 3 lecture notes` and a succinct but
   clear description.  These can be picked up automatically from your commit
   message.
4. **Request a review from `ravneetsb` using the PR's Reviewers section on
   GitHub.** If GitHub does not let you select that reviewer, contact the TA
   for help requesting the review.
5. Address review feedback on your fork's `main`, then commit and push your
   updates. They will appear in the existing PR automatically. Wait for this PR
   to be merged before adding another week's notes, so they do not get included
   in the open PR.

Before submitting notes again, return to the fork-sync instructions above.

## Copyright and license

**Lecture notes' copyright is owned by the student writing them**, but they
give University of San Francisco and the instructional staff a non-exclusive
right to publish the notes and to edit them.
