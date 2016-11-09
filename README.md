# Used
- fish-shell
- omf
- tmux
- git
- npm



## PROD

### Dependency

1) wget
2) unzip

### Installation

#### Using Git and the bootstrap script

```bash
wget -O - https://gitlab.com/snippets/30815/raw | bash -s linux fish
```

##### OR

```bash
wget https://gitlab.com/alexey-wild/dotfiles/repository/archive.zip?ref=linux-fish
unzip archive.zip ~/.dotfiles
rm archive.zip
bash  ~/.dotfiles/install.sh 
```

## DEV

### Dependency

1) git

### Installation

#### Using Git and the bootstrap script

```bash
git clone -b linux-fish git@gitlab.com:alexey-wild/dotfiles.git ~/.dotfiles && ~/.dotfiles/install.sh
```


### TODO
- https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-2-change-npms-default-directory-to-another-directory
- https://getcomposer.org/doc/00-intro.md