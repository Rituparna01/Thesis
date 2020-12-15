clc
clear all
x  = ecg(500);
n  = awgn(x,0.5);
plot(n,'b');
title('Additive white Gaussian noise output')
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;