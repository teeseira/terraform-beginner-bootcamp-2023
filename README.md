# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage: 

This project is going to utilise semantic versioning for its tagging.

[server.org](https://semver.org/)

The general formal:

**MAJOR.MINOR.PATCH,** e.g. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

## Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to GPgpgG keyring changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is built against Ubuntu.
Please consider checking against your Linux Distributtion and change accordingly to your distribution needs.

[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
)

Example of checking OS Version:

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg deprecation issues, we noticed hat bash scripts steps were a considerable amount more code. So we decided to create a bashs cript to install teh Terraform CLI.

This bash script is located here: [.bin/install_terraform_cli](.bin/install_terraform_cli)


- This will keep the GitPod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This will allow us an easier time to debug and execute manually Terraform CLI install.
- This will allow better portability for other projects that need to install Terraform CLI.

#### Shebang

A Shebang (pronounced Sha-bang) tells the bash script what program that will intepret the script. e.g. `#!/bin/bash`

ChatGPT recommended this format for bash:

`#!/usr/bin/env bash`

- For portabilitity for different OS distributions
- Will search the the user's `PATH` for the `bash` executable.

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations
When executing bash script we can use the `./` shorthand notation to execute the bash script.

e.g. `./bin/install_terraform_cli` 

If we are using a script in gitpod.yml, we need to point the script to a program to interpret it.

e.g. `source ./bin/install_terraform_cli` 

#### Linux Permissions Considerations

In order to make our bash scripts executable, we need to chnage Linux permissions for the file to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternatively 
```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod


### GitPod Lifecycle (Before, Init, Command) Workspaces

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working Env Vars


#### env command
We can list out all Environment Variables (Env Vars) using the `env` command 

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command.

```sh
HELLO='world' ./bin/print_message

```

Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

### Scoping of Env Vars

When you open up new bash terminals in VSCode, it will not be aware of env vars that you have set in another window.

If you want Env Vars to persist across all future terminals that are open, you need to set env vars in your bash profile e.g. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars in gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO=='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workpsaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars.

### AWS CLI

AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Geting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentitials are configured correctly by running the following AWS CLI command:
```sh
sts get-caller-identity 
```

If it is successful, you should see a json payload return that looks liek this:

```json
{
    "UserId": "FHDAFEJNP8LPAMZEUR8G3",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credentials from IAM User in order to use the AWS CLI.