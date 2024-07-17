# /bin/bash
npm i -D husky @commitlint/cli @commitlint/config-conventional
npm pkg set scripts.prepare="husky"
npm run prepare
echo "npx --no -- commitlint --edit ${1}" > .husky/commit-msg
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js