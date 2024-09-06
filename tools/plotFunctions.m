clear all;
close all;

addpath('../data/')
%Load data
coords = table2array(readtable('coords.csv'));
signalLinear = table2array(readtable('signalLinear.csv'));
signalLinearNoisy = table2array(readtable('signalLinearNoisy.csv'));
signalQuadratic = table2array(readtable('signalQuadratic.csv'));
signalQuadraticNoisy = table2array(readtable('signalQuadraticNoisy.csv'));
signal = table2array(readtable('signal.csv'));
firstDerivativeOfSignal = table2array(readtable('firstDerivativeOfSignal.csv'));
secondDerivativeOfSignal = table2array(readtable('secondDerivativeOfSignal.csv'));
g1_1 = table2array(readtable('g1_1.csv'));
g2_1 = table2array(readtable('g2_1.csv'));

%Plotting g polinomials
figure; plot(g1_1,'-o')
title('g^1 Polynomial')
xlabel('Polynomial Cofficient')
ylabel('Polynomial Cofficient Value')
grid on;

figure; plot(g2_1,'-o')
title('g^2 Polynomial')
xlabel('Polynomial Cofficient')
ylabel('Polynomial Cofficient Value')
grid on;

%Demonstrate that derivatives work
%Original Signal
figure; plot(coords, signal,'o')
hold on;
grid on;
title('One-Dimensional Signal')
xlabel('x')
ylabel('y')
text(0.6,-0.5, 'y = 3x^3-2')

%First Derivative
PDDOFirstDerivative = conv(g1_1,signal);
PDDOFirstDerivative =PDDOFirstDerivative(3:end-2);
figure; plot(coords(3:end-2), firstDerivativeOfSignal(3:end-2),'o')
hold on;
plot(coords(3:end-2), PDDOFirstDerivative(3:end-2),'^')
grid on;
title('First Derivative')
legend('Analytical', 'PDDO')
xlabel('x')
ylabel('y')


PDDOSecondDerivative = conv(g2_1,signal);
PDDOSecondDerivative =PDDOSecondDerivative(4:end-3);
figure; plot(coords(4:end-3), secondDerivativeOfSignal(4:end-3),'o')
hold on;
plot(coords(4:end-3), PDDOSecondDerivative(4:end-3),'^')
grid on;
title('Second Derivative')
legend('Analytical', 'PDDO')
xlabel('x')
ylabel('y')



%Denoising Signals
dt = 0.000000001;
numSteps = 15*5000;
figure; 
plot(coords, signalLinear,'-^','color','b')
hold on;
plot(coords, signalLinearNoisy,'-*','color', 'r')
for i=0:numSteps
    signalLinearNoisy(1:3)=0.5;
    signalLinearNoisy(end-2:end)=2.5;
    filteredLinear = conv(g2_1,signalLinearNoisy);
    filteredLinear = signalLinearNoisy +  dt*filteredLinear(4:end-3);
    signalLinearNoisy = filteredLinear;
    
end
plot(coords, filteredLinear,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Linear Signal')

figure; 
plot(coords, signalQuadratic,'-^','color','b')
hold on;
plot(coords, signalQuadraticNoisy,'-*','color','r')
for i=0:numSteps
    signalQuadraticNoisy(1:3)=0.5;
    signalQuadraticNoisy(end-2:end)=0.5;
    filteredQuadratic = conv(g2_1,signalQuadraticNoisy);
    filteredQuadratic = signalQuadraticNoisy +  dt*filteredQuadratic(4:end-3);
    signalQuadraticNoisy = filteredQuadratic;
    
end
plot(coords, filteredQuadratic,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Quadratic Signal')
xlabel('x')
ylabel('y')


% Calculate RMS
errorFirstDerivative = rmse(firstDerivativeOfSignal(4:end-3),PDDOFirstDerivative(4:end-3));
errorSecondDerivative = rmse(secondDerivativeOfSignal(4:end-3),PDDOSecondDerivative(4:end-3));

