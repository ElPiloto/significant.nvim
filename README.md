# significant.nvim

When you've got something significant to say.

```
                                                                                                
 ad88888ba  88   ,ad8888ba,  888b      88        ad88                                            
d8"     "8b 88  d8"'    `"8b 8888b     88  ""   d8"   ""                                    ,d   
Y8,         88 d8'           88 `8b    88       88                                          88   
`Y8aaaaa,   88 88            88  `8b   88  88 MM88MMM 88  ,adPPYba, ,adPPYYba, 8b,dPPYba, MM88MMM
  `"""""8b, 88 88      88888 88   `8b  88  88   88    88 a8"     "" ""     `Y8 88P'   `"8a  88   
        `8b 88 Y8,        88 88    `8b 88  88   88    88 8b         ,adPPPPP88 88       88  88   
Y8a     a8P 88  Y8a.    .a88 88     `8888  88   88    88 "8a,   ,aa 88,    ,88 88       88  88,  
 "Y88888P"  88   `"Y88888P"  88      `888  88   88    88  `"Ybbd8"' `"8bbdP"Y8 88       88  "Y888
                                                                                                
```

https://user-images.githubusercontent.com/629190/192169786-64f47935-4aa0-4dac-bfd4-2fc28818afe4.mov

## Installation Via Packer

```
  use {'ElPiloto/significant.nvim'}
```

Should work fine to install via another method.

## Usage

Place the 'dots4' animation on line 10 with a delay of 300ms between updates.
```
:lua require('significant').start_animated_sign(10, 'dots4', 300)
```

Stop the previously placed animation at line 10.
```
:lua require('significant').stop_animated_sign(10)

```

Stop and remove the previously placed animation at line 10.
```
:lua require('significant').stop_animated_sign(10, {unplace_sign=true})
```

Stop and replace the previously placed animation at line 10 with a custom sign like "✓"
```
:lua vim.fn.sign_define('YourSign', {text = '✓'})
:lua require('significant').stop_animated_sign(10, {unplace_sign=false, sign_name='YourSign' })
```

NOTE: Even if you've since inserted extra lines such that the placed sign is no longer on line 10, you **still** need to refer to it as line 10.

Check out the demo:
```
:lua require('significant.demo')
```


## TODO:

- [ ] Add explicit mechanism to extend sprites.
- [ ] Utility to stop whatever animation is on the current line.
- [X] Add option to set sprite used after animation finishes.
- [ ] Implement principled approach to timeout - right now the animation just plays for 10000 updates.
- [ ] Add logging.
- [ ] Right now we cannot change an animation, we can only start/stop it. We should be able to change sprites.
- [X] We do not use penlight, so maybe remove it as a dependency for now.
- [ ] Principled approach to colors
- [ ] Configuration options like default animation, default color, etc.
- [ ] Figure out what buffer/window events should kill our animations.
