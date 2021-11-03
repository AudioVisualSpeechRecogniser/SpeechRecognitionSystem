[sample, fs] = audioread("TrainingData\speech.wav");

sampleRate = 320;

numberOfSamples = floor(length(sample)/sampleRate);

fbank = zeros(numberOfSamples, 4);

for i=1:numberOfSamples
    magnitude = magPhase(sample(i:sampleRate));

    f = filterbank(magnitude, 8);
    
    fbank(i, :) = f;
end

writeFile(fbank);
