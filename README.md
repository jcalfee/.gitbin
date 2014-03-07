USAGE
------------
[USAGE.md](USAGE.md)


.gitbin and .bashrc setup
------------
This is a quick copy and paste method I use to setup a new install.

Copy and paste as it this applies to you:
```bash
cd $HOME
sudo apt-get install git
git clone https://github.com/jcalfee/.gitbin.git
```

Setup .bashrc
------------

```bash
## Quick access to edit .bashrc.  The nice thing here is that the 
## .basrc file is loaded after editing.
##  
## Note, commands here should not produce any output (or errors).  The 
## last time I checked, output like this caused SSH to terminate preventing
## connections to the host.
## 
## Beyond the first line, the text below is calling its own alias, putting
## `vi` into insert mode, then adding common commands to the top of .bashrc. 
## Press ESC then use two capitol Zs to exit and save (`ZZ`) or `:q!` to exit 
## without saving.
## 
alias vb="vi ~/.bashrc && . ~/.bashrc"
vb
i
alias vb="vi ~/.bashrc && . ~/.bashrc"

export PATH=$PATH:$HOME/.gitbin

. $HOME/.gitbin/.encfs-aliases
. $HOME/.gitbin/.git-aliases

```

