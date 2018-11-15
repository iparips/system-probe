#!/bin/bash

source_dir="$1"
exclude_glob="$2"

if [ ! -n "$source_dir" ]; then
  echo "Please supply source dir"
  exit 1
fi	

count_loc() {
	local file_name="$1"
	local loc=$(cat "$file_name" | awk 'NF > 0' | wc -l)
	echo "$file_name	$loc"
}

export -f count_loc

find "$source_dir" ! -name "$exclude_glob" -type f -exec bash -c 'count_loc "$0"' {} \; \
| sort --key 2 --numeric-sort -r \
| head -50