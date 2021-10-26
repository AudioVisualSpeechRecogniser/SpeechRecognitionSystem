function [magnitude, phase] = magPhase(sample)
	h = hamming(512); % hamming window for 512 samples 
	fast_fourier_transform = fft(sample.*h); % x = your data (audio) h = window 

	magnitude = abs(fast_fourier_transform(1:256));
	phase = angle(fast_fourier_transform(1:256));
end
