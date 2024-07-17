# Guide to setup conventional commits on commit

[TOC]

## What does conventional commits do?

docs: [conventionalcommits.org](https://www.conventionalcommits.org)<br>

![conventional commits](./images/conventionalcommits.png)

Validates the commit message format locally before pushing changes:

Why Use Conventional Commits

- Automatically generating CHANGELOGs.
- Automatically determining a semantic version bump (based on the types of commits landed).
- Communicating the nature of changes to teammates, the public and other stakeholders.
- Triggering build and publish processes.
- Making it easier for people to contribute to your projects, by allowing them to explore a more structured commit history.

The commit message should be structured as follows:

```
<type>[optional scope]: [optional gitmoji] <description>

[optional body]

[optional footer(s)]
```

example:

```
feat(auth): ✨ <description>

[optional body]

[optional footer(s)]

```

## gitmoji

gitmoji: [gitmoji.dev](https://gitmoji.dev/)<br>

![gitmoji](./images/gitmoji.png)

## Examples

Good commits:

✅ _`chore: add shadcn package`_

✅ _`feat: ✨ add login button`_

✅ _`fix(auth): 🐛 token validation`_

✅ commit message with ! to draw attention to **breaking change**:

✅ _`feat!: send an email to the customer when a product is shipped`_

✅ _`feat(api)!: send an email to the customer when a product is shipped`_

✅ commit message with **description** and **breaking change footer** (BREAKING CHANGE)

```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

✅ message with **multi-paragraph body** and **multiple footers**

```
fix: prevent racing of requests

Introduce a request id and a reference to latest request. Dismiss
incoming responses other than from latest request.

Remove timeouts which were used to mitigate the racing issue but are
obsolete now.

Reviewed-by: Z
Refs: #123
```

Bad commits:

❌ _`Add LOgin BUTTON`_

❌ _`add login button`_

❌ _`commit message that is too large to fit in one commit, this means that the commit has too many changes to describe and you should split it into multiple commits or you require to use a multi-paragraph body and/or footers.`_

## ⭐ Recommendation: Install VSCode extension

vscode extension: [vivaxy.vscode-conventional-commits](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits)<br>

![vscode extension for conventional commits](./images/vscode-conventionalcommits.png)

To improve your experience creating a commit message.

**Optional:** disable autoCommit

- The extension enables `conventionalCommits.autoCommit` by default, I recommend to disable it to only generate the formatted commit message.
- It can be disabled from the option in `Settings > conventionalCommits.autoCommit`.

## 🎉 Setup project

1. Init a new project (skip if you already have one)

```bash
npm init -y
```

2. install dev dependencies

```bash
npm install --save-dev @commitlint/cli @commitlint/config-conventional
```

3. add a new file at root `commitlint.config.js`

**commitlint.config.js**

```javascript
module.exports = {
  extends: ["@commitlint/config-conventional"],
};
```

4. Install husky as dev dependency

   `npm i -D husky`

5. add script `prepare="husky"` in `packages.json`

   `npm pkg set scripts.prepare="husky"`

6. Execute prepare, this will create the .husky folder

   `npm run prepare`

7. Add hook commit message

   `echo "npx --no -- commitlint --edit ${1}" > .husky/commit-msg`

## FAQ

### How does this relate to SemVer?

1. `fix` type commits should be translated to `PATCH` releases.
2. `feat` type commits should be translated to `MINOR` releases.
3. Commits with `BREAKING CHANGE` in the commits, regardless of type, should be translated to `MAJOR` releases.

### Are the types in the commit title uppercase or lowercase?

Any casing may be used, but it’s best to be consistent.

### What do I do if the commit conforms to more than one of the commit types?

Go back and make multiple commits whenever possible. Part of the benefit of Conventional Commits is its ability to drive us to make more organized commits and PRs.

### Doesn’t this discourage rapid development and fast iteration?

It discourages moving fast in a disorganized way. It helps you be able to move fast long term across multiple projects with varied contributors.

### What do I do if I accidentally use the wrong commit type?

When you used a type that’s of the spec but not the correct type, e.g. `fix` instead of `feat`

**Prior to merging or releasing** the mistake, we recommend using `git rebase -i` to edit the commit history. After release, the cleanup will be different according to what tools and processes you use.
