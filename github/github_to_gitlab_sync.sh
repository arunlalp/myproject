#!/bin/bash

REPO_HOME="/data/sync"
REPO_URL="arunlalp/java_code"
REMOTE_URL="git@ec2-35-166-28-65.us-west-2.compute.amazonaws.com:root/project1.git"

cd "$REPO_HOME"

if [ ! -d "$REPO_URL" ]; then
    git clone --mirror "git@github.com:$REPO_URL.git" "$REPO_URL"
fi

cd "$REPO_URL"
git fetch --prune
git push --prune "$REMOTE_URL" "+refs/heads/*:refs/heads/*" "+refs/tags/*:refs/tags/*"
cd ..

rm -rf "$REPO_URL"
