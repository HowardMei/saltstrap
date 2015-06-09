./getupstream.sh
set -ex
echo "upstream_stable =+ upstream_develop -> tmp_stable -> develop"
echo "tmp_stable =+ develop -> release -> master; delete tmp_stable"
git checkout upstream_stable && git checkout -b tmp_stable && git merge --no-edit -Xours upstream_develop || exit 1
git checkout develop && git rebase -Xours tmp_stable && git branch -D tmp_stable || exit 1
git checkout master && git merge --no-edit -Xtheirs develop || exit 1
set +ex
echo "git push --all origin -u  to push all changes to remote"
