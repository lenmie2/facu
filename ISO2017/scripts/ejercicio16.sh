#! /bin/bash


  echo  "$(whoami):$( find $HOME -name "*.$1" | wc -l )">> reporte.txt

exit 0
