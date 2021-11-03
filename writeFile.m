function [data] = writeFile(data)
    filename = "x.mfc";
    numVectors = length(data); % Number of feature vectors
    vectorPeriod = 100000;
    numDims = length(data(1,:));
    parmKind = 6; % type of feature

    file = fopen(filename, 'w', 'ieee-be'); % Big-endian ordering

    fwrite(file, numVectors, 'int32'); % number of vectors in file (4 byte int)
    fwrite(file, vectorPeriod, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(file, numDims * 4, 'int16'); % number of bytes per vector (2 byte int)
    fwrite(file, parmKind, 'int16'); % code for the sample kind (2 byte int)
    % Write the data: one coefficient at a time:
    for i = 1: numVectors
        for j = 1:numDims
            fwrite(file, data(i, j), 'float32');
        end
    end

end