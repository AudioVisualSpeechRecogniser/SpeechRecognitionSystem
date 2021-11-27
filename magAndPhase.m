function [magnitude,phase] = magAndPhase(shortTimeFrame)
    h = hamming (length(shortTimeFrame));
    shortTimeFrame_h = h.*shortTimeFrame;
    spec = fft(shortTimeFrame_h);
    magnitude = abs(spec);
    phase = angle(spec);
    magnitude = magnitude(1:floor(length(magnitude)/2));
end
    

