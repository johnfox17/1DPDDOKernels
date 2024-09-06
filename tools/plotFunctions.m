clear all;
%close all;

addpath('../data/')
%Load data
signalLinear = table2array(readtable('signalLinear.csv'));
signalLinearNoisy = table2array(readtable('signalLinearNoisy.csv'));
signalQuadratic = table2array(readtable('signalQuadratic.csv'));
signalQuadraticNoisy = table2array(readtable('signalQuadraticNoisy.csv'));
signal = table2array(readtable('signal.csv'));
firstDerivativeOfSignal = table2array(readtable('firstDerivativeOfSignal.csv'));
secondDerivativeOfSignal = table2array(readtable('secondDerivativeOfSignal.csv'));
g1_1 = table2array(readtable('g1_1.csv'));
g2_1 = table2array(readtable('g2_1.csv'));
coords = table2array(readtable('coords.csv'));
%Demonstrate that derivatives work
%First Derivative
PDDOFirstDerivative = conv(g1_1,signal);
PDDOFirstDerivative =PDDOFirstDerivative(3:end-2);
figure; plot(firstDerivativeOfSignal(3:end-2),'o')
hold on;
plot(PDDOFirstDerivative(3:end-2),'^')
grid on;
title('First Derivative')
legend('Analytical', 'PDDO')

PDDOSecondDerivative = conv(g2_1,signal);
PDDOSecondDerivative =PDDOSecondDerivative(4:end-3);
figure; plot(secondDerivativeOfSignal(4:end-3),'o')
hold on;
plot(PDDOSecondDerivative(4:end-3),'^')
grid on;
title('Second Derivative')
legend('Analytical', 'PDDO')



dt = 0.000000001;
numSteps = 15*5000;



figure; 
plot(signalLinear,'-^','color','b')
hold on;
plot(signalLinearNoisy,'-*','color', 'r')
for i=0:numSteps
    filteredLinear = conv(g2_1,signalLinearNoisy);
    filteredLinear = signalLinearNoisy +  dt*filteredLinear(4:end-3);
    signalLinearNoisy = filteredLinear;
    
end
plot(filteredLinear,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Linear Signal')

figure; 
plot(signalQuadratic,'-^','color','b')
hold on;
plot(signalQuadraticNoisy,'-*','color','r')
for i=0:numSteps
    filteredQuadratic = conv(g2_1,signalQuadraticNoisy);
    filteredQuadratic = signalQuadraticNoisy +  dt*filteredQuadratic(4:end-3);
    signalQuadraticNoisy = filteredQuadratic;
    
end
plot(filteredQuadratic,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Quadratic Signal')
