function [featureVector] = filterbank(magSpec, N)

    channels = floor(linspace(1, length(magSpec), N+1)); % Set the number of channels for N
    featureVector = zeros(N, 1); % Create a blank vector
    for i=1:length(channels)-1 % Loop through the channels
        if i ~= length(channels)
            first = channels(i); % Get each channel space first and last
            last = channels(i+1);
            featureVector(i) = sum(magSpec(first:last)); % Sum values and store in vector
        end
    end
    featureVector = log(featureVector); % Human hearing range
    if(isnan(featureVector) | isinf(featureVector))
        for i=1:length(featureVector)
            featureVector(i) = 0;
        end
    end
    featureVector = dct(featureVector); % Quefrency range
    featureVector = featureVector(1:floor(N/2)); % Trim pitch
    
end