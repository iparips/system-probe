#!/bin/bash

source_dir="$1"
exclude_glob="$2"

if [ ! -n "$source_dir" ]; then
  echo "Please supply source dir"
  exit 1
fi	

count_files() {
	local filename="$1"
    echo $filename	$(find "$filename" -maxdepth 1 -type f | wc -l)
}

export -f count_files

find "$source_dir" ! -name "$exclude_glob" -type d -exec bash -c 'count_files "$0"' {} \; \
| sort --key 2 --numeric-sort -r \
| head -50
