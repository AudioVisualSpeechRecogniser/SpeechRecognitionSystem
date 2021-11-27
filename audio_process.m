function [data] = audio_process(audioData, fs,  numberOfChannels)
    window = 0.02;
    frameLength = fs * window;
    numberOfSamples = length(audioData);
    numberOfFrames = floor(numberOfSamples / frameLength);
    for i=1:numberOfFrames
       firstSample = i * frameLength - frameLength + 1;
       lastSample = i * frameLength;
       shortFrame = audioData(firstSample:lastSample);
       [magSpec, ~] = magAndPhase(shortFrame);
       featureVector = filterbank(magSpec, numberOfChannels);
       data(i,:) = featureVector;
    end
    
end