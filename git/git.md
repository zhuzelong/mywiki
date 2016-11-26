:git:

# Local basis

## Status

```bash
git status [-s|--short]
```

Status code: 
- `??`: new, untracked
- `A`: new staged
- `M `: modified & staged
- ` M`: modified & not staged
- `MM`: modified & staged, **then** modifed locally


## Diff

Use `git diff` to compare files in *working directory* and *staged*, i.e. modified & unstaged.

Use `git diff --staged`` to check staged content, i.e. content which is ready to commit


## Remove and move

Use `git rm [-f|--cached] <file>` to remove file. `-f` option to remove staged file, `--cached` to untrack but keep file on local disk.

```bash
git mv <from> <to>

# Equal to
mv <from> <to>
git rm <from>
git add <to>
```

## Log

Use `git log` to show log, the following options are available:

- `-n`: show the `n` recent commits
- `-p`: show diff of each commit
- `--stat`: show stat of each commit
- `--pretty=[oneline|format:"<format>"]`: prettify output
- `--graph`: to visualize commit history
- `--since`: e.g. `--since=2.weeks`, `--since="2016-12-01"`
- `--until`
- `-- <path|file>`: only show log of certain directory or file
- `--decorate`: show the branches


## Revoke

Use `git commit --amend` to overwrite the previous commit, e.g.

```bash
git commit -m 'first commit'
git add .
git commit --amend  # Git will prompt for commit message, and the first commit is overridden and not visible
```

Use `git reset HEAD <file>` to **unstage** a file.

Use `git checkout -- <file>` to **discard modification** of a file since the latest commit.



## gitignore

Syntax:  
- comment by `#`
- use glob (shell regex) pattern
- start with `/` to avoid recursion
- end with `/` to identify a directory
- prepend `!` to reverse pattern


glob regexp: 
- `*`: zero or more character
- `?`: one character
- `[]`: any character in bracket
- `**`: any number of intermediate directory, e.g. `a/**/z` for `a/z/, a/b/z, a/b/c/z`


## Alias for git command

`git config --global alias.<alias> <verbose command>` to create alias for git commands.


----

# Remote

## Basic remote

### Create

Use `git remote add <alias> <url>` to add a remote repository, the `<alias>` is `origin` by default.


### Fetch & merge

`git fetch <alias>` to fetch remote file and branches to local, but not merged.


### Push

`git push <alias> <branch>` to push a local branch to a branch of the remote repository.

`git push <alias> <local_branch>:<remote_branch>` when the local branch name is different from the remote branch name.


### Show status

`git remote show <alias>`


### Rename

`git remote rename <old_alias> <new_alias>`


### Remove

`git remote rm <alias>`


### Delete remote branch

`git push <alias> --delete <branch>`




----

# Tag

> Tag is attached to a *commit*.


## Show

`git tag` or `git tag -l 'v1.0.*'`


## Annotated tag

`git tag -a <tag_name> -m '<message>'`, message is mandatory for annotated tag.

`git show <tag_name>` to show annotation, author and time of a certain tag.

`git tag -a <tag_name> <commit_sha1>` to annotate tag a past commit, the `sha1` can be partially specified from the beginning.


## Push tag

> `git push` will not push tag to the remote repository.

`git push <alias> <tag_name>` to push a tag to remote.

`git push <alias> --tags` will push all local tags that have not been pushed to remote.



----

# Branch

## Fundamental concepts

Refer to the [doc](https://git-scm.com/book/zh/v2/Git-分支-分支简介)

3 types of object: 
1. blob object: the snapshot of a file
2. tree object: keep track of all blob objects
3. commit object: a pointer pointing at a tree object

A **branch** is a **pointer** pointing at a certain commit object, the `HEAD` is a **pointer** pointing at the current **branch** so can be thinked of an alias of the current branch.

> A branch is a file of 41 bytes: 40 byte of the SHA-1 of the pointed commit object, and a newline character.


## Operation


### Create 

`git branch <branch>`


### Switch

`git checkout <branch>`, the `HEAD` points at the specified branch.

`git checkout -b <branch>` to create and checkout a new branch.

`git checkout -b <branch> <alias>/<branch>` to create and checkout a new branch starting from a remote branch.


### Delete

`git branch [-d|-D] <branch>`, `-D` is force deletion.


### Merge

```bash
git checkout master
git merge hotfix  ## merge hotfix into master
```

`git mergetool` to use visulized merge tool.


### Show info

`git branch -v` to see the commits pointed by the branches.

`git branch --[merged|no-merged]` to see which branch has been merged into the current branch.

`git branch -vv` to show relations between local branches and remote branches. 


### Track remote branch

> **Tracking branch** is checking out a local branch from a remote branch. Tracking branch enable `git pull` to automatically identify the remote branch.

`git checkout --track <alias>/<branch>`

`git branch -u <alias>/<branch>` to track another remote branch.


## Rebase

> Do not rebase commits that exist outside your repository, i.e. do not rebase commits used by other contributors.


```bash
git checkout experiment
git rebase master  # "replay" modification since the common parent commit of master on experiment
# the branch "experiment" points at one step further than "master" now

git checkout master
git merge experiment  # fast-forward
# the branch "master" points at the same commit as "experiment"
```


The following operations: checkout `client`, find the common ancestor of `client` and `server` (say `C3`), then replay all commits since `C3` on `master`.

```bash
git checkout client
git rebase --onto master server client
```


