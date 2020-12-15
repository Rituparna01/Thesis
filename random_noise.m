clc
clear all
x  = ecg(500);
n  = randn(1,500);
plot(n,'b');
title('Random Noise output')
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;