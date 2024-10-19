clear all;
close all;

addpath('../data/')
%Load data
coords = table2array(readtable('signalCoords.csv'));
signalLinear = table2array(readtable('signalLinear.csv'));
signalLinearNoisy = table2array(readtable('signalLinearNoisy.csv'));
signalQuadratic = table2array(readtable('signalQuadratic.csv'));
signalQuadraticNoisy = table2array(readtable('signalQuadraticNoisy.csv'));
signal = table2array(readtable('signal.csv'));
firstDerivativeOfSignal = table2array(readtable('firstDerivativeOfSignal.csv'));
secondDerivativeOfSignal = table2array(readtable('secondDerivativeOfSignal.csv'));
g1_1 = table2array(readtable('g1_1.csv'));
g2_1 = table2array(readtable('g2_1.csv'));

%Denoising Signals
finalTime = 0.021175;
rootMSE = [];
dt = 0.000001;
% numSteps = 15*5000;
numSteps = finalTime/dt;
figure; 
plot(coords, signalLinear,'-^','color','b')
hold on;
plot(coords, signalLinearNoisy,'-*','color', 'r')
for i=1:numSteps
    
    filteredLinear = conv(g2_1,signalLinearNoisy);
    filteredLinear = signalLinearNoisy +  dt*filteredLinear(4:end-3);
    signalLinearNoisy = filteredLinear;
    %Boundry Conditions
    signalLinearNoisy(1:3)=0.5;
    signalLinearNoisy(end-2:end)=2.5;
    
    rootMSE = [rootMSE, rmse(signalLinear,signalLinearNoisy)];
    
end
plot(coords, signalLinearNoisy,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Linear Signal')

%Plotting RMSE
timeStep = 1:numSteps;
figure; plot(timeStep, rootMSE,'o')
xlim([0 numSteps])
grid on;
title('Root Mean Square Error for Linear Signal')
ylabel('RMSE')
xlabel('Iteration')


finalTime = 0.001207;
numSteps = finalTime/dt;
rootMSEQuadratic = [];
figure; 
plot(coords, signalQuadratic,'-^','color','b')
hold on;
plot(coords, signalQuadraticNoisy,'-*','color','r')
for i=1:numSteps
    
    filteredQuadratic = conv(g2_1,signalQuadraticNoisy);
    filteredQuadratic = signalQuadraticNoisy +  dt*filteredQuadratic(4:end-3);
    signalQuadraticNoisy = filteredQuadratic;
    signalQuadraticNoisy(1:3)=0.5;
    signalQuadraticNoisy(end-2:end)=0.5;
    rootMSEQuadratic = [rootMSEQuadratic, rmse(signalQuadratic,signalQuadraticNoisy)];
    
end
plot(coords, signalQuadraticNoisy,'-o','color','g')
legend('Original Signal', 'Noisy Signal', 'DeNoised Signal')
grid on;
title('Quadratic Signal')
xlabel('x')
ylabel('y')

%Plotting RMSE
timeStep = 1:numSteps;
figure; plot(timeStep, rootMSEQuadratic,'o')
xlim([0 numSteps])
grid on;
title('Root Mean Square Error for Quadratic Signal')
ylabel('RMSE')
xlabel('Iteration')


% Calculate RMS
errorFirstDerivative = rmse(firstDerivativeOfSignal(4:end-3),PDDOFirstDerivative(4:end-3));
errorSecondDerivative = rmse(secondDerivativeOfSignal(4:end-3),PDDOSecondDerivative(4:end-3));

