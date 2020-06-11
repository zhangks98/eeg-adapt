'''Training script generator for subject-independent classification.
'''
with open('script.sh.template', 'r') as f:
    sh_template = f.read()
with open('train.pbs.template', 'r') as f:
    pbs_template = f.read()


def list_to_str(l):
    return ' '.join(map(str, l))


all_folds = list(range(54))
command_template = "python train_base.py $datapath $outpath -fold {0} -gpu {1} > $logpath/stdout.f{0}.out &"
for i, j in enumerate(range(0, len(all_folds), 8)):
    folds = all_folds[j:j+8]
    commands = []
    for ind, fold in enumerate(folds):
        commands.append(command_template.format(fold, ind))
    commands.append('wait')
    content = sh_template + '\n'.join(commands)
    with open('script.' + str(i) + '.sh', 'w') as f:
        f.write(content)
    content = pbs_template.format(i)
    with open('train.' + str(i) + '.pbs', 'w') as f:
        f.write(content)
