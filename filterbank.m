% Code/Psuedo code for a filterbank
% 20 channels?
function [fbank] = filterbank(magnitude)
	channels = 8;
    samples = 256/channels;
    for channel = 1:channels
		fbank(channel) = sum(magnitude(channel * samples:channel+1 * samples));
    end
end


%         diff = 256/channels;
%         finish = start + diff;
%         start = start + 256/channels;
%         fbank(i) = sum(magnitude(start), magnitude(finish));