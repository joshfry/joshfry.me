---
date: 2013-03-10

title: png compression from the command line
description: Optimize your images without leaving your shell

category: notes
tags: devtool
---

- Download the pngquant binaries from [http://pngquant.org](http://pngquant.org)
- Move the directory to /usr/local
- Add the following to your `.bashrc` file to make it executable.


~~~bash
# pngquant - tinypng from the commandline
export PATH="/usr/local/pngquant:$PATH"
~~~

- I created an alias to `$ pngoptim`.


~~~bash
# pngquant alias
alias pngoptim="pngquant *.png --ext .png -v -f"
~~~
