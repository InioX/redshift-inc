#!/bin/bash
folder_path=~/.local/share/redshift-inc #Path to the file. (Do not add backlash to the last directory)
file_name=test.txt # Name of the file (with extension).
default_increment_value=200 # If no value is specified, use default.
created_value=1700 # The value that gets written when running setup.

main () {
  get_input "$@"
  read_from_file
  write_to_file operation value
  run_redshift
}

create_file () {
  if [ ! -f "$folder_path/$file_name" ]; then
    echo "1700" > "$folder_path/$file_name"
    echo "Created $folder_path/$file_name"
  else echo "A file already exists in the directory"; fi
  setup=true
}

read_from_file () {
  temperature=$(cat "$folder_path/$file_name")
}

write_to_file () {
  printf $(( $temperature $operation $value )) > "$folder_path/$file_name"  
}

usage () {
  echo "Correct usage:"
  echo "$0 -o <+/-> -v <int>" 
}

get_input () {
  while getopts ":o:vs" opt; do
    case $opt in
      o)  operation=$OPTARG;;
      v)  value=$OPTARG;;
      s)  create_file;;
      /?) usage;;
      *)  usage;;
   esac
  done
  
  if [ -z "${value}" ]; then value=$default_increment_value; fi
  if [ -z "${operation}" ] && [ -z "${s}" ] && [ "$setup" == false ]; then usage; fi
}

run_redshift () {
  redshift -P -O "$temperature"
}

main "$@"
