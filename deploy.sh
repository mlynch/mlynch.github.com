# abort on errors
set -e

# build
npm run build

git checkout gh-pages
git rm -rf .
git checkout master -- .vuepress/dist
mv .vuepress/dist/* .

git add -A
git commit -m "Deploy"

git push -f origin gh-pages
