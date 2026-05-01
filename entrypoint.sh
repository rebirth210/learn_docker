#!/bin/bash
set -e
# サーバーの二重起動防止用ファイルを削除
rm -f /rails_app/tmp/pids/server.pid
# 本来のコマンドを実行
exec "$@"