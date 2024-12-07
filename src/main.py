import numpy as np
import matplotlib.pyplot as plt
import firstOrder_1_1DPDDOKernel as PDDO1_1
import firstOrder_2_1DPDDOKernel as PDDO1_2
import firstOrder_3_1DPDDOKernel as PDDO1_3
import secondOrder_3_1DPDDOKernel as PDDO2_3
import secondOrder_4_1DPDDOKernel as PDDO2_4
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

    PDDOKernel2_3 = PDDO2_3.secondOrder_3_1DPDDOKernel()
    PDDOKernel2_3.solve()

    PDDOKernel2_4 = PDDO2_4.secondOrder_4_1DPDDOKernel()
    PDDOKernel2_4.solve()

    np.savetxt('../data/g1_1.csv', PDDOKernel1_1.g, delimiter=",")
    np.savetxt('../data/g1_2.csv', PDDOKernel1_2.g, delimiter=",")
    np.savetxt('../data/g1_3.csv', PDDOKernel1_3.g, delimiter=",")
    np.savetxt('../data/g2_3.csv', PDDOKernel2_3.g, delimiter=",")
    np.savetxt('../data/g2_4.csv', PDDOKernel2_4.g, delimiter=",")

    #deNoisedSignal = denoiseSignal.denoiseSignal1D(PDDOKernel2_1.g, signals.quadraticFunctionNoisy)
    #deNoisedSignal.solve()

    np.savetxt('../data/signalCoords.csv',  signals.coords, delimiter=",")
    np.savetxt('../data/signalLinear.csv',  signals.linearFunction, delimiter=",")
    np.savetxt('../data/signalQuadratic.csv', signals.quadraticFunction, delimiter=",")
    np.savetxt('../data/signalLinearNoisy.csv',  signals.linearFunctionNoisy, delimiter=",")
    np.savetxt('../data/signalQuadraticNoisy.csv', signals.quadraticFunctionNoisy, delimiter=",")

    np.savetxt('../data/signal.csv', signals.signal, delimiter=",")
    np.savetxt('../data/firstDerivativeOfSignal.csv', signals.firstDerivativeOfSignal, delimiter=",")
    np.savetxt('../data/secondDerivativeOfSignal.csv', signals.secondDerivativeOfSignal, delimiter=",")



if __name__ == "__main__":
    main()

