### Install

##### Ubuntu
```
sudo apt install neovim
```

```
sudo apt-get install ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
```

After installation process, replace your init.vim file and run `:PlugIinstall`
