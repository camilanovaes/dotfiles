#!/bin/python3

import argparse
import os
import subprocess
import sys
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
        return subprocess.run(cmd, check=check, cwd=cwd, capture_output=capture_output)


class Installer:
    def __init__(self, runner):
        self.runner = runner
        self.summary = []

    def _install(self, cmd, packages: str | list):
        if isinstance(packages, list):
            cmd += packages
        else:
            cmd.append(packages)
        self.runner.run(cmd, sudo=True)

    def _install_apt(self, package: str | list):
        cmd = ["apt", "install", "-y"]
        self._install(cmd, package)

    def _install_pip(self, package: str | list):
        cmd = ["pip3", "install"]
        self._install(cmd, package)

    def install_basic_packages(self):
        print("# Installing basic packages")
        pkg_file = "./pkgs/ubuntu.txt"
        with open(pkg_file, "r") as f:
            packages = f.read().splitlines()
        for package in packages:
            self._install_apt(package)
        self.summary.append("Installed basic packages")

    def install_zsh(self):
        # TODO
        # Install zsh
        # self._install_apt(["zsh", "curl"])

        # Install oh-my-zsh
        # cmd = [
        #     "curl",
        #     "",
        #     "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh",
        # ]
        # prog = self.runner.run(cmd, capture_output=True).stdout
        # self.runner.run(prog, shell=True)
        pass

    def _install_fzf(self):
        # TODO:
        # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        # ~/.fzf/install
        pass

    def install_neovim(self):
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

        self.summary.append("Installed neovim")

    def run_stow(self):
        print("# Installing dotfiles")
        self._install_apt("stow")
        home_dir = os.path.expanduser("~")
        current_dir = os.path.dirname(os.path.abspath(__file__))
        cfg_dir = os.path.join(current_dir, "config")
        configs = [d for d in os.listdir(cfg_dir)]
        for c in configs:
            cmd = ["stow", "-d", cfg_dir, "-t", home_dir, c]
            self.runner.run(cmd)
        self.summary.append("Installed dotfiles")

    def print_summary(self):
        print("# Summary")
        for s in self.summary:
            print(f" - {s}")

    def install(self):
        self.install_basic_packages()
        self.install_neovim()
        self.install_zsh()
        self.run_stow()


def get_parser():
    parser = argparse.ArgumentParser(description="Install my dotfiles")
    parser.add_argument(
        "--dry", action="store_true", help="Whether to run in dry mode."
    )
    parser.add_argument(
        "opt",
        choices=["all", "pkg", "neovim", "zsh", "stow"],
        help="Whether to run all or specific options.",
    )
    return parser.parse_args()


def main():
    if not which("apt"):
        sys.exit("OS not supported")

    args = get_parser()
    runner = Runner(args.dry)
    installer = Installer(runner)
    if args.opt == "all":
        installer.install()
    elif args.opt == "pkg":
        installer.install_basic_packages()
    elif args.opt == "neovim":
        installer.install_neovim()
    elif args.opt == "zsh":
        installer.install_zsh()
    elif args.opt == "stow":
        installer.run_stow()

    installer.print_summary()


if __name__ == "__main__":
    main()
