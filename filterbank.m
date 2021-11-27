function [featureVector] = filterbank(magSpec, numberOfChannels)

    bins = floor(linspace(1, length(magSpec), numberOfChannels+1));
    featureVector = zeros(numberOfChannels, 1);
    for j=1:length(bins)-1
        if j ~= length(bins)
            first = bins(j);
            last = bins(j+1);
            featureVector(j) = sum(magSpec(first:last));
        end
    end

    featureVector = log(featureVector);
    featureVector = dct(featureVector);
    %featureVector = featureVector(1:floor(N/2))
    
end