#!/bin/bash

# 1. 引数で渡されたスケッチディレクトリのパスを Windows パスに変換
sketch_path=$(wslpath -w "$1")

# 2. Processing を実行するコマンド
/mnt/c/Users/yuden/workspace/processing-4.3/processing-java.exe --force --sketch="$sketch_path" --run
