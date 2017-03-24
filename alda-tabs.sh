#!/bin/bash

echo "*------------------------------------------------------------------------------*"
echo "|                                                                              |"
echo "|   ███████╗ ██████╗██╗ █████╗ ██████╗ ████████╗    ██╗      █████╗ ██████╗    |"
echo "|   ██╔════╝██╔════╝██║██╔══██╗██╔══██╗╚══██╔══╝    ██║     ██╔══██╗██╔══██╗   |"
echo "|   ███████╗██║     ██║███████║██████╔╝   ██║       ██║     ███████║██████╔╝   |"
echo "|   ╚════██║██║     ██║██╔══██║██╔══██╗   ██║       ██║     ██╔══██║██╔══██╗   |"
echo "|   ███████║╚██████╗██║██║  ██║██║  ██║   ██║       ███████╗██║  ██║██████╔╝   |"
echo "|   ╚══════╝ ╚═════╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═════╝    |"
echo "|                                                                              |"
echo "|                    *  Applying Alda SciArt Lab Extension                     |"
echo "|                    *  Composing alda score...                                |"
echo "|                                                                              |"
echo "|                     [http://www.sciartlab.com]                               |"
echo "|                                                                              |"
echo "*------------------------------------------------------------------------------*"

echo ''
echo '' > tmp/composed.alda

if [[ -z $1 ]];
then
    echo ''
    echo `date`" - Missing mandatory arguments: file path."
    echo ''
    exit 1
fi

echo '  *  SciArt Alda Libs have been imported.'
echo ''
cat lib/sciartlab-lib.alda >> tmp/composed.alda

echo '  *  "ta syntax" support has been added.'
echo ''
cat lib/sciartlab-tabs.alda >> tmp/composed.alda


echo '  *  The score ['$1'] is gonna be processed.'
echo ''
cat $1 >> tmp/composed.alda

echo '  *  Executing Aldatabs (Alda with SciArt Lab Extension)'
echo ''

alda play -f tmp/composed.alda

echo ''
echo "                     +--------------------------------+"
echo '                     |  More info: xmunch@xmunch.com  |'
echo "                     +--------------------------------+"
echo ''
