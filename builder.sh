#!/bin/bash
# March 7 2021

# folder_name; compiled_file; startline;

GREEN="\u001b[1;32m"
YELLOW="\u001b[1;33m"
RESET="\u001b[0m"

BUILD_FOLDER="compiled"
BUILD_FILE="auto"
ALL=(
  "bash/menu.sh"
  "bash/felib.sh"
  "bash/general_installer.sh"
  "bash/general_cmd.sh"
  "bash/Ubuntu/cmd.sh"
  "bash/Ubuntu/apt_install.sh"
  "bash/main.sh"
)
START_LINES=(
  0
  9
  2
  2
  2
  2
  20
)

ALL_LENGHT=${#ALL[@]}

build_compile() {
  bash_file=$1
  start_line=$2

  local counter=0

  if [[ ! -d "$BUILD_FOLDER" ]]; then
    mkdir "$BUILD_FOLDER" && touch "$BUILD_FOLDER/$BUILD_FILE"
  fi

  while IFS= read -r line; do
    ((counter = counter + 1))

    if [[ $counter -gt $start_line ]]; then
      # printf '%s\n' "$line"
      echo $line >>"$BUILD_FOLDER/$BUILD_FILE"
    fi
  done <"$bash_file"
}

build_all() {
  for ((i = 0; i < ${ALL_LENGHT}; i++)); do
    build_compile ${ALL[$i]} ${START_LINES[$i]}
    echo -e "${GREEN}${ALL[$i]}${RESET} has been compiled."
  done
}

build_gitbash() {
  local gitbash_files=(
    "bash/special_files/gitbash_menu.sh"
    "bash/felib.sh"
    "bash/general_cmd.sh"
    "bash/special_files/gitbash_main.sh"
  )
  local gitbash_lines=(0 9 2 4)
  local gitbash_files_lenght=${#gitbash_files[@]}

  for ((i = 0; i < ${gitbash_files_lenght}; i++)); do
    build_compile ${gitbash_files[i]} ${gitbash_lines[i]}
    echo -e "${GREEN}${gitbash_files[i]}${RESET} has been compiled."
  done
}

build_clear() {
  if [[ -d "$BUILD_FOLDER" ]]; then
    rm -rf "$BUILD_FOLDER"
    echo "the $BUILD_FOLDER folder has ben removed. Project cleanned."
  else
    echo "The project is already clean."
  fi
}

build_menu() {
  echo ""
  echo "-c         | clear the project build folder."
  echo "-build-all | compile all scripts in only one."
  echo "-gitbash   | compile the scripts that runs on windows gitbash."
  echo ""
}

while [[ "$1" ]]; do
  case "$1" in
  -c)
    build_clear
    exit 0
    ;;

  -build-all)
    if [[ -d "compiled" ]]; then
      echo "please run -c to clean first."
      exit 1
    fi
    build_all
    exit 0
    ;;

  -gitbash)
    if [[ -d "compiled" ]]; then
      echo "please run -c to clean first."
      exit 1
    fi
    build_gitbash
    exit 0
    ;;
  esac
done

if [[ -z "${1}" ]]; then
  build_menu
fi
