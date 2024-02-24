clear all;
close all;

addpath('../data/')
dt = 0.000000001;
numSteps = 8*5000;
g2_1 = table2array(readtable('g2_1.csv'));

signalLinear = table2array(readtable('signalLinear.csv'));
signalLinearNoisy = table2array(readtable('signalLinearNoisy.csv'));
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


signalQuadratic = table2array(readtable('signalQuadratic.csv'));
signalQuadraticNoisy = table2array(readtable('signalQuadraticNoisy.csv'));
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