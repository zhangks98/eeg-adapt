with open('script.sh.template', 'r') as f:
    sh_template = f.read()
with open('train.pbs.template', 'r') as f:
    pbs_template = f.read()
for i in range(8):
    start = i * 7 + 1
    end = min(i * 7 + 8, 55)
    content = sh_template.format(start, end)
    with open('script.' + str(i) + '.sh', 'w') as f:
        f.write(content)
    content = pbs_template.format(i)
    with open('train.' + str(i) + '.pbs', 'w') as f:
        f.write(content)
