#!/usr/bin/env bash

BRANCH=$(git branch --show-current)
AUTHOR=$(git config user.name)

git commit -m "[$BRANCH][$AUTHOR] $1"
