# project_script

This repo has made for study proposes.
I put some pos install installation and

- The `Legacy Folder`\
   This folder has the part that I don't use anymore.
  So I decided to put it on that folder.

I split the code in `felib` and `menu`, just to make easy to code.

The `build` is going to put all the code in only one file creating a folder called `cmd` and add a `auto` file with all the
code.

- What this script does?
  ```shell script
    echo "-ssh                      | Setting up the ssh key."
    echo "-github-nopass or -github | Github push without password on project."
    echo "-node-install or node     | Install node.tar.xz from the official website."
    echo "-install-git or -git      | Install the git the last version."
    echo "-nvim-flatpak             | Install nvim and configuration."
    echo "-go                       | Install go."
    echo "-nvim-appimg              | Install nvim and configuration."
    echo "-chrome                   | Install google chrome."
    echo "-flatpak                  | Install flatpak."
    echo "-up                       | Ubuntu/Debian Update."
  ```

New function structure.
Folder_file_function.

### To do:

- [x] Add 2 spaces only.
- [x] Refractory folder by folder.
- [x] Add formatted code on git commit
- [x] Run all tests and release the vertion 1.6.1
- [ ] install starship rust
- [ ] Ruby installer with libs
- [ ] Add the ["This one"]("https://developerslogblog.wordpress.com/2019/02/12/how-to-run-virtualbox-in-full-screen-mode-in-linux/")
