import PDDOConstants
from scipy import signal
import numpy as np

class denoiseSignal1D:
        def __init__(self, kernel, noisySignal):
            self.kernel = kernel
            self.noisySignal = noisySignal.reshape((PDDOConstants.N,1))
            self.T = PDDOConstants.T
            self.dt = PDDOConstants.dt
            self.N = PDDOConstants.N
            self.dx = 1/self.N
            self.horizon = PDDOConstants.HORIZON2 
        
        def convolve(self):
            return signal.convolve(self.noisySignal, self.kernel, mode='same')

        def solve(self):
            numTimeSteps = int(np.round(self.T/self.dt))
            kappa = self.dt*self.dx/(self.horizon*self.dx)**2
            for iTimeStep in range(numTimeSteps):
                #noisySignalAux = self.noisySignal
                self.noisySignal = self.noisySignal - kappa*self.convolve()
                
                np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/signal.csv', self.noisySignal, delimiter=",")
                print('Done')
                a = input('').split(" ")[0]

            self.deNoisedSignal = self.noisySignal



