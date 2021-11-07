#!/usr/bin/bash

git fetch upstream
git checkout main
git rebase upstream/main
git push -f origin main

#./configure --enable-big-digits --enable-framework --enable-optimizations --enable-shared --with-pydebug

./configure --enable-big-digits --enable-framework --enable-ipv6 --enable-loadable-sqlite-extensions --enable-optimizations --enable-profiling --enable-shared --enable-universalsdk --with-doc-strings --with-ensurepip --with-experimental-isolated-subinterpreters --with-freelists --with-pydebug --with-pymalloc

make
sudo make install
