from cProfile import label
from turtle import color, pos
import matplotlib.pyplot as plt
import json
import numpy as np

non_quant_path      = './results/eeg_adapt_unchanged'
quant_path_2bit     = './Presentation_Results/02bit_accuracy_test'
adapted_quant_path  = './results/2bit_skip50'

non_quant_results   = []
quant_results       = []
adapted_results     = []

for i in range(1,55):
    f1 = open('./'+ non_quant_path      +'/test_subj_' + str(i) +'.json')
    f2 = open('./'+ quant_path_2bit     +'/test_subj_' + str(i) +'.json')
    f3 = open('./'+ adapted_quant_path  +'/test_subj_' + str(i) +'.json')

    x1 = json.load(f1)
    x2 = json.load(f2)
    x3 = json.load(f3)

    non_quant_results.append((1-x1['misclass'])*100)
    quant_results.append((1-x2['misclass'])*100)
    adapted_results.append((1-x3['misclass'])*100)

    f1.close()
    f2.close()
    f3.close()

non_quant_array = np.array(non_quant_results)
quant_array     = np.array(quant_results)
adapted_array   = np.array(adapted_results)

# plt.scatter(range(1,55), non_quant_results, label="Non-Quant",  color='green', marker='x')
# plt.scatter(range(1,55), quant_results,     label="Quant",      color='orange', marker='+')
# plt.scatter(range(1,55), adapted_results,   label="Adapted",    color='purple', marker='.')



# plt.xlim((0.5,54.5))
# plt.xticks(range(1,55))
# plt.xlabel("Subject")
# plt.ylabel("Mean Accuracy (%)")
# plt.legend()
# plt.show()

x = np.arange(54)  # the label locations
width = 0.2 # the width of the bars

plt.rcParams["figure.figsize"] = (20,18)
fig, ax = plt.subplots()
rects1 = ax.bar(x + 1 - width, non_quant_results,   width,      label='Non Quant',  color='green' )
rects2 = ax.bar(x + 1        , quant_results,       width,      label='Quant',      color='orange' )
rects3 = ax.bar(x + 1 + width, adapted_results,     width,      label='Adapt',      color='purple' )

ax.axhline(y=non_quant_array.mean(),   color='green', linestyle='--', label="Non Quant Mean")
ax.axhline(y=quant_array.mean(),       color='orange', linestyle='--', label="Quant Mean")
ax.axhline(y=adapted_array.mean(),     color='purple', linestyle='--', label="Adapted Mean")

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Decoding Accuracy (%)', fontsize = 24)
ax.set_xlabel('Subject',               fontsize = 24)

plt.xticks(fontsize=16)
plt.yticks(fontsize=16)
ax.set_xticks(x+1)
ax.set_xlim((0.5, 54.5))
ax.set_ylim((40, 105))
ax.legend(loc=1,prop={'size': 20})

# ax.bar_label(rects1, padding=3)
# ax.bar_label(rects2, padding=3)

fig.tight_layout()

#plt.show()
plt.savefig('image.png', bbox_inches='tight',pad_inches = 0)