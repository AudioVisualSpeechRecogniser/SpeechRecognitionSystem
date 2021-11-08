numberOfFiles = 1; % Number of files in the train/test folder
fileNameStart = "Speech-"; % Beginning of the filename without the number e.g. "Take-" for "Take-1" et.c
filterbankChannels = 30; % Number of filterbank channels to use

for i=1:numberOfFiles
    currentFile = fileNameStart + i;
    numberOfChannels = filterbankChannels;

    input = "TrainingData\Testing-Audio\" + currentFile + ".wav";

    disp(input)

    output = "MFCCs\test\" + currentFile + ".mfc";

    [sample,fs] = audioread(input);

    %//TODO Check this - Noise compensation
    %sample = specsub(sample,fs);

    magnitude = magSpec(sample, fs, numberOfChannels); % audio data, frequency, output filename, number of channels

    writeToFile(magnitude, output)
end