#!/usr/bin/env bash
#
TAG="prd-$(date +%Y%m%d)"

git tag $TAG
git push origin $TAG

echo $TAG
