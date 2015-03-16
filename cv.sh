#!/bin/bash

#source $(dirname $0)/colors.sh
FGRED=`echo "\033[31m"`
FGGRN=`echo "\033[32m"`
FGYLW=`echo "\033[33m"`
FGBLU=`echo "\033[34m"`
FGMAG=`echo "\033[35m"`
FGCYA=`echo "\033[36m"`
NORMAL=`echo "\033[m"`

echo "This script is designed to upload CVs to the landfill at ArjunDhanjal.com."
echo "This script will also update the symlink located at ${FGGRN}http://landfill.arjundhanjal.com/AD-CV_current.pdf ${NORMAL}"
echo "To proceed, please enter the version number of the CV you'd like to upload: \c"
read vnum
rsync -e 'ssh -p 2222' /Users/arjun/Dropbox/CurriculumVitae/AD-CV_v${vnum}.pdf adhanjal@backend.arjundhanjal.com:~/landfill/.CV/AD-CV_v${vnum}.pdf
ssh adhanjal@backend.arjundhanjal.com -p 2222 "cd landfill/ ; ln -fs .CV/AD-CV_v${vnum}.pdf AD-CV_current.pdf"