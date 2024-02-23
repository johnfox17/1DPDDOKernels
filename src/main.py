import numpy as np
import firstOrder_1_1DPDDOKernel as PDDO1_1
import firstOrder_2_1DPDDOKernel as PDDO1_2
import firstOrder_3_1DPDDOKernel as PDDO1_3
import secondOrder_1_1DPDDOKernel as PDDO2_1
import secondOrder_2_1DPDDOKernel as PDDO2_2
import createSignals

def main():

    signals = createSignals.createSignals()
    signals.solve()
    '''PDDOKernel1_1 = PDDO1_1.firstOrder_1_1DPDDOKernel()
    PDDOKernel1_1.solve()

    PDDOKernel1_2 = PDDO1_2.firstOrder_2_1DPDDOKernel()
    PDDOKernel1_2.solve()

    PDDOKernel1_3 = PDDO1_3.firstOrder_3_1DPDDOKernel()
    PDDOKernel1_3.solve()

    PDDOKernel2_1 = PDDO2_1.secondOrder_1_1DPDDOKernel()
    PDDOKernel2_1.solve()

    PDDOKernel2_2 = PDDO2_2.secondOrder_2_1DPDDOKernel()
    PDDOKernel2_2.solve()'''

    '''np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/g1_1.csv', PDDOKernel1_1.g, delimiter=",")
    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/g1_2.csv', PDDOKernel1_2.g, delimiter=",")

    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/g1_3.csv', PDDOKernel1_3.g, delimiter=",")

    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/g2_1.csv', PDDOKernel2_1.g, delimiter=",")

    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/g2_2.csv', PDDOKernel2_2.g, delimiter=",")

    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/xi2_2.csv', PDDOKernel2_2.xis, delimiter=",")

    np.savetxt('/home/doctajfox/Documents/Thesis/1DPDDOKernels/data/coords.csv', PDDOKernel2_1.coords, delimiter=",")'''


if __name__ == "__main__":
    main()

