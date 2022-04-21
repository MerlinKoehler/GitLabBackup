GITLAB_BACKUP_DIR="/home/user/gitlab-backup"

# check if the backup directory exists and create it if not
if [ ! -d "$GITLAB_BACKUP_DIR" ]; then
    mkdir -p "$GITLAB_BACKUP_DIR"
fi

GITLAB_USER="USERNAME"
GITLAB_TOKEN="CODE_ACCESS_TOKEN"

# Without https:// in front!!!
BASE_URL="git.my-server.tld"

SENDER="server_mail@my-server.tld"
RECIPIENT="me@my-mail.tld"