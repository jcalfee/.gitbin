USAGE
------------
[USAGE.md](USAGE.md)


.gitbin and .bashrc setup
------------
This is a quick copy and paste method I use to get setup.  First make sure Git is installed:


Copy and paste as it this applies to you:
```bash
cd $HOME
sudo apt-get install git
git clone https://github.com/jcalfee/.gitbin.git
```

Setup .bashrc
------------

```
# Quick access to edit .bashrc.  The file is re-sourced (re-ran) 
# after you exit the editor.
alias vb="vi ~/.bashrc && . ~/.bashrc"
vb
i
alias vb="vi ~/.bashrc && . ~/.bashrc"

export PATH=$PATH:$HOME/.gitbin

. $HOME/.gitbin/.encfs-aliases
. $HOME/.gitbin/.git-aliases
```

