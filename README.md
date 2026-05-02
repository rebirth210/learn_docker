# Rails Docker プロジェクト README

このリポジトリは、Docker と Docker Compose を使って Rails アプリケーションを実行するためのサンプル構成です。

## 目的

- Docker と Docker Compose で Rails を開発・実行する
- PostgreSQL をコンテナで動かす
- 本番イメージをビルドする Dockerfile を使う

## 必要なもの

- Docker
- Docker Compose
- Ruby / Rails は Docker 内で動作するため、ホスト側に必須ではありません

## セットアップ

1. リポジトリをクローンまたはコピーします。
2. `docker compose up -d --build db` で PostgreSQL コンテナを起動します。
3. `docker compose up -d --build web` で Rails アプリを起動します。

## 使用方法

### DB 起動

```
docker compose up -d --build db
```

### Web コンテナ起動

```
docker compose up -d --build web
```

### コンテナを停止する

```
docker compose down
```

## 開発環境の設定

- `web` サービスは `docker-compose.yml` で `build: .` を指定しています。
- ソースコードは `.:/rails_app` としてコンテナ内にマウントされています。
- Rails は `bundle exec rails s -p 3000 -b '0.0.0.0'` で起動します。

## データベース設定

`config/database.yml` では、以下の設定を使っています。

- ホスト: `db`
- ユーザー名: `postgres`
- パスワード: `password`
- 開発用データベース: `rails_app_development`
- テスト用データベース: `rails_app_test`
- 本番用データベース: `rails_app_production`

### PostgreSQL コンテナの環境変数

`docker-compose.yml` の `db` サービスでは、以下を設定しています。

```
POSTGRES_PASSWORD: password
```

## 本番イメージのビルド

このリポジトリの `Dockerfile` は本番環境向けイメージを作成する構成です。

```
docker build -t my-app .
```

必要に応じて `docker run` で起動します。

## 注意点

- `config/database.yml` に平文で書かれたパスワードは、開発用途の設定です。本番では環境変数で管理してください。
- `docker compose up` 実行時は、`db` サービスが先に起動している必要があります。
- `web` コンテナは `RAILS_ENV=development` で実行されます。

## 参考

- `Dockerfile` と `docker-compose.yml` を確認してください。
- Rails の設定は `config/database.yml` から確認できます。
