'''Training script generator for subject-specific classification.
'''
with open('script.sh.template', 'r') as f:
    sh_template = f.read()
with open('train.pbs.template', 'r') as f:
    pbs_template = f.read()

command_template = 'python train_within.py $datapath $outpath -start {0} -end {1} -gpu {2} > $logpath/stdout.f{2}.out &'

commands = []
for i in range(8):
    start = i * 7 + 1
    end = min(i * 7 + 8, 55)
    commands.append(command_template.format(start, end, i))

commands.append('wait')
content = sh_template + '\n'.join(commands)
with open('script.' + str(0) + '.sh', 'w') as f:
    f.write(content)
content = pbs_template.format(0)
with open('train.' + str(0) + '.pbs', 'w') as f:
    f.write(content)
