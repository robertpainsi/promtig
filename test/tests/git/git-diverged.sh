#!/bin/bash
# The MIT License (MIT)
#
# Copyright (c) 2016 Robert Painsi
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
source git/git-testcase.sh

echo '# Testing branch diverged ↑1↓2'
setUp

echo 'Text' > file.txt
git add file.txt &>/dev/null
git commit -m 'Add file' &>/dev/null

echo 'More text' > file.txt
git commit -am 'Add file' &>/dev/null

git push origin master &>/dev/null
git reset --hard @~2 &>/dev/null

echo 'Another text' > file.txt
git add file.txt &>/dev/null
git commit -m 'Add file' &>/dev/null

printPrompt
tearDown