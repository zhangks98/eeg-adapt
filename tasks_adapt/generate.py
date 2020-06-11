'''Training script generator for subject-adaptive classification.
'''
from os import makedirs
from os.path import join as pjoin

with open(pjoin('tasks_adapt', 'script.sh.template'), 'r') as f:
    sh_template = f.read()
with open(pjoin('tasks_adapt', 'train.pbs.template'), 'r') as f:
    pbs_template = f.read()


def list_to_str(l):
    return ' '.join(map(str, l))


command_template = "python train_adapt.py $datapath $modelpath ./result_adapt{0}/r{1} -scheme {0} -trfrate {1} -gpu {2} > $logpath/stdout.r{1}.out &"

for scheme in range(1, 6):
    tasks_dir = "tasks_adapt{}".format(scheme)
    result_dir = "result_adapt{}".format(scheme)

    makedirs(tasks_dir, exist_ok=True)
    for rate in range(10, 101, 10):
        makedirs(pjoin(result_dir, "r{}".format(rate)), exist_ok=True)

    commands = []
    for ind, rate in enumerate(range(10, 81, 10)):
        commands.append(command_template.format(scheme, rate, ind))
    commands.append('wait')
    content = sh_template.format(scheme) + '\n'.join(commands)
    ncpu = 40
    ngpu = 8
    with open(pjoin(tasks_dir, 'script.' + str(0) + '.sh'), 'w') as f:
        f.write(content)
    content = pbs_template.format(0, scheme, ncpu, ngpu)
    with open(pjoin(tasks_dir, 'train.' + str(0) + '.pbs'), 'w') as f:
        f.write(content)

tasks_dir = "tasks_adaptr"
command_template = "python train_adapt.py $datapath $modelpath ./result_adapt{0}/r{1} -scheme {0} -trfrate {1} -gpu {2} > $logpath/stdout.s{0}.r{1}.out &"
makedirs(tasks_dir, exist_ok=True)
commands = []
for scheme in range(1, 5):
    for ind, rate in enumerate(range(90, 101, 10)):
        igpu = (scheme - 1) * 2 + ind
        commands.append(command_template.format(scheme, rate, igpu))
commands.append('wait')
content = sh_template.format('r') + '\n'.join(commands)
ncpu = 40
ngpu = 8
with open(pjoin(tasks_dir, 'script.' + str(0) + '.sh'), 'w') as f:
    f.write(content)
content = pbs_template.format(0, 'r', ncpu, ngpu)
with open(pjoin(tasks_dir, 'train.' + str(0) + '.pbs'), 'w') as f:
    f.write(content)

commands = []
scheme = 5
for ind, rate in enumerate(range(90, 101, 10)):
    commands.append(command_template.format(scheme, rate, ind))
commands.append('wait')
content = sh_template.format('r') + '\n'.join(commands)
ncpu = 10
ngpu = 2
with open(pjoin(tasks_dir, 'script.' + str(1) + '.sh'), 'w') as f:
    f.write(content)
content = pbs_template.format(1, 'r', ncpu, ngpu)
with open(pjoin(tasks_dir, 'train.' + str(1) + '.pbs'), 'w') as f:
    f.write(content)
