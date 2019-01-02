# abort on errors
set -e

# build
npm run build

git add -A
git commit -m "Deploy"

git checkout master
git rm -rf .
git checkout develop -- .vuepress/dist
mv .vuepress/dist/* .

git add -A
git commit -m "Deploy"

git push -f origin master

git checkout develop
