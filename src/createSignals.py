import PDDOConstants
import numpy as np

class createSignals:
    def __init__(self):
        self.N = PDDOConstants.N
        self.L = PDDOConstants.L
        self.dx = self.L/self.N
        
    def createCoordinates(self):
        self.coords = np.arange(self.dx/2, self.L, self.dx)    
    
    def createLinearFunction(self):
        self.linearFunction = 2*self.coords + 0.5
    
    def createQuadraticFunction(self):
        self.quadraticFunction = -2*(self.coords - 0.5)**2 + 1
    
    def addNoise(self):
        noise = np.random.normal(0, 0.09, self.N)
        self.linearFunctionNoisy = self.linearFunction + noise
        self.quadraticFunctionNoisy = self.quadraticFunction + noise

    def solve(self):
        self.createCoordinates()
        self.createLinearFunction()
        self.createQuadraticFunction()
        self.addNoise()

