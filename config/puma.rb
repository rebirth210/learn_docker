# この設定ファイルは Puma で読み込まれます。ここで呼び出されるトップレベルのメソッドは
# Puma の設定 DSL の一部です。詳細は https://puma.io/puma/Puma/DSL.html を参照してください。

# Puma は設定可能な数のワーカーを起動し、それぞれのワーカーが内部スレッドプールから
# スレッドを使ってリクエストを処理します。
#
# 1 つのワーカーあたりのスレッド数は、I/O 待ちの時間と、スループットとレイテンシのどちらを重視するかによって変わります。
#
# 一般的には、スレッド数を増やすと処理できるトラフィック量は増えますが、CRuby の
# Global VM Lock (GVL) の影響で効果は薄くなり、応答時間が悪化することがあります。
#
# デフォルトは 3 スレッドに設定されており、一般的な Rails アプリケーションのバランスとして妥当とみなされています。
#
# 接続プールやその他のリソースプールを使うライブラリでは、スレッド数分以上の接続を用意する必要があります。
# これは Active Record の `database.yml` の `pool` パラメータも含みます。
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

# Puma が受信したリクエストを待ち受けるポートを指定します。デフォルトは 3000 です。
port ENV.fetch("PORT", 3000)

# `bin/rails restart` コマンドで Puma を再起動できるようにします。
plugin :tmp_restart

# PID ファイルを指定します。開発環境では tmp/pids/server.pid が既定値です。
# 他の環境では、要求された場合のみ PID ファイルを設定します。
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
