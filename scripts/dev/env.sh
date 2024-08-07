#!/bin/bash

# Some useful variables and functions.

r="[0m"
#text="${reset}[0;37m"
#purple="${reset}[0;35m"
e="${r}[0;91m"
w="${r}[0;93m"
h="${r}[1;96m"
t="${r}[0;98m"
s="${r}[1;92m"

function print() {
	echo "${t}$@${r}"
}

function colors() {
    print "- ${h}This color${t} highlights something important"
    print "- ${e}This color${t} signalizes an error"
    print "- ${w}This color${t} represents a warning"
    print "- ${s}This color${t} represents that something was successful!"
}

print "Welcome to the ${h}DEV ${t}environment!"
print "Firstly, the meaning of the different colors:"
colors

dependencies='vendor'

python_installation="${dependencies}/py"

echo $dependencies