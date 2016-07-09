% Signal drop from a distance
clearvars;
close all;

% constants
gama = 0.9;
dB0 = -40;
R = 1;

r = 0:0.1:20;
n = length(r);


sp = zeros(1,n);

for i = 1:n
    ri = r(i);
    sp(i) = signalPower(dB0, gama, R, ri);
end

plot(r, sp)
grid on
