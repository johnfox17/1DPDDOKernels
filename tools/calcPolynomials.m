clear all;
close all;

nodeNumbers = -2:1:2;
Hx = 2.015;
Nx = 512;
dx = 1/Nx;
internalDist = nodeNumbers./Hx;
weights = exp(-4.*internalDist.^2);

AMat = zeros(floor(Hx),floor(Hx));
for i = 1:length(nodeNumbers)
    AMat = AMat + weights(i).*[1,internalDist(i); internalDist(i), (internalDist(i))^2]*dx;
end

AMat(AMat<10^-12)=0;
%invAMat = inv(AMat);

b0 = [1;0];
b1 = [0;1];
b2 = [0;2];

g0 = AMat\b0;  
g1 = AMat\b1;
g2 = AMat\b2;  