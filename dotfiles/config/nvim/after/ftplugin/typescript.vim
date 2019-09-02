iab <buffer> co const
iab <buffer> re return

noremap <leader>SC /class \(\w\+\) extends React.\(Pure\)\?Component<\([A-Za-z]\+\)> {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}<CR>
noremap <leader>Sc :%s/class \(\w\+\) extends React.\(Pure\)\?Component<\([A-Za-z]\+\)> {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}/function \1(props: \3) {\r\4}/g<CR>V%:s/this\.props/props/g<CR>

noremap <leader>SF /class \(\w\+\) extends React.\(Pure\)\?Component {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}<CR>
noremap <leader>Sf :%s/class \(\w\+\) extends React.\(Pure\)\?Component {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}/function \1() {\r\3}/g<CR>V%:s/this\.props/props/g<CR>
