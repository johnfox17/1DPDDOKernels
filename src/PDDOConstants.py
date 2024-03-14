import numpy as np
#Defining constants for PDDO algorithm
L = 1
N = 512
M = 2.0                 #Slope of linear function
B = 0.5                 #Y-intercept of linear function
A = -2.0                #Coefficient of quadratic function
H = -0.5                #X-coordinate of vertex of parabola
K = 1.0                 #Y-coordinate of vertex of parabola
R = 2.0                 #Exponent of parabola
ALPHA = 3.0             #Coefficient of independent variable of signal  
BETA = -2.0             #Y shift of signal
GAMMA = 3.0             #Exponent of signal
HORIZON1 = 2.015
HORIZON2 = 3.015
HORIZON4 = 5.015 #Because the PDE is 4th order
BVEC0 = np.array([1])
BVEC1_1 = np.array([0, 1])
BVEC1_2 = np.array([0, 1, 0])
BVEC1_3 = np.array([0, 1, 0, 0])
BVEC2_1 = np.array([0, 0, 2])
BVEC2_2 = np.array([0, 0, 2, 0])
BVEC2_3 = np.array([0, 0, 2, 0, 0])
BVEC4_1 = np.array([0, 0, 0, 0, 24])
BVEC4_2 = np.array([0, 0, 0, 0, 24, 0])
BVEC4_3 = np.array([0, 0, 0, 0, 24, 0, 0])


KERNELDIM1 = 5 #2*HORIZON1+1
KERNELDIM2 = 7
KERNELDIM4 = 11

