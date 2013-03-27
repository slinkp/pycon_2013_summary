#!/bin/bash

source bin/activate

for pyfile in *py; do
    outfile=img/`echo $pyfile | sed -e s/py/svg/`
    echo Pygmentizing $pyfile to $outfile
    # Sigh, can't figure out how to scale these bigger by default.
    pygmentize  -O style=native,fontsize=24px -f svg -l python $pyfile > $outfile || exit 1
done

rst2s5.py --theme=small-black slides.rst > slides.html || exit 1
echo Done, see slides.html
