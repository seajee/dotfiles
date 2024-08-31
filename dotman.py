#!/usr/bin/env python3

import argparse
import filecmp
import os
import shutil

SOURCE_DIR = "./home/"
TARGET_DIR = os.environ["HOME"]


def list_files(path: str = ".") -> list[str]:
    paths = []
    for root, dirs, files in os.walk(path):
        for file in files:
            paths.append(os.path.join(root, file))
    return paths


def copy_with_dirs(source: str, target: str) -> None:
    os.makedirs(os.path.dirname(target), exist_ok=True)
    shutil.copy(source, target)


def deploy(source_dir: str, target_dir: str) -> None:
    source_files = list_files(source_dir)
    target_files = list(map(lambda f: os.path.join(
        target_dir, f[len(source_dir):]), source_files.copy()))

    deploy_map = {}
    for i, source_file in enumerate(source_files):
        deploy_map[source_file] = target_files[i]

    for source, target in deploy_map.items():
        if os.path.isfile(target):
            if not filecmp.cmp(source, target):  # TODO: Consider shallow=False
                answer = input(target + " conflicts. Overwrite? [y/N] ")
                if answer.lower().startswith("y"):
                    copy_with_dirs(source, target)
        else:
            copy_with_dirs(source, target)


def pull(source_dir: str, target_dir: str) -> None:
    target_files = list_files(target_dir)
    source_files = list(map(lambda f: os.path.join(
        source_dir, f[len(target_dir):]), target_files.copy()))

    pull_map = {}
    for i, source_file in enumerate(source_files):
        pull_map[source_file] = target_files[i]

    for source, target in pull_map.items():
        try:
            shutil.copy(source, target)
        except FileNotFoundError:
            pass


def main():
    parser = argparse.ArgumentParser(
        prog="dotman",
        description="Dotfiles manager")
    parser.add_argument("command", choices=["deploy", "pull"],
                        help="deploy or pull dotfiles")

    args = parser.parse_args()

    if args.command == "deploy":
        deploy(SOURCE_DIR, TARGET_DIR)
    elif args.command == "pull":
        pull(TARGET_DIR, SOURCE_DIR)


if __name__ == "__main__":
    main()
