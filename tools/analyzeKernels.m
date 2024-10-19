close all;
clear all;

addpath('../data/')


g1_1 = table2array(readtable('g1_1.csv'));
g1_2 = table2array(readtable('g1_2.csv'));
g1_3 = table2array(readtable('g1_3.csv'));
g2_1 = table2array(readtable('g2_1.csv'));
g2_2 = table2array(readtable('g2_2.csv'));


figure; plot(-2:2,g1_1,'-o')
hold on;
plot(-2:2,g1_2,'-^')
plot(-2:2, g1_3,'-*')
grid on;
title('First Order PDDO Kernels')
legend('g^1_1','g^1_2','g^1_3')

figure; plot(-3:3,g2_1,'-o')
hold on;
plot(-5:5,g2_2,'-^')
grid on;
title('Second Order PDDO Kernels')
legend('g^2_1','g^2_2')

%Create function for 1st derivative
dx = 1/512;
horizon = 2;
xCoords = -5-horizon*dx:dx:5+horizon*dx;
polyOrder = 3;
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
figure; plot(xCoords(3:end-2),firstDerivative(3:end-2),'o')
hold on;
plot(xCoords(3:end-2),derivative1_1(3:end-2),'^')
plot(xCoords(3:end-2),derivative1_2(3:end-2),'*')
plot(xCoords(3:end-2),derivative1_3(3:end-2),'.')
grid on;
legend('Analytical','conv(y,g^1_1)','conv(y,g^1_2)','conv(y,g^1_3)')
title('Analytical vs Conv With First Order PDDO Kernels')

%Plotting Errors
figure; plot(xCoords(3:end-2),firstDerivative(3:end-2)-derivative1_1(3:end-2),'o')
hold on;
plot(xCoords(3:end-2),firstDerivative(3:end-2)-derivative1_2(3:end-2),'^')
plot(xCoords(3:end-2),firstDerivative(3:end-2)-derivative1_3(3:end-2),'*')
grid on;
legend('g^1_1','g^1_2','g^1_3')
title('Errors vs Analytical Solution')
xlabel('x');
ylabel('Error');

%Create functions for second derivative
horizon = 3;
xCoords_1 = -5-horizon*dx:dx:5+horizon*dx;
y_1 = xCoords_1.^polyOrder;
secondDerivative_1 = polyOrder*(polyOrder-1).*xCoords_1.^(polyOrder-2);
horizon = 5;
xCoords_2 = -5-horizon*dx:dx:5+horizon*dx;
y_2 = xCoords_2.^polyOrder;
secondDerivative_2 = polyOrder*(polyOrder-1).*xCoords_2.^(polyOrder-2);


%%Second Order Derivatives
derivative2_1 = conv(y_1,g2_1,'same');
derivative2_2 = conv(y_2,g2_2,'same');

figure;
plot(xCoords(3:end-2),secondDerivative(3:end-2),'o')
hold on;
plot(xCoords_1(4:end-3),derivative2_1(4:end-3),'^')
plot(xCoords_2(6:end-5),derivative2_2(6:end-5),'*')
grid on;
legend('Analytical','conv(y,g^2_1)', 'conv(y,g^2_2)')
title('Analytical vs Conv With Second Order PDDO Kernels')

figure;
plot(xCoords(3:end-2),secondDerivative(3:end-2)-derivative2_1(4:end-3),'o')
hold on;
plot(xCoords(3:end-2),secondDerivative(3:end-2)-derivative2_2(6:end-5),'*')
title('Errors vs Analytical Solution')
legend('g^2_1', 'g^2_2')
grid on;
xlabel('x');
ylabel('Error');
