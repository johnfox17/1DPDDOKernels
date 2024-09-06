import PDDOConstants
import numpy as np
from sklearn.neighbors import KDTree
from numpy.linalg import solve


class secondOrder_1_1DPDDOKernel:
    def __init__(self):
        self.dx = 1/PDDOConstants.N
        self.l = PDDOConstants.L
        self.delta = PDDOConstants.HORIZON2*self.dx
        self.bVec = PDDOConstants.BVEC2_1
        self.horizon = PDDOConstants.HORIZON2
        self.kernelDim = PDDOConstants.KERNELDIM2

    def createPDDOKernelMesh(self):
        self.coords = np.arange(self.dx/2, (self.horizon*2 + 1)*self.dx, self.dx)
    
    def calculateXis(self):
        midPDDONodeCoords = self.coords[int((len(self.coords)-1)/2)]
        self.xis = midPDDONodeCoords-self.coords

    def calculateGPolynomials(self):
        deltaMag = self.delta
        diffMat = np.zeros([3,3])
        g = []
        for iNode in range(len(self.coords)):
            currentXi = self.xis[iNode]
            xiMag = np.sqrt(currentXi**2)
            pList = np.array([1, currentXi/deltaMag, (currentXi/deltaMag)**2])
            weight = np.exp(-4*(xiMag/deltaMag)**2)
            diffMat += weight*np.outer(pList,pList)*self.dx
        for iNode in range(len(self.coords)):
            currentXi = self.xis[iNode]
            xiMag = np.sqrt(currentXi**2)
            pList = np.array([1, currentXi/deltaMag, (currentXi/deltaMag)**2])
            weight = np.exp(-4*(xiMag/deltaMag)**2)
            g.append(weight*(np.inner(solve(diffMat,self.bVec), pList))*(self.dx/(self.horizon**2*self.dx**2)))
        self.g = np.array(g).reshape((self.kernelDim,1))
        self.g[np.absolute(self.g)<10**-9]=0


    def createPDDOKernel(self):
        self.calculateXis()
        self.calculateGPolynomials()

    def solve(self):
        self.createPDDOKernelMesh()
        self.createPDDOKernel()

