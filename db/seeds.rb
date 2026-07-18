# このファイルでは、すべての環境（production、development、test）でアプリケーションを実行するために必要な
# レコードが存在することを保証します。ここで記述する処理は冪等であり、どの環境でもいつ実行しても問題ないようにします。
# そのデータは bin/rails db:seed コマンドで読み込めます（または db:setup と一緒に作成できます）。
#
# 例:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
