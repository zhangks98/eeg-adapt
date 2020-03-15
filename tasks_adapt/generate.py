with open('script.sh.template', 'r') as f:
    sh_template = f.read()
with open('train.pbs.template', 'r') as f:
    pbs_template = f.read()


def list_to_str(l):
    return ' '.join(map(str, l))


scheme = 1
command_template = "python train_adapt.py $datapath $modelpath ./result_adapt/r{1} -scheme {0} -trfrate {1} -gpu {2} > $logpath/stdout.r{1}.out &"

commands = []
for ind, rate in enumerate(range(10, 81, 10)):
    commands.append(command_template.format(scheme, rate, ind))
commands.append('wait')
content = sh_template + '\n'.join(commands)
with open('script.' + str(0) + '.sh', 'w') as f:
    f.write(content)
content = pbs_template.format(0)
with open('train.' + str(0) + '.pbs', 'w') as f:
    f.write(content)

commands = []
for ind, rate in enumerate(range(90, 101, 10)):
    commands.append(command_template.format(scheme, rate, ind))
commands.append('wait')
content = sh_template + '\n'.join(commands)
with open('script.' + str(1) + '.sh', 'w') as f:
    f.write(content)
content = pbs_template.format(1)
with open('train.' + str(1) + '.pbs', 'w') as f:
    f.write(content)
