iab <buffer> co const
iab <buffer> re return

noremap <leader>SC /^export default class \(\w\+\) extends React.\(Pure\)\?Component<Props> {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}<CR>
noremap <leader>Sc :%s/^export default class \(\w\+\) extends React.\(Pure\)\?Component<Props> {\n  public render() {\n\(\(^$\n\\|    .*\n\)*\)  }\n}/export default function \1(props: Props) {\r\3}/g<CR>V%:s/this\.props/props/g<CR>
