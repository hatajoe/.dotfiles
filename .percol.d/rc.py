# Vim like
percol.import_keymap({
    "C-n" : lambda percol: percol.command.select_next(),
    "C-p" : lambda percol: percol.command.select_previous(),
    "C-f" : lambda percol: percol.command.select_next_page(),
    "C-b" : lambda percol: percol.command.select_previous_page(),
    "C-m" : lambda percol: percol.finish(),
})

