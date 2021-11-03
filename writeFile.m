function [data] = writeFile(data, fileOut)
    filename = "MFCCs\train\" + fileOut + ".mfc";
    numVectors = length(data); % Number of feature vectors
    vectorPeriod = 100000;
    numDims = length(data(1,:));
    parmKind = 6; % type of feature MFCC

    file = fopen(filename, 'w', 'ieee-be'); % Big-endian ordering

    fwrite(file, numVectors, 'int32'); % number of vectors in file (4 byte int)
    fwrite(file, vectorPeriod, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(file, numDims * 4, 'int16'); % number of bytes per vector (2 byte int)
    fwrite(file, parmKind, 'int16'); % code for the sample kind (2 byte int)

    for i = 1: numVectors % Write the data to the .mfc file
        for j = 1:numDims
            fwrite(file, data(i, j), 'float32');
        end
    end

end