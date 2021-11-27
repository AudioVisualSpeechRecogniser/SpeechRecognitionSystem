function [] = main()

    % Set the number of files to process
    numberOfFiles = 10;
    
    % Start in 'test' or 'train' mode
    testOrTrain = "train";
    
    % The beginning of the filename without number e.g 'Take-' for 'Take-1'
    fileName = "Take-";
    
    % Set the number of filterbank channels
    numberOfChannels = 10;
    
    % Directories to read and save to
    outputDirectory = "MFCCs/" + testOrTrain + "/";
    dataLocation = "Data/" + testOrTrain + "/";
    
    % Open respective list
    fid = fopen("lists/" + testOrTrain + "List.txt", "w");
    
    % Loop through the files to generate the file names to be processed
    for i = 1 : numberOfFiles
            fileNames(i, :) = fileName+i;
    end
    
    % Process each file
    for i = 1 : numberOfFiles
        tic
        
        fprintf(fid, "MFCCs/" + testOrTrain + "/" + fileNames(i) + ".mfc");
        
        % Read in the audio data from the .wav files
        [audioData, fs] = audioread(dataLocation + fileNames(i) + ".wav");
        
        % Generate a feature vector
        featureVector = audio_process (audioData, fs, numberOfChannels);
        
        % Write the feature vector to the .mfc file
        writeHTK(featureVector, fileNames(i), outputDirectory);
        toc
    end
end
