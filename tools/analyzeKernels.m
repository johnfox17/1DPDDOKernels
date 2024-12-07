close all;
clear all;

addpath('../data/')


g1_1 = table2array(readtable('g1_1.csv'));
g1_2 = table2array(readtable('g1_2.csv'));
g1_3 = table2array(readtable('g1_3.csv'));
g2_3 = table2array(readtable('g2_3.csv'));
g2_4 = table2array(readtable('g2_4.csv'));


figure; plot(-2:2,g1_1,'-o')
hold on;
plot(-3:3,g1_2,'-^')
plot(-4:4, g1_3,'-*')
grid on;
%title('First Order PDDO Kernels')
legend('g^1_1','g^1_2','g^1_3')

figure; plot(-4:4,g2_3,'-o')
hold on;
plot(-5:5,g2_4,'-^')
grid on;
%title('Second Order PDDO Kernels')
legend('g^2_3','g^2_4')

%Create function for 1st derivative
dx = 1/512;
horizon = 6;
xCoords = -5-horizon*dx:dx:5+horizon*dx;
polyOrder = 4;
y = xCoords.^polyOrder;
firstDerivative = polyOrder.*xCoords.^(polyOrder-1);
secondDerivative = polyOrder*(polyOrder-1).*xCoords.^(polyOrder-2);

figure; plot(xCoords,y,'o')
title('Original Analytical Function')
legend('y=x^3')
grid on;

figure;plot(xCoords,firstDerivative,'o');
title('First Derivative of Analytical Function');
legend('dy/dx=3x^2')
grid on;

figure;plot(xCoords,secondDerivative,'o')
title('Second Derivative of Analytical Function');
legend('d^2y/dx^2=6x')
grid on;
%%First Order Derivatives
derivative1_1 = conv(y,g1_1,'same');
derivative1_2 = conv(y,g1_2,'same');
derivative1_3 = conv(y,g1_3,'same');
figure; plot(xCoords(horizon:end-(horizon-1)),firstDerivative(horizon:end-(horizon-1)),'o')
hold on;
plot(xCoords(horizon:end-(horizon-1)),derivative1_1(horizon:end-(horizon-1)),'^')
plot(xCoords(horizon:end-(horizon-1)),derivative1_2(horizon:end-(horizon-1)),'*')
plot(xCoords(horizon:end-(horizon-1)),derivative1_3(horizon:end-(horizon-1)),'.')
grid on;
legend('Analytical','conv(y,g^1_1)','conv(y,g^1_2)','conv(y,g^1_3)')
title('Analytical vs Conv With First Order PDDO Kernels')

%Plotting Errors
figure; plot(xCoords(horizon:end-(horizon-1)),firstDerivative(horizon:end-(horizon-1))-derivative1_1(horizon:end-(horizon-1)),'o')
hold on;
plot(xCoords(horizon:end-(horizon-1)),firstDerivative(horizon:end-(horizon-1))-derivative1_2(horizon:end-(horizon-1)),'^')
plot(xCoords(horizon:end-(horizon-1)),firstDerivative(horizon:end-(horizon-1))-derivative1_3(horizon:end-(horizon-1)),'*')
grid on;
legend('g^1_1','g^1_2','g^1_3')
title('Errors vs Analytical Solution')
xlabel('x');
ylabel('Error');

%Create functions for second derivative
horizon = 6;
xCoords_1 = -5-horizon*dx:dx:5+horizon*dx;
y_1 = xCoords_1.^polyOrder;
secondDerivative_1 = polyOrder*(polyOrder-1).*xCoords_1.^(polyOrder-2);
horizon = 6;
xCoords_2 = -5-horizon*dx:dx:5+horizon*dx;
y_2 = xCoords_2.^polyOrder;
secondDerivative_2 = polyOrder*(polyOrder-1).*xCoords_2.^(polyOrder-2);


%%Second Order Derivatives
derivative2_3 = conv(y_1,g2_3,'same');
derivative2_4 = conv(y_2,g2_4,'same');

figure;
plot(xCoords(horizon:end-(horizon-1)),secondDerivative(horizon:end-(horizon-1)),'o')
hold on;
plot(xCoords_1(horizon:end-(horizon-1)),derivative2_3(horizon:end-(horizon-1)),'^')
plot(xCoords_2(horizon:end-(horizon-1)),derivative2_4(horizon:end-(horizon-1)),'*')
grid on;
legend('Analytical','conv(y,g^2_3)', 'conv(y,g^2_4)')
title('Analytical vs Conv With Second Order PDDO Kernels')

figure;
plot(xCoords(horizon:end-(horizon-1)),secondDerivative(horizon:end-(horizon-1))-derivative2_3(horizon:end-(horizon-1)),'o')
hold on;
plot(xCoords(horizon:end-(horizon-1)),secondDerivative(horizon:end-(horizon-1))-derivative2_4(horizon:end-(horizon-1)),'*')
title('Errors vs Analytical Solution')
legend('g^2_3', 'g^2_4')
grid on;
xlabel('x');
ylabel('Error');
