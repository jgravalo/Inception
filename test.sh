#!/bin/bash
set -e
echo "Este comando se ejecuta"
false || ls
echo "Este comando también se ejecuta"
#echo $@
