function [featureVectors] = magSpec(sample, fs, numberOfChannels)

numberOfSamples = length(sample);

frameSize = 0.02; %20ms Framerate
overlap = 0.01;  %10ms 50% overlap

overlapSamples = overlap * fs;
frameSamples = frameSize * fs;   

frames = floor(numberOfSamples/overlapSamples -1);
featureVectors = zeros(frames,numberOfChannels/2); % New blank vector

frameCount = 1;
for i=1 : overlapSamples : length(sample) - frameSamples - 1
    
    start = i;
    finish = i + frameSamples;
    frame = sample(start:finish);
    
    %//TODO Check this
    emphasisedFrame = filter([1,-0.97],1,frame);
    frame = emphasisedFrame;
    
    window = hamming(length(frame)).*frame;
    
    spec = fft(window);
    
    magnitude = abs(spec); 
    magnitude = magnitude(1:floor(length(magnitude)/2));
    
    fbank = filterbank(magnitude,numberOfChannels);
    fbank = log(fbank); % Put into the human hearing spectrum
    
    if(isnan(fbank) | isinf(fbank)) % Check for inf and NaN values
        for j=1:length(fbank)
            fbank(j) = 0;
        end
    end
    
    fbank = dct(fbank); % Put into the cepstral domain
    fbank = fbank(1:length(fbank)/2); % Remove pitch data
    
    featureVectors(frameCount,:) = transpose(fbank);
    frameCount = frameCount + 1;
end




end

