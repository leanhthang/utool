#!/bin/bash

UTOOL_OPTION="$1"
SCRIPT_PATH="$(realpath "$BASH_SOURCE")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

if [ "$UTOOL_OPTION" == 'update' ]; then
  cd $SCRIPT_DIR
  git reset --hard HEAD~2
  git pull
  echo "Update success !"
fi

MENU="
  ==========================================
                  MENU
  ==========================================
  1. Install dependencies for compiling Ruby            50. WSLSmartGit UI
  2. Install lib support image processing               51. WSL2 add some alias by IDE
  3. Install Redis and sidekiq 7                        52. Install docker
  4. Tạo deploy user
  5. Setup Database MariaDB 11.4.2
  6. Setup Database PostgreSQL 15
  7. Install Rails
  8. Add Domain (Nginx/Host)
  10. Add Logrotate
  11. SSH keygen
  12. Setup capitrano deploy

  100. Remove UTool
  Exit (q|quit|exit|0)

  Select one number: "

while true; do
  echo "$MENU"
  read -p "=> Select one: " INPUT
  echo "=================== START ===================="
  case "$INPUT" in
    1)
      sh $SCRIPT_DIR/ubuntu22/install_common_dev_libs.sh;;
    2)
      sh $SCRIPT_DIR/ubuntu22/image_lib.sh;;
    3)
      sh $SCRIPT_DIR/ubuntu22/sidekiq.sh;;
    4)
      sh $SCRIPT_DIR/ubuntu22/user.sh;;
    5)
      sh $SCRIPT_DIR/ubuntu22/mysql.sh;;
    6)
      sh $SCRIPT_DIR/ubuntu22/postgresql.sh;;
    7)
      sh $SCRIPT_DIR/ubuntu22/rails_setup.sh;;
    8)
      sh $SCRIPT_DIR/ubuntu22/nginx_ssl.sh;;
    10)
      sh $SCRIPT_DIR/ubuntu22/logrotate.sh;;
    11)
      sh $SCRIPT_DIR/commons/sshs.sh;;
    50)
      sh $SCRIPT_DIR/wsl2/wsl2_smartgit.sh;;
    51)
      sh $SCRIPT_DIR/wsl2/wsl2_add_alias.sh;;
    100)
      bash $SCRIPT_DIR/uninstall_utool;;
  esac

  if [ "$INPUT" = "q" ] || [ "$INPUT" = "0" ] || [ "$INPUT" = "quit" ] || [ "$INPUT" = "exit" ]; then
    cd
    break
  fi
done
