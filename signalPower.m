function sp = signalPower(dB0, gama, R, r)
% Signal power calculation according to
% Wiki --> signal strength
% dBe = dB0 - 10*gama*log10(r/R)
%
% gama = 4 for mobile networks
% dB0  = reference signal power at R
% r    = distance
% dBe  = estimated signal power


sp = dB0 - 10*gama*log(r/R);