# Overview

This tool offers an easy way to check top line metrics of a system such as number of files per directory, and number of non-blank lines of code per source file.

## Number of files per directory

This is a heuristic to get a view of how well organised the package structure is. When a package gets to a certain size, it becomes harder to discern how the files in a package relate to one antoher, and to the overall purpose of the package.

In an ideal package it should be visible how the parts come together to serve the purpose of the package. And it should be easy to see if there are things that do not belong.

## Number of lines of code per file

Large files may be an indicator that it does not follow Single Responsibility Principle, or there is insufficient use of abstraction to decompose the problem. Larger files require more cognitive load to understand, and hence are a likely breeding place for bugs.

## How to use

Probe files in src directory:

curl -s https://raw.githubusercontent.com/iparips/system-probe/master/scripts/analyse_dirs.sh | bash /dev/stdin src
curl -s https://raw.githubusercontent.com/iparips/system-probe/master/scripts/analyse_files.sh | bash /dev/stdin src

Or check files that do not contain "Test" in their name

curl -s https://raw.githubusercontent.com/iparips/system-probe/master/scripts/analyse_dirs.sh | bash /dev/stdin src *Test*
curl -s https://raw.githubusercontent.com/iparips/system-probe/master/scripts/analyse_files.sh | bash /dev/stdin src *Test*

# Todo

- [ ] Add script that reads the outputs of the existing analysers and calculates mean file size and directory file counts