function [ fbank ] = filterbank(magnitude, numberOfChannels)
% Averages the data to decrease file-size (mel-scale)

fbank = zeros(numberOfChannels,1); % New vector to store the final value in
frameSize = round(length(magnitude)/numberOfChannels); % Size of the channels

channelCount = 1; % Keep track of the current channel
for i=1 : numberOfChannels
    

    sum = 0.0;
    
    for j=1:frameSize
           sum = sum + magnitude((i-1)*frameSize + j); 
    end
    
    sum = sum/frameSize; % Average all of the values within the current channel to get a single value (sum (add them up))
    fbank(i) = sum; % Store the averaged value in the vector
       
    channelCount = channelCount + 1;
end

