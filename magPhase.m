function [magnitude, phase] = magPhase(sample)
	h = hamming(length(sample)); % hamming window for each sample
	fast_fourier_transform = fft(h.*sample); % h = window, Use the fft function to transform the data to the frequency domain

	magnitude = abs(fast_fourier_transform); % Get the absolute values for the fft aka magnitude data
	phase = angle(fast_fourier_transform); % Don't worry about the phase data for now
    
    magnitude = magnitude(1:floor(length(magnitude)/2)); % Get rid of the duplicated data
end
