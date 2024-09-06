import numpy as np
import matplotlib.pyplot as plt
import firstOrder_1_1DPDDOKernel as PDDO1_1
import firstOrder_2_1DPDDOKernel as PDDO1_2
import firstOrder_3_1DPDDOKernel as PDDO1_3
import secondOrder_1_1DPDDOKernel as PDDO2_1
import secondOrder_2_1DPDDOKernel as PDDO2_2
import createSignals
import denoiseSignal1D as denoiseSignal


def main():

    signals = createSignals.createSignals()
    signals.solve()

    PDDOKernel1_1 = PDDO1_1.firstOrder_1_1DPDDOKernel()
    PDDOKernel1_1.solve()
    
    PDDOKernel1_2 = PDDO1_2.firstOrder_2_1DPDDOKernel()
    PDDOKernel1_2.solve()

    PDDOKernel1_3 = PDDO1_3.firstOrder_3_1DPDDOKernel()
    PDDOKernel1_3.solve()

    PDDOKernel2_1 = PDDO2_1.secondOrder_1_1DPDDOKernel()
    PDDOKernel2_1.solve()

    PDDOKernel2_2 = PDDO2_2.secondOrder_2_1DPDDOKernel()
    PDDOKernel2_2.solve()

    np.savetxt('../data/g1_1.csv', PDDOKernel1_1.g, delimiter=",")
    np.savetxt('../data/g1_2.csv', PDDOKernel1_2.g, delimiter=",")
    np.savetxt('../data/g1_3.csv', PDDOKernel1_3.g, delimiter=",")
    np.savetxt('../data/g2_1.csv', PDDOKernel2_1.g, delimiter=",")
    np.savetxt('../data/g2_2.csv', PDDOKernel2_2.g, delimiter=",")

    deNoisedSignal = denoiseSignal.denoiseSignal1D(PDDOKernel2_1.g, signals.quadraticFunctionNoisy)
    deNoisedSignal.solve()


    np.savetxt('../data/signalLinear.csv',  signals.linearFunction, delimiter=",")
    np.savetxt('../data/signalQuadratic.csv', signals.quadraticFunction, delimiter=",")
    np.savetxt('../data/signalLinearNoisy.csv',  signals.linearFunctionNoisy, delimiter=",")
    np.savetxt('../data/signalQuadraticNoisy.csv', signals.quadraticFunctionNoisy, delimiter=",")

    np.savetxt('../data/signal.csv', signals.signal, delimiter=",")
    np.savetxt('../data/firstDerivativeOfSignal.csv', signals.firstDerivativeOfSignal, delimiter=",")
    np.savetxt('../data/secondDerivativeOfSignal.csv', signals.secondDerivativeOfSignal, delimiter=",")



if __name__ == "__main__":
    main()

