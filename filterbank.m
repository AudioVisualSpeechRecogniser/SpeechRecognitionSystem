function [ fbank ] = filterbank(magnitude, numberOfChannels)

fbank = zeros(numberOfChannels,1); % new blank vector
frameSize = round(length(magnitude)/numberOfChannels);

channelCount = 1;
for i=1 : numberOfChannels
    
    %//TODO Check this
    sum = 0.0;
    
    for j=1:frameSize
           sum = sum + magnitude((i-1)*frameSize + j); % Average the values (sum)
    end
    
    sum = sum/frameSize;
    fbank(i) = sum;
       
    channelCount = channelCount + 1;
end

