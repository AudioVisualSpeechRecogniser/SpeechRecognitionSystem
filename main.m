[sample, fs] = audioread("TrainingData\speech.wav");

sampleRate = 320;

numberOfSamples = floor(length(sample)/sampleRate);
fbank = zeros(numberOfSamples);
for i=1:numberOfSamples
    magnitude = magPhase(sample((i*sampleRate+1)-sampleRate:i*sampleRate));

    fbank(i) = filterbank(magnitude, 8);
end

writeFile(fbank);
