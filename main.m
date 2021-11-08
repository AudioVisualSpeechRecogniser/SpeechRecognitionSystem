numberOfFiles = 1; % Number of files in the train/test folder
fileNameStart = "reversed-"; % Beginning of the filename without the number e.g. "Take-" for "Take-1" et.c
filterbankChannels = 30; % Number of filterbank channels to use
testOrTrain = "test";

for i=1:numberOfFiles
    currentFile = fileNameStart + i;
    numberOfChannels = filterbankChannels;

    input = "Data\" + testOrTrain + "\" + currentFile + ".wav";

    disp(input)

    output = "MFCCs\" + testOrTrain + "\" + currentFile + ".mfc";
    
    fid = fopen("lists/" + testOrTrain + "List.txt", "w");

    fprintf(fid, "MFCCs/" + testOrTrain + "/" + currentFile + ".mfc");

    [sample,fs] = audioread(input);

    %//TODO Check this - Noise compensation
    %sample = specsub(sample,fs);

    magnitude = magSpec(sample, fs, numberOfChannels); % audio data, frequency, output filename, number of channels

    writeToFile(magnitude, output)
end