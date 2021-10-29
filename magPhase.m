function [magnitude, phase] = magPhase(sample)
    disp(length(sample))
	h = hamming(length(sample)); % hamming window for 512 samples 
	fast_fourier_transform = fft(h.*sample); % x = your data (audio) h = window 

	magnitude = abs(fast_fourier_transform);
	phase = angle(fast_fourier_transform);
    
    magnitude = magnitude(1:floor(length(magnitude)/2));
end
