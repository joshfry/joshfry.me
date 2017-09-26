---
title: SSH with multiple Bitbucket accounts
description: How to set up ssh config and git remotes for multiple Bitbucket accounts
---

> After hours of wasted time trying to figure this out and countless Google searches later, I found this [Medium article that best explains how to set up SSH keys for multiple accounts on Bitbucket](https://medium.com/@fredrikanderzon/setting-up-ssh-keys-for-multiple-bitbucket-github-accounts-a5244c28c0ac).

_Here's the TLDR version:_

## Generate SSH Keys

`cd` into ssh directory

    $ cd ~/.ssh

Create Default key if it doesn't exist

    $ ssh-keygen -t rsa
    $ ssh-add ~/.ssh/id_rsa
    
Creating other keys

    $ ssh-keygen -t rsa -C "companyName" -f "companyName"
    $ ssh-add ~/.ssh/companyName

## Create SSH Config

`~/.ssh/config`

**The value for** `Host` **is an alias**

    Host personal
      Hostname bitbucket.org
      User <personal_username>
      IdentityFile ~/.ssh/id_rsa
    Host work
      Hostname bitbucket.org
      User <work_username>
      IdentityFile ~/.ssh/<other_key>

## Set up Git remote origin for multiple accounts

Set up a remote origin with your personal account as you normally would:  
`$ git remote add origin ssh://git@bitbucket.org/<user_name>/<repo_name>.git`

Set up your work account using the `Host` alias  
`$ git remote add origin ssh://git@<alias>/<user_name>/<repo_name>.git`

**Example:**  
`$ git remote add origin ssh://git@work/<user_name>/<repo_name>.git`
