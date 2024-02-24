close all;
clear all;

addpath('../data/')


g1_1 = table2array(readtable('g1_1.csv'));
g1_2 = table2array(readtable('g1_2.csv'));
g1_3 = table2array(readtable('g1_3.csv'));
g2_1 = table2array(readtable('g2_1.csv'));
g2_2 = table2array(readtable('g2_2.csv'));


figure; plot(g1_1,'-o')
hold on;
plot(g1_2,'-^')
plot(g1_3,'-*')
grid on;
title('First Order GPolynomials')
legend('g1_1','g1_2','g1_3')

figure; plot(g2_1,'-o')
hold on;
plot(g2_2,'-^')
grid on;
title('Second Order GPolynomials')
legend('g2_1','g2_2')

%Create parabola
dx = 1/512;
xCoords = -5:dx:5;
polyOrder = 3;
y = xCoords.^polyOrder;
firstDerivative = polyOrder.*xCoords.^(polyOrder-1);
secondDerivative = polyOrder*(polyOrder-1).*xCoords.^(polyOrder-2);
%y = exp(-xCoords.^2);
%y = gaussmf(xCoords,[2 5]);
figure; plot(xCoords,y,'-o')
grid on;

%%First Order Derivatives
horizon1_1 = 2.015;
horizon1_2 = 2.015;
horizon1_3 = 2.015;
derivative1_1 = conv(g1_1,y);
derivative1_1 = derivative1_1(1,3:end-2);
derivative1_2 = conv(g1_2,y);
derivative1_2 = derivative1_2(1,3:end-2);
derivative1_3 = conv(g1_3,y);
derivative1_3 = derivative1_3(1,3:end-2);
figure; plot(xCoords(1,5:end-4),firstDerivative(1,5:end-4),'o')
hold on;
plot(xCoords(1,5:end-4),derivative1_1(1,5:end-4),'^')
plot(xCoords(1,5:end-4),derivative1_2(1,5:end-4),'*')
plot(xCoords(1,5:end-4),derivative1_3(1,5:end-4),'.')
grid on;
legend('Analytical','g1_1','g1_2','g1_3')
pAnalytical = polyfit(xCoords(1,5:end-4),firstDerivative(1,5:end-4),1) ;
p1_1 = polyfit(xCoords(1,5:end-4),derivative1_1(1,5:end-4),1) ;
p1_2 = polyfit(xCoords(1,5:end-4),derivative1_2(1,5:end-4),1) ;
p1_3 = polyfit(xCoords(1,5:end-4),derivative1_3(1,5:end-4),1) ;

%%Second Order Derivatives
horizon2_1 = 3.015;
horizon2_2 = 5.015;
%derivative2_1 = conv(g2_1,y)*dx/(horizon2_1^2*dx^2);
derivative2_1 = conv(g2_1,y);
derivative2_1 = derivative2_1(1,4:end-3);
derivative2_2 = conv(g2_2,y);
derivative2_2 = derivative2_2(1,4:end-3);

figure;
plot(xCoords(1,5:end-4),secondDerivative(1,5:end-4),'o')
hold on;
plot(xCoords(1,5:end-4),derivative2_1(1,5:end-4),'^')
plot(xCoords(1,5:end-4),derivative2_2(1,5:end-4),'*')
grid on;
legend('Analytical','g2_1', 'g2_2')