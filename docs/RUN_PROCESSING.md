# Processing スケッチの動的実行環境設定 (VSCode + WSL)

このガイドは、WSL 上で Processing スケッチを動的に実行するための Bash スクリプトと VSCode のタスク設定方法を説明します。これにより、VSCode 上で開いているスケッチを自動的に Windows パス形式に変換し、Processing を実行できるようになります。

## 準備手順

### 1. スクリプトの配置と作成

#### スクリプトの配置場所を決める
プロジェクトディレクトリにスクリプト用のフォルダを作成し、そこに `run-processing.sh` を配置します。

```bash
mkdir -p /mnt/c/Users/yuden/workspace/processing/scripts
スクリプトファイルを作成
作成した scripts フォルダに移動し、run-processing.sh という名前のファイルを作成します。

bash
コードをコピーする
cd /mnt/c/Users/yuden/workspace/processing/scripts
touch run-processing.sh
スクリプトの内容
run-processing.sh をテキストエディタで開き、以下の内容をコピーペーストしてください。

bash
コードをコピーする
#!/bin/bash

# 引数で渡されたスケッチディレクトリのパスを Windows パスに変換
sketch_path=$(wslpath -w "$1")

# Processing を実行するコマンド
/mnt/c/Users/yuden/workspace/processing-4.3/processing-java.exe --force --sketch="$sketch_path" --run
このスクリプトは、引数で受け取った Linux パスを Windows パスに変換し、processing-java.exe に渡します。

実行権限を与える
ファイルを保存したら、スクリプトに実行権限を付与します。

bash
コードをコピーする
chmod +x /mnt/c/Users/yuden/workspace/processing/scripts/run-processing.sh
2. VSCode の tasks.json 設定
VSCode の tasks.json ファイルで、このスクリプトを呼び出す設定を行います。

tasks.json の設定例
VSCode の .vscode/tasks.json ファイルに以下の内容を追加します。

json
コードをコピーする
{
	"version": "2.0.0",
	"tasks": [
		{
			"label": "Run Processing Sketch",
			"type": "process",
			"command": "/mnt/c/Users/yuden/workspace/processing/scripts/run-processing.sh",
			"args": [
				"${fileDirname}"
			],
			"group": {
				"kind": "build",
				"isDefault": true
			},
			"presentation": {
				"reveal": "always",
				"panel": "new"
			}
		}
	]
}
command の部分でスクリプトのパスを指定し、args に ${fileDirname} を渡すことで、スクリプトが自動的に現在のファイルのディレクトリを取得します。
実行方法
VSCode で実行したい .pde ファイルを開きます。
コマンドパレット（Ctrl + Shift + P）を開き、Tasks: Run Task を選択。
「Run Processing Sketch」を実行します。
これで、スクリプトが動的に現在のスケッチパスを取得し、Processing を実行します。

最終的なファイル構成
/mnt/c/Users/yuden/workspace/processing/scripts/run-processing.sh — 実行スクリプト
.vscode/tasks.json — VSCode のタスク設定ファイル
この設定により、複数のスケッチを動的にパス変換して実行できるようになります。

yaml
コードをコピーする

--- 

この一つの `.md` ファイルで、準備から実行方法まで全体を網羅しています。