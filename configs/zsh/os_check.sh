#!/bin/bash

if [[ $OSTYPE == darwin* ]]
then
    OS_sys=🍎
    export OS_sys

elif [[ $OSTYPE == linu* ]]
then
    OS_sys=🐧
    export OS_sys

else
    echo 🤖
fi



