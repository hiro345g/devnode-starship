# devnode-starship-admin

devnode-starship 用の devnode-download-data ボリュームを用意するためのものです。
次のように実行します。

```console
docker compose run --rm devnode-starship-admin sh /script/download_starship.sh
docker compose down
```

devnode-starship コンテナーを起動したときに、/home/node/Download の所有者が root となっている場合は、次のコマンドを実行して所有者を node にします。

```console
docker compose run --rm devnode-starship-admin chown node:node /home/node/Download
docker compose down
```
