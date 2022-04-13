# GitLab Clone/Pull/Backup Script

The following scripts are used to clone all repositories from a GitLab instance, pull all changes, and backup the repositories to a local directory.

## Usage

Available scripts :
- `clone_repos.sh`: clones all repositories from a GitLab instance to a local directory.
- `pull_repos.sh`: pulls all changes from the repositories located in the local directory.
- `backup_repos.sh`: pulls all changes from the repositories located in the local directory and sends out an email to an admin user with information about the backup. `pull_repos.sh` and `backup_repos.sh` only differ in the send mail function.

## Configuration

First set the credentials for the GitLab instance you want to clone from in the credentials.sh file. Skip this step, if you only want to use the `pull_repos.sh` script. If you only want to use the `backup_repos.sh` script, just set the SENDER and RECIPIENT varables.

```bash
GITLAB_USER="USERNAME"
GITLAB_TOKEN="CODE_ACCESS_TOKEN"

# Without https:// in front!!!
BASE_URL="git.my-server.tld"

SENDER="server_mail@my-server.tld"
RECIPIENT="me@my-mail.tld"
```

Then run the following commands to clone all repositories from the GitLab instance.

```bash
./clone_repos.sh
```

To pull all changes from the repositories, run the following command.

```bash
./pull_repos.sh
```

To backup all changes from the repositories, run the following command.

```bash
./backup_repos.sh
```

The latter command will send an email to the admin user with information about the backup. This can be integrated into a cronjob for example.

