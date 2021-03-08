#!/bin/bash
# March 7 2021

# folder_name; compiled_file; startline;

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
	done
	echo $ALL_LENGHT
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
	echo "-b			| build the project."
	echo "-c			| clear the project build folder."
	echo "-build-all	| andando_array."
}

while [[ "$1" ]]; do
	case "$1" in
	-b)
		if [[ -d "compiled" ]]; then
			echo "the project is already builded."
		else
			build_compile "bash" "menu.sh" 0
		fi
		exit 0
		;;

	-c)
		build_clear
		exit 0
		;;

	-build-all)
		build_all
		exit 0
		;;
	esac
done

if [[ -z "${1}" ]]; then
	build_menu
fi
