local M = {}

M.eyes = {"◡◡", "⊙⊙", "◠◠", "⊙⊙"}
M.wedges = {"◴", "◷", "◶", "◵",}
M.wedges2 = { "○", "◔","◗", "◕", "●"}
M.horizontal_bar = { "▉", "▊", "▋", "▌", "▍", "▎"," ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", }
M.double_point = {"▹▹", "▸▹", "▹▸", "▸▸", "▹▸"}
M.diamonds = {"◇", "◈", "◆","◈", "◇"} 
M.running_man = { 'ﰌ',  '省'          }
M.quarter_circles =  {"◜ ", " ◝", " ◞", "◟ "}
M.half_circles = {"◐", "◓", "◑", "◒"}
M.equals = {"≔", "≒", "≓", "≕","≓", "≒", "≔" }
M.circles = {"⊶", "⊷"}
M.smilers = {"☺", "☻"}
M.vert_drop = {"䷀", "䷪",  "䷍", "䷈", "䷉", "䷌", "䷫"}
M.arrows = {"←", "↖", "↑", "↗", "→", "↘", "↓", "↙"}
M.quadrants = {"▖", "▘", "▝", "▗"}

M.dots = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
M.dots2 = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
M.dots3 = { "⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓" }
M.dots3 = { "⠄", "⠆", "⠇", "⠋", "⠙", "⠸", "⠰", "⠠", "⠰", "⠸", "⠙", "⠋", "⠇", "⠆" }
M.dots4 = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}
M.dots5 = { "⠋", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋" }
M.dots6 = { "⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠴", "⠲", "⠒", "⠂", "⠂", "⠒", "⠚", "⠙", "⠉", "⠁" }
M.dots7 = { "⠈", "⠉", "⠋", "⠓", "⠒", "⠐", "⠐", "⠒", "⠖", "⠦", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈" }
M.dots8 = { "⠁", "⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈", "⠈" }
M.dots9 = { "⢹", "⢺", "⢼", "⣸", "⣇", "⡧", "⡗", "⡏" }
M.dots10 = { "⢄", "⢂", "⢁", "⡁", "⡈", "⡐", "⡠" }
M.dots11 = { "⠁", "⠂", "⠄", "⡀", "⢀", "⠠", "⠐", "⠈" }
M.dots12 = { "⢀⠀", "⡀⠀", "⠄⠀", "⢂⠀", "⡂⠀", "⠅⠀", "⢃⠀", "⡃⠀", "⠍⠀", "⢋⠀", "⡋⠀", "⠍⠁", "⢋⠁", "⡋⠁", "⠍⠉", "⠋⠉", "⠋⠉", "⠉⠙", "⠉⠙", "⠉⠩", "⠈⢙", "⠈⡙", "⢈⠩", "⡀⢙", "⠄⡙", "⢂⠩", "⡂⢘", "⠅⡘", "⢃⠨", "⡃⢐", "⠍⡐", "⢋⠠", "⡋⢀", "⠍⡁", "⢋⠁", "⡋⠁", "⠍⠉", "⠋⠉", "⠋⠉", "⠉⠙", "⠉⠙", "⠉⠩", "⠈⢙", "⠈⡙", "⠈⠩", "⠀⢙", "⠀⡙", "⠀⠩", "⠀⢘", "⠀⡘", "⠀⠨", "⠀⢐", "⠀⡐", "⠀⠠", "⠀⢀", "⠀⡀" }
M.dots13 = { "⣼", "⣹", "⢻", "⠿", "⡟", "⣏", "⣧", "⣶" }
M.sand = { "⠁", "⠂", "⠄", "⡀", "⡈", "⡐", "⡠", "⣀", "⣁", "⣂", "⣄", "⣌", "⣔", "⣤", "⣥", "⣦", "⣮", "⣶", "⣷", "⣿", "⡿", "⠿", "⢟", "⠟", "⡛", "⠛", "⠫", "⢋", "⠋", "⠍", "⡉", "⠉", "⠑", "⠡", "⢁" }

return M