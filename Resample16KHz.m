[x,fs] = audioread('ReversedSession2.wav');  % Reading the audio file 

y = resample(x,16000,fs); % Resampling it to 20KHz sampling frequency. 

new_frequency_sampling = 16000; %Set sampling frequency variable to 20000

singleChannel = y(:,1);

% Changing Audio files to 16KHz

audiowrite('ReversedSession2_16.wav', y,new_frequency_sampling);