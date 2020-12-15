clc
clear all
x  = ecg(500);     % Input to the filter 
b  = fir1(31,0.05);     % FIR system to be identified 
n  = awgn(x,0.5); % Observation noise signal 
d  = filter(b,1,x)+n;  % Mixed Signal 
mu = 0.0072;            % DLMS step size. 
ha = adaptfilt.dlms(32,mu); 
[y,e] = filter(ha,x,d);
%Original ECG signal
subplot(5,1,1); 
plot(1:500,x);
title('Original ECG Output'); 
legend('ECG'); 
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;
%Gaussian Noise Output
subplot(5,1,2); 
plot(1:500,n);
title('Gaussian Noise'); 
legend('Noise'); 
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;
%Mixed signal
subplot(5,1,3);
plot(1:500,d); 
title('Mixed Signal'); 
legend('Mixed'); 
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;
%Reconstructed ECG Signal
subplot(5,1,4);
plot(1:500,y,'-g');
title('Reconstructed ECG Signal'); 
legend('Reconstructed ECG'); 
xlabel('Time Index'); 
ylabel('Amplitude (mV)');
grid on;
 %Actual and Estimate
subplot(5,1,5); 
stem([b.',ha.coefficients.']); 
legend('Actual','Estimated'); 
xlabel('Coefficient #'); 
ylabel('Coefficient Value');  
grid on;
