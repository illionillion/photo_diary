# PHPで画像を投稿する日記アプリ

## 環境構築

<!-- `.env`ファイルに以下を記述

```env
MYSQL_HOST=mysql
MYSQL_USER=root
MYSQL_PORT=3306
MYSQL_PASSWORD=password
MYSQL_DATABASE=my_db
TZ=Asia/Tokyo
ADMIN_PORT=3307
NGINX_PORT=8080
``` -->

ターミナルを起動して以下を実行

```bash
docker compose up -d
```

`http://localhost:8080`でWebサーバーにアクセス

`http://localhost:307`でphpMyAdminにアクセス


- サーバー：`db`
- ユーザー名：`root`
- パスワード：`password`

でログインできる。

起動直後はログインできないので、少し待つ。

コンテナを終了する際は以下を実行

```bash
docker compose down
```