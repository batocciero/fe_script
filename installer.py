#!/usr/bin/env python3

from fepython import build
from sys import argv


cases = {
    "-b": build.build,
    "-c": build.clean,
    "-i": build.install,
    "-u": build.uninstall,
}

if __name__ == "__main__":

    try:
        cases[argv[1]]()

    except IndexError:
        print("")
        print("Type one of this flags.")
        build.menu()

    except KeyError as error:
        print("")
        print(f"There is no flag: {error}")
        build.menu()
