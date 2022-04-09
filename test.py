import pynvml

pynvml.nvmlInit()

device_indices = range(pynvml.nvmlDeviceGetCount())
handles = [pynvml.nvmlDeviceGetHandleByIndex(i) for i in device_indices]
print(device_indices)

for handle in handles:
    name = pynvml.nvmlDeviceGetName(handle)
    device = name.decode("utf-8")
    power_usage = pynvml.nvmlDeviceGetPowerUsage(handle) / 1000
    print(f"{device} uses {power_usage} W")

pynvml.nvmlShutdown()
