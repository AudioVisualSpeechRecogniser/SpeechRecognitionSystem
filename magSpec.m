function [featureVectors] = magSpec( sample,fs, filename,channelsNum)

numSamples = length(sample);

frameSizeSec = 0.02; %20ms
overlapSizeSec = 0.01;  %10ms
overlapSizeSamples = overlapSizeSec * fs; %size in samples
frameSizeSamples = frameSizeSec * fs;     %size in samples   

frameNumber = 1;
numOfFrames = floor(numSamples/overlapSizeSamples -1) ;
featureVectors = zeros(numOfFrames,channelsNum/2);

%MAIN LOOP
%loop by calculating new frame after every overlap period
for  i=1 : overlapSizeSamples : length(sample) - frameSizeSamples - 1
    startFrame = i;
    endFrame = i + frameSizeSamples;
    
    %Extract frame
    frame = sample(startFrame:endFrame);
    
    %pre emphasis (our own implementation)
    %emphasisedFrame = preEmphasis(frame);
    
    %pre emphasis (built in matlab function)
    emphasisedFrame = filter([1,-0.97],1,frame);
    frame = emphasisedFrame;
    
    
    %apply Hamming window
    hammingWin = hamming(length(frame)) .* frame;
    
    %Take FFT to obtain complex spectrum
    complexSpectrum = fft(hammingWin);
    
    %Convert to magnitude spectrum
    mag = abs(complexSpectrum); 
    mag = mag(1:floor(length(mag)/2));
    
    %Get mel filterbank coefficients
    coefficients = filterbank(mag,channelsNum);
    
    %[filterMel,coefficients2] = melfilter(channelsNum,mag);
    %coefficients3 = mag * filterMel;
    
    %allCoefficients(i,:) = coefficients;
    coefficientsLog = log(coefficients);
    
    if(isnan(coefficientsLog) | isinf(coefficientsLog))
        for j=1:length(coefficientsLog)
            coefficientsLog(j) = 0;
        end
    end
    
    %dct to estimate quefrency
    quefrencyFull = dct(coefficientsLog);
    
    %truncation (roughly half the size)
    quefrencyTrun = quefrencyFull(1:length(quefrencyFull)/2);
    
    featureVectors(frameNumber,:) = transpose(quefrencyTrun);
    frameNumber = frameNumber + 1;
   
    
    
end




end

