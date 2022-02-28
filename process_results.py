import json
import numpy as np
import sys

path = sys.argv[1]

results = np.zeros(54)

for i in range(1,55):
    f = open('./'+ path +'/test_subj_' + str(i) +'.json')
    x = json.load(f)
    #print('Acuraccy:', 1-x['misclass'])
    results[i-1] = 1-x['misclass']
    print(1-x['misclass'])
    f.close()


print("------Results------")
print("Mean: ", results.mean())
print("Std.: ", results.std())

data = {}
data['Mean'] = results.mean()
data['Std']  = results.std()

with open('./'+ path +'/data.json', 'w') as outfile:
    json.dump(data, outfile)