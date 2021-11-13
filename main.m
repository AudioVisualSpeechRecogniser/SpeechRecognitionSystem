numberOfFiles = 20; % Number of files in the train/test folder
fileNameStart = "Take-"; % Beginning of the filename without the number e.g. "Take-" for "Take-1" et.c
filterbankChannels = 40; % Number of filterbank channels to use
testOrTrain = "train";

fid = fopen("lists/" + testOrTrain + "List.txt", "w");

for i=1:numberOfFiles
    currentFile = fileNameStart + i;
    numberOfChannels = filterbankChannels;

    input = "Data\" + testOrTrain + "\" + currentFile + ".wav";

    disp(input)

    output = "MFCCs\" + testOrTrain + "\" + currentFile + ".mfc";
    
    fprintf(fid, "MFCCs/" + testOrTrain + "/" + currentFile + ".mfc\n");

    [sample,fs] = audioread(input); % Read in the audio data from the .wav file and extract the sample rate and audio itself
    
    % fs = fs /2

    %Noise compensation
    %sample = specsub(sample,fs);

    magnitude = magSpec(sample, fs, numberOfChannels); %  magSpec returns the featureVector that is a matrix with all of the feature data inside it

    writeToFile(magnitude, output) % Calls the writeToFile function to save the featureVector to the .mfc files
end