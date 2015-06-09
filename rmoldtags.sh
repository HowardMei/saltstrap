git tag --delete $(git tag -l | awk '/^v1(.*)$/ {print $1}')
git ls-remote --tags origin | awk '/^(.*)v1(.*[0-9])$/ {print ":"$2}' | xargs git push --force origin
git tag --delete $(git tag -l | awk '/^v201?.*(.*)$/ {print $1}')
git ls-remote --tags origin | awk '/^(.*)v201?.*(.*[0-9])$/ {print ":"$2}' | xargs git push --force origin
git push --tags --force origin -u
