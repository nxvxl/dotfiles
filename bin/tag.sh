#!/usr/bin/env bash
#
TAG="prd-$(date +%Y%m%d)"
LAST_TAG=$(git describe --tags --abbrev=0)
MESSAGE=$(git log $(git describe --tags --abbrev=0)..HEAD --merges | grep "Merge branch" | cut -d " " -f7 | grep -v "master" | sort | uniq | sed "s/'//g" | sed "s/\r//g")

if [[ "$TAG" == "$LAST_TAG" ]]; then
  if [[ "$1" == "-f" ]]; then
    git tag --delete "$LAST_TAG"
    git push --delete origin "$LAST_TAG"
  else
    echo "latest tag already: $TAG"
    exit 0
  fi
fi

git tag -a -m "$MESSAGE" $TAG
git push origin $TAG

echo $TAG
echo $MESSAGE
