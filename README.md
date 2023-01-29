# devnode-starship

これは、node:18.13.0-bullseye を使った Dev Container について、Powerline 実装のひとつである starship を使えるようにしたものです。

以下の説明では、この README.md があるディレクトリーを `${DC_DIR}` と表します。

## 利用方法

初めて使う場合は「準備」に書いてある作業をしてください。
それから、次のようにして devnode-starship コンテナーを起動した後に、コンテナーへアタッチします。

```console
cd ${DC_DIR}
docker compose up -d
docker compose exec devnode-starship bash
```

starship の plain-text-symbols というプリセットを少しカスタマイズしてあります。
実行例は次のようになります。

```console
$ docker compose exec devnode-starship bash

~ 
⬢ [Docker] 🐳> cd Download/

~/Download 
⬢ [Docker] 🐳> ls
starship  starship-x86_64-unknown-linux-musl.tar.gz

~/Download 
⬢ [Docker] 🐳> 
```

## 準備

devnode-starship コンテナーで使う devnode-download-data ボリュームの作成と、使用する starship のバイナリファイルをダウンロードをします。そのための docker-starship-admin コンテナーを用意してあるので、次のようにコマンドを実行します。

```console
cd ${DC_DIR}
cd admin
docker compose run --rm devnode-starship-admin sh /script/download_starship.sh
docker compose run --rm devnode-starship-admin chown node:node /home/node/Download
docker compose down
```

以上で、準備はおしまいです。

## カスタマイズ方法

`${DC_DIR}/script/install_starship.sh` で `/home/node/.config/starship.toml` を用意しています。
使用する `/home/node/.config/starship.toml` をカスタマイズしたものになるようにスクリプトを修正してください。

なお、ここでは Nerd フォントがなくても使える plain-text-symbols プリセットを使っていますが、ターミナルのフォント設定について、Nerd フォントの [白源フォント](https://github.com/yuru7/HackGen) のコンソール向けフォントを使うようにすると、starship の Nerd フォント前提のプリセットである tokyo-night などもきれいに表示されるようになります。

## starship について

プログラミング言語 Rust で実装された Powerline です。
starship は Nerd フォントがなくても、それなりの表示をしてくれるプリセットがあり、実行ファイルも単体で提供されているので、最初に使ってみる Powerline 実装としてお薦めです。

[GitHub \- starship/starship: ☄🌌️ The minimal, blazing\-fast, and infinitely customizable prompt for any shell\!](https://github.com/starship/starship) で開発されています。

プリセットは [Presets \| Starship](https://starship.rs/presets/#nerd-font-symbols) を見て選ぶと良いでしょう。plain-text-symbols, pastel-powerline, tokyo-night, bracketed-segments などがあります。
