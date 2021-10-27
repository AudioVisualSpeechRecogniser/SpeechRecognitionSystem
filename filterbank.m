% Code/Psuedo code for a filterbank
% 20 channels?
% function [fbank] = filterbank(magnitude)
% 	channels = 8;
%     samples = 256/channels;
%     for channel = 1:channels
% 		fbank(channel) = sum(magnitude(channel * samples:channel+1 * samples));
%     end
% end


%         diff = 256/channels;
%         finish = start + diff;
%         start = start + 256/channels;
%         fbank(i) = sum(magnitude(start), magnitude(finish));

function [featureVector] = filterbank(magSpec, N)

    bins = floor(linspace(1, length(magSpec), N+1));
    featureVector = zeros(N, 1);
    for j=1:length(bins)-1
        if j ~= length(bins)
            first = bins(j);
            last = bins(j+1);
            featureVector(j) = sum(magSpec(first:last));
        end
    end
    featureVector = log(featureVector);
    featureVector = dct(featureVector);
    featureVector = featureVector(1:floor(N/2));
    
end