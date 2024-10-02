# TPL Puppet Repository

* [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
* [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
  * [RedHat Agent](#RedHat-Agent)
  * [Bitbucket/Stash](#bitbucketstash)
  * [Github](#github)
* [Code Manager Setup](#code-manager-setup)


## Puppet Agent Install

### Linux Hostname Configuration
1. Set the host/DNS name of the server
    * sudo nano /etc/hosts
    * 127.0.0.1 hostname hostname.example.local
    * 192.168.0.10 hostname hostname.example.local
    * sudo hostnamectl set-hostname hostname.example.local

### RedHat Agent

1. Install RedHat Agent
    * sudo dnf install https://yum.puppet.com/puppet-release-el-8.noarch.rpm -y or (puppet-release-el-7.noarch.rpm)
    * sudo yum install puppet-agent
    * puppet config set server puppetserver.example.com --section main
    * puppet agent --test
    * Login to PE console > Certificates and approve the certificate
    * puppet agent --test
  
 ### Ubuntu Agent

1. Install Ubuntu Agent
     * wget https://apt.puppetlabs.com/puppet8-release-noble.deb or (puppet7-release-noble.deb)
     * sudo apt-get update 
     * sudo apt install puppet-agent
     * puppet config set server puppetserver.example.com --section main
     * puppet agent --test
     * Login to PE console > Certificates and approve the cert
     * puppet agent --test  
           
1. After GitLab is installed you may sign in with the `root` user. If you didn't specify a custom password during installation, a temporary password is located in `/etc/gitlab/initial_root_password`.
1. Make a user for yourself.
1. Make an SSH key to link with your user. You’ll want to do this on the machine you intend to edit code from (most likely not your Puppet master, but your local workstation or laptop).
    * <https://docs.gitlab.com/ee/ssh/index.html>
    * <https://help.github.com/articles/generating-ssh-keys/>
1. Create a group called `puppet` (this is case sensitive).
    * <https://docs.gitlab.com/ee/user/group/index.html>
1. Add your user to the `puppet` group as well.
1. Create a project called `control-repo`, and set the Namespace to be the `puppet` group.
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your gitlab repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

### Bitbucket/Stash

1. Install Bitbucket
    * <https://www.atlassian.com/software/bitbucket/download>
1. Make a `Project` called `puppet` (with a short name of `PUP`)
1. Create a repository called `control-repo`
1. Create a user called `r10k` with a password of `puppet`.
    * Make the r10k user an admin of the `PUP` project.
1. Either use the admin user to test pushing code, or create a user for yourself and add your SSH key to that user.
    * If making a user for yourself, give your user account read/write or admin privilege to the `PUP` project.
1. Clone this control repository to your laptop/workstation
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote
    * `git remote remove origin`
1. Add your internal repository as the origin remote
    * `git remote add origin <url of your bitbucket repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

### GitHub

Follow [GitHub's documentation](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) to create your control repository starting from this template.

<img width="429" alt="template button" src="https://user-images.githubusercontent.com/1392917/117215366-f4eeb280-adb2-11eb-9108-1bd45c4d98f3.png">


### GitHub Enterprise

1. Prepare your local git client to authenticate with a **local GitHub Enterprise instance**.
    * <https://help.github.com/articles/generating-ssh-keys/>
    * <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>
1. Create a repository called `control-repo` in your user account or organization. Ensure that "Initialize this repository with a README" is not selected.
    * <https://help.github.com/articles/creating-a-new-repository/>
1. Make a note of your repository URL (HTTPS or SSH, depending on your security configuration).
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your github repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

## Puppet Patch Management 

1. Create a node group under the PE Patch Management node group.
   * Parent Name: PE Patch Management
   * Group  Name: environment_os_patching, e.g. development_redhat_patching
   * Select the environment
   * Description: environment_os_patching, e.g. development_redhat_patching
   * Add the group
   * Edit the group Create a rule to assign nodes to the node group, e.g. os.family = windows, environment = development, under the rule tab
   * Commit changes
   * Under the class tab, add class pe_patch, under the pe_patch class, add the parameter patch_group = development_redhat_patching, commit changes and run puppet at the top left with the defaults
   * 
   *  


