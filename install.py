#!/bin/python3

import argparse
import os
import subprocess
from shutil import which


class Runner:
    def __init__(self, dry=False):
        self.dry = dry

    def _print_cmd(self, cmd, cwd):
        print("> " + " ".join(cmd) + (f" (at {cwd})" if cwd else ""))

    def set_dry(self, value: bool):
        self.dry = value

    def run(
        self,
        cmd: list,
        cwd=None,
        sudo=False,
        check=True,
        capture_output=False,
    ):
        if sudo and cmd[0] != "sudo":
            cmd.insert(0, "sudo")
        if self.dry:
            self._print_cmd(cmd, cwd)
            return
        return subprocess.run(
            cmd, check=check, cwd=cwd, capture_output=capture_output
        )


class Installer:
    def __init__(self, runner):
        self.runner = runner

    def _install(self, cmd, packages: str | list):
        if isinstance(packages, list):
            cmd += packages
        else:
            cmd.append(packages)
        self.runner.run(cmd, sudo=True)

    def _install_apt(self, package: str | list):
        cmd = ["apt", "install"]
        self._install(cmd, package)

    def _install_pip(self, package: str | list):
        cmd = ["pip3", "install"]
        self._install(cmd, package)

    def _install_basic_packages(self):
        print("# Installing basic packages")
        packages = [
            "git",
            "htop",
            "python3-pip",
            "stow",
            "tmux",
        ]
        self._install_apt(packages)

    def _install_zsh(self):
        # Install zsh
        self._install_apt("zsh")

        # Install oh-my-zsh
        cmd = ["curl", "",
               "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh",]
        prog = self.runner.run(cmd, capture_output=True)
        print(dir(prog))

    def _install_neovim(self):
        print("# Installing neovim from source")
        # Install required packages
        req = {"apt": ["gettext", "cmake", "unzip", "curl"], "pip": ["ninja"]}
        self._install_apt(req["apt"])
        self._install_pip(req["pip"])

        # Clone
        cwd = "/tmp"
        repo = "https://github.com/neovim/neovim.git"
        clone_cmd = ["git", "clone", repo]
        self.runner.run(clone_cmd, cwd=cwd)

        # Compile
        cwd += "/neovim"
        compile_cmd = ["make", "CMAKE_BUILD_TYPE=RelWithDebInfo"]
        self.runner.run(compile_cmd, cwd=cwd)

        # Install
        install_cmd = ["make", "install"]
        self.runner.run(install_cmd, cwd=cwd, sudo=True)

    def _run_stow(self):
        print("# Installing dotfiles")
        home_dir = os.path.expanduser("~")
        current_dir = os.path.dirname(os.path.abspath(__file__))
        cfg_dir = os.path.join(current_dir, "config")
        configs = ["git", "nvim", "scripts", "tmux", "term", "zsh"]
        for c in configs:
            cmd = ["stow", "-d", cfg_dir, "-t", home_dir, c]
            self.runner.run(cmd)

    def install(self):
        self._install_basic_packages()
        # self._install_neovim()
        # self._install_zsh()
        self._run_stow()


def get_parser():
    parser = argparse.ArgumentParser(description="Install my dotfiles")
    parser.add_argument(
        "--dry", action="store_true", help="Whether to run in dry mode."
    )
    return parser.parse_args()


def main():
    if not which("apt"):
        sys.exit("OS not supported")

    args = get_parser()
    runner = Runner(args.dry)
    installer = Installer(runner)
    installer.install()


if __name__ == "__main__":
    main()
