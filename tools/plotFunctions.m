clear all;
%close all;

addpath('../data/')


coords = table2array(readtable('coords.csv'));
% linearFunction = table2array(readtable('linearFunction.csv'));
% quadraticFunction = table2array(readtable('quadraticFunction.csv'));
% linearFunctionNoisy = table2array(readtable('linearFunctionNoisy.csv'));
% quadraticFunctionNoisy = table2array(readtable('quadraticFunctionNoisy.csv'));
% 
% figure; plot(coords,linearFunction,'-o')
% hold on;
% plot(coords,linearFunctionNoisy,'^')
% grid on;
% figure; plot(coords,quadraticFunction,'-o')
% hold on;
% plot(coords,quadraticFunctionNoisy,'^')
% grid on;
addpath('../data/')
signal = table2array(readtable('signal.csv'));
plot(signal,'-o')
hold on;
plot(signal,'-o')