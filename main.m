filename = "Take-5_16";

[audioData, fs] = audioread("TrainingData\Training-Audio\" + filename + ".wav"); % Read the audio data fs:frequency sample

sampleRate = 320; % Number of data points per sample

numberOfSamples = floor(length(audioData)/sampleRate); % Number of samples to take

filterBankChannels = 14;

fbank = zeros(numberOfSamples, filterBankChannels/2); % Create a blank vector

for i=1:numberOfSamples % Loop through each sample
    magnitude = magPhase(audioData((i*sampleRate) - (sampleRate -1):i*sampleRate)); % Get the magnitude data of each sample
    
    f = filterbank(magnitude, filterBankChannels); % Run magnitude data through an N channel filterbank to get N/2 data points
    
    fbank(i, :) = f; % Store the filtered data to the vector
end

writeFile(fbank, filename); % Write the data to a .mfc file
