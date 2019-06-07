#!/bin/bash

# Utility functions
usage() {
cat << EOF
Usage: $0 <file_list>
Use this script to check that the tags contained exist in the './_data/tags.yml'
file.
EOF
}

die() {
  echo "$@" 1>&2; exit 1
}

# Parse arguments
help=false
folder_id=""
while test $# -gt 0;
do
  opt="$1";
  case "$opt" in
    "-h"|"--help")
      shift;
      help=true
      break;;
    *)
      break;;
  esac
done

files=("$@")

if test "${files}" = "" || $help; then
  usage
  exit 1
fi


status=0
non_existing_tags=0

not_in_tag_list=()

find_non_existing_tags() {
  for item1 in "${article_tags[@]}"; do
    for item2 in "${tag_list[@]}"; do
      [[ $item1 == "$item2" ]] && continue 2
    done

    # If we reached here, nothing matched
    not_in_tag_list+=("$item1")
    ((non_existing_tags++))
  done

  if [[ $non_existing_tags -ne 0 ]]; then
    echo "The following tags are not contained in the $tags_file file:"
    echo ${not_in_tag_list[@]}
    echo "Please, add them before committing."
  fi
}

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..


tags_file='./_data/tags.yml'

# Read the tags
pattern='\(-[[:blank:]]\)\(.*\)'
IFS=$'\n' tag_list=($(sed -n -e "s/$pattern/\2/p" $tags_file))


for file in "${files[@]}"; do

  echo $file

  # Look for the tags in the files
  pattern='(tags:\s*)\"?([^\"]*)\"?/'
  IFS=$', ' article_tags=($(sed -n -E "s/$pattern \2/p" $file))

  find_non_existing_tags

done


if [[ $non_existing_tags -ne 0 ]]; then
  status=1
fi

exit $status
