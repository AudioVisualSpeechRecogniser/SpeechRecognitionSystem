function [featureVector] = filterbank(magSpec, N)

    channels = floor(linspace(1, length(magSpec), N+1));
    featureVector = zeros(N, 1); % Create a blank vector
    for i=1:length(channels)-1
        if i ~= length(channels)
            first = channels(i);
            last = channels(i+1);
            featureVector(i) = sum(magSpec(first:last)); % Sum values and store in vector
        end
    end
    featureVector = log(featureVector); % Human hearing range
    featureVector = dct(featureVector); % Quefrency range
    featureVector = featureVector(1:floor(N/2)); % Trim pitch
    
end