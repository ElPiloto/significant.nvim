# significant.nvim

```
███████╗██╗ ██████╗ ███╗   ██╗██╗███████╗██╗ ██████╗ █████╗ ███╗   ██╗████████╗
██╔════╝██║██╔════╝ ████╗  ██║██║██╔════╝██║██╔════╝██╔══██╗████╗  ██║╚══██╔══╝
███████╗██║██║  ███╗██╔██╗ ██║██║█████╗  ██║██║     ███████║██╔██╗ ██║   ██║   
╚════██║██║██║   ██║██║╚██╗██║██║██╔══╝  ██║██║     ██╔══██║██║╚██╗██║   ██║   
███████║██║╚██████╔╝██║ ╚████║██║██║     ██║╚██████╗██║  ██║██║ ╚████║   ██║   
╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   
```


```
███████ ██  ██████  ███    ██ ██ ███████ ██  ██████  █████  ███    ██ ████████ 
██      ██ ██       ████   ██ ██ ██      ██ ██      ██   ██ ████   ██    ██    
███████ ██ ██   ███ ██ ██  ██ ██ █████   ██ ██      ███████ ██ ██  ██    ██    
     ██ ██ ██    ██ ██  ██ ██ ██ ██      ██ ██      ██   ██ ██  ██ ██    ██    
███████ ██  ██████  ██   ████ ██ ██      ██  ██████ ██   ██ ██   ████    ██    
```

When you've got something significant to say.

## Requirements

This plugin requires:
* packer.nvim
* penlight luarocks

You can use another package manager as long as you make sure you've got
penlight luarocks installed and available in lua's `package.path`.

## Installation Via Packer

```
  use {
  	'ElPiloto/significant.nvim',
	rocks = {{'penlight', version = 1.13.1}}
  }
```
