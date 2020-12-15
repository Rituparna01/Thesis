clc
clear all
x=ecg(500);
plot(x);
title('ECG Signal')
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;