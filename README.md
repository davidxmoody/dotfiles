## About

These are my dotfiles.

This is how I like to customise my system. Feel free to steal anything you like. I wouldn't recommend copying everything but rather just picking and choosing the best bits.

The `./setup` script symlinks everything in `dotfiles` to the home directory (and prefixes the filenames with a dot). It then installs all the software I use on Fedora/Ubuntu.

To overwrite git config settings (e.g. email address for work computer), create a file at `~/.git_include` with the following content:

```
[user]
  email = test@test.com
```
