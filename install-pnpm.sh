# /bin/bash
pnpm add -D husky @commitlint/cli @commitlint/config-conventional
pnpm pkg set scripts.prepare="husky"
pnpm run prepare
echo "pnpm dlx commitlint --edit ${1}" > .husky/commit-msg
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js