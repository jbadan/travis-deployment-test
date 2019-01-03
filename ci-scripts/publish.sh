git config --global user.email "travis@travis.org"
git config --global user.name "travis"

git pull origin master

# update the package verion and commit to the git repository

npm install

npm run std-version

echo "//registry.npmjs.org/:_password=${NPM_PASSWORD}" > ~/.npmrc
echo "//registry.npmjs.org/:_authToken=${AUTH_TOKEN}" >> ~/.npmrc
echo "//registry.npmjs.org/:username=jbadan" >> ~/.npmrc
echo "//registry.npmjs.org/:email=jenna.badanowski@gmail.com" >> ~/.npmrc

git status

git commit -a -m "[CI SKIP]"

git push "https://jbadan:${GH_TOKEN}@github.com/jbadan/travis-deployment-test.git" --tags origin ${TRAVIS_BRANCH}

npm publish