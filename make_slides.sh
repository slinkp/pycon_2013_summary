#!/bin/bash

HERE=`cd "${0%/*}" 2>/dev/null; echo "$PWD"/`

shout() { echo -e "$0: $*" >&2; }  # Just echo an error and the program name
barf() { shout "$*"; exit 111; }
safe() { "$@" || barf "cannot $*"; }

source ./bin/activate || barf "You need to run 'virtualenv $HERE'"

for pyfile in *py; do
    outfile=img/`echo $pyfile | sed -e s/py/svg/`
    echo Pygmentizing $pyfile to $outfile
    # Sigh, can't figure out how to scale these bigger by default.
    pygmentize  -O style=native,fontsize=24px -f svg -l python $pyfile > $outfile || barf "Failed to run pygmentize. Try:\n\n   $VIRTUAL_ENV/bin/pip install pygments\n"
done

rst2s5.py --theme=small-black slides.rst > slides.html || barf "Failed to run rst2s5.py. Try:\n\n   $VIRTUAL_ENV/bin/pip install docutils\n"
echo Done, see slides.html
