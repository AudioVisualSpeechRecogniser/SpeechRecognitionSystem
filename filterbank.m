% Code/Psuedo code for a filterbank
% 20 channels?
function [return here] = filterbank(magnitude)
	channels = 8
	fbank = %new array
	for i in range(channels)
		fbank(i) = sum(magnitude[i * 256/channels:i+1 * 256/channels])
end
