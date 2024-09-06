import PDDOConstants
import numpy as np

class createSignals:
    def __init__(self):
        self.N = PDDOConstants.N
        self.L = PDDOConstants.L
        self.dx = self.L/self.N
        self.m = PDDOConstants.M
        self.b = PDDOConstants.B
        self.a = PDDOConstants.A
        self.h = PDDOConstants.H
        self.k = PDDOConstants.K
        self.r = PDDOConstants.R
        self.alpha = PDDOConstants.ALPHA
        self.beta = PDDOConstants.BETA
        self.gamma = PDDOConstants.GAMMA
        
    def createCoordinates(self):
        self.coords = np.arange(self.dx/2, self.L, self.dx)    
    
    def createLinearFunction(self):
        self.linearFunction = self.m*self.coords + self.b
    
    def createQuadraticFunction(self):
        self.quadraticFunction = self.a*(self.coords + self.h)**self.r \
                + self.k
    def createOneDimensionalSignal(self):
        self.signal = self.alpha*self.coords**self.gamma + self.beta
    
    def calculateAnalyticalDerivativesOfSignal(self):
        self.firstDerivativeOfSignal = self.alpha*self.gamma*self.coords**(self.gamma-1)
        self.secondDerivativeOfSignal = self.alpha*self.gamma*(self.gamma-1)*self.coords**(self.gamma-2)
    
    def addNoise(self):
        noise = np.random.normal(0, 0.05, self.N)
        self.linearFunctionNoisy = self.linearFunction + noise
        self.linearFunctionNoisy = self.linearFunctionNoisy.reshape((self.N,1))
        self.quadraticFunctionNoisy = self.quadraticFunction + noise
        self.quadraticFunctionNoisy = self.quadraticFunctionNoisy.reshape((self.N,1))

    def solve(self):
        self.createCoordinates()
        self.createLinearFunction()
        self.createQuadraticFunction()
        self.createOneDimensionalSignal()
        self.calculateAnalyticalDerivativesOfSignal()
        self.addNoise()

