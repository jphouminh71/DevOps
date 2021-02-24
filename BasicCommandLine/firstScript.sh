#! /bin/bash

# printing hello world
echo "Hello World!"

date
sleep 2
qcho "Linux Shell is fun!"
date

ls

# the last part is the stderror stream
echo "This is an Error" >&2
