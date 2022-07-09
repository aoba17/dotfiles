mkdir -p ~/.nodebrew/src

nodebrew install latest

set -U fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths

echo "PATH再読込みのためターミナルを開き直してから以下のコマンドを実行してください"
echo "nodebrew use latest"
