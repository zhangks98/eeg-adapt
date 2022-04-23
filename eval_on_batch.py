def eval_on_batch(self, inputs, targets):
        """
        Evaluate given inputs and targets.
        
        Parameters
        ----------
        inputs: `torch.autograd.Variable`
        targets: `torch.autograd.Variable`

        Returns
        -------
        predictions: `torch.autograd.Variable`
        loss: `torch.autograd.Variable`

        """
        self.model.eval()
        with th.no_grad():
            measurements = []
            import os
            for _ in range(1000):
                start = time.time()
                input_vars = np_to_var(inputs, pin_memory=self.pin_memory)
                target_vars = np_to_var(targets, pin_memory=self.pin_memory)
                th.save(input_vars, 'input_vars.pt')
                th.save(target_vars, 'target_vars.pt')
                if self.cuda:
                    input_vars = input_vars.cuda()
                    target_vars = target_vars.cuda()
                #print(input_vars.size())
                        
                outputs = self.model(input_vars)
                end = time.time()
                runtime = end - start
                measurements.append(len(target_vars)/runtime)
            print("len: ", len(target_vars))
            results = np.array(measurements)
            res = {}
            #res['Throughput (images/second)'] = throughput
            res['Mean Throughput (images/sec)'] = results.mean()
            res['Std'] = results.std()
            res['N']   = len(results)
            res['Batch Size'] =len(target_vars)

            try:
                os.remove("throughput_metrics.txt")
            except FileNotFoundError:
                pass

            file = open("throughput_metrics.txt", "w")
            file.write(str(res))
            file.close()
            print("Results written to throughput_metrics.txt")

            loss = self.loss_function(outputs, target_vars)
            if hasattr(outputs, "cpu"):
                outputs = outputs.cpu().detach().numpy()
            else:
                # assume it is iterable
                outputs = [o.cpu().detach().numpy() for o in outputs]
            loss = loss.cpu().detach().numpy()
        return outputs, loss