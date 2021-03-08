#!/usr/bin/env python3

# This script has been made for keeping all the shell script code in one file.
# Finished 28/8/2020
#
# What it does:
#    "-b": build,
#    "-c": clean,
#    "-i": install,
#    "-u": uninstall
#
# Make All the scripts in only one executable file 'auto'.
# Install the 'compiled' shell script in $HOME/.local/bin/.
# Remove the 'auto' file from $HOME/.local/bin if You need.
# When the build is run it creates a folder called 'compiled' you can clean it
# just typing -c.
#

from os import path
from os import system
from pathlib import Path


class Code:
    def __init__(self):
        self.dir = "compiled"
        self.file = "auto"
        self.auto_bin = f"{self.dir}/{self.file}"
        self.folder_install = f"{str(Path.home())}/.local/bin/"
        self.code_line_number = 0

    def write_on_file(self, shell_file, line_to_copy):
        shell_script_file = open(shell_file, "r")
        lines = []
        auto = open(self.auto_bin, "a")

        for line in shell_script_file:
            lines.append(line)

            if self.code_line_number >= line_to_copy:
                auto.write(lines[self.code_line_number])

            self.code_line_number = self.code_line_number + 1

        print(f"{shell_file} with {self.code_line_number} lines.")

        shell_script_file.close()
        auto.close()

    def dir_exists(self):
        if path.isdir(self.dir):
            return True
        else:
            return False


def create_app_folder(code_object):
    system("mkdir " + code_object.dir)
    system("cd " + code_object.dir + " && touch " + code_object.file + " && cd ..")


def build():
    menu_ = Code()

    if menu_.dir_exists():
        print("You should run clean (-c) first please!")
    else:
        # Sequence folder to create and app
        # First menu
        # felib
        # Ubuntu_folder

        create_app_folder(menu_)

        menu_.write_on_file("bash/menu.sh", 0)

        felib = Code()
        felib.write_on_file("bash/felib.sh", 9)

        general_installer = Code()
        general_installer.write_on_file("bash/general_installer.sh", 2)

        general_cmd = Code()
        general_cmd.write_on_file("bash/general_cmd.sh", 2)

        ubuntu_cmd = Code()
        ubuntu_cmd.write_on_file("bash/Ubuntu/cmd.sh", 2)

        ubuntu_apt_install = Code()
        ubuntu_apt_install.write_on_file("bash/Ubuntu/apt_install.sh", 2)

        main = Code()
        main.write_on_file("bash/main.sh", 20)

        system(f"chmod 755 {main.auto_bin}")


def menu():
    temp = Code()
    system_folder = temp.folder_install
    big = "-b | Build, creating a single file with all shell script code."

    print(len(big) * "-")
    print("-b | Build, creating a single file with all shell script code.")  # Done
    print("-c | Clear the project removing the built file.")  # Done
    print(f"-i | Install the project at {system_folder}.")
    print(f"-u | Uninstall the project at {system_folder}.")
    print(len(big) * "-")
    print("")


def clean():
    temp = Code()
    if temp.dir_exists():
        system("rm -rf " + temp.dir)
        print("cleaned!")
    else:
        print("It is already clean")


def install():
    temp = Code()
    system_folder = temp.folder_install
    executable = f"{system_folder}{temp.file}"

    if path.isfile(executable):
        print("\n")
        print("It is already installed on", executable)
        print(
            "If you want to install it anyway, consider to run '-u' first to uninstall and then install it again with" +
            " ths '-i' flag."
        )

    elif not path.isdir(system_folder):
        question = str(
            input(
                f"The default installer folder is : {system_folder}"
                + " do you agree if it? [Y/N]: "
            )
        )

        if question.lower() == "y" or question.lower() == "yes":
            system("mkdir -p " + system_folder)

            if not temp.dir_exists():
                print("Please run the build (-b) first.")
            else:
                system("cp " + temp.auto_bin + " " + system_folder)
                print("Installed!")
    else:
        if not temp.dir_exists():
            print("Please run the build (-b) first.")
        else:
            system("cp " + temp.auto_bin + " " + system_folder)
            print("Installed on", system_folder)

            system(f"chmod 755 {system_folder}{temp.file}")


def uninstall():
    temp = Code()
    installed = f"{temp.folder_install}{temp.file}"

    if path.isfile(installed):
        system("rm " + installed)
        print(f"{installed} has been removed!")
    else:
        print("It is not installed!")
