function [featureVectors] = magSpec(sample, fs, numberOfChannels)

numberOfSamples = length(sample); % total amount of samples in the entire audio file

frameSize = 0.02; %20ms Framerate | the length of each frame of audio to be taken
overlap = 0.01;  %10ms 50% overlap | The size of the overlap for each frame in order to keep and contextual information in tact over the frame borders

overlapSamples = overlap * fs;
frameSamples = frameSize * fs;   

frames = floor(numberOfSamples/overlapSamples -1); % calculates the total number of frames needed for the audio sample
featureVectors = zeros(frames,numberOfChannels/2); % new blank vector to store the final data

frameCount = 1; % Keep track of the current frame
for i=1 : overlapSamples : length(sample) - frameSamples - 1
    
    start = i;
    finish = i + frameSamples;
    frame = sample(start:finish);
    
    emphasisedFrame = filter([1,-0.97],1,frame); %  filters the frame input data using a rational transfer function defined by the the first 2 parameters
    frame = emphasisedFrame;
    
    window = hamming(length(frame)).*frame; %  Create a hamming window over the entire frame (length(frame))
    
    spec = fft(window); % Take the fft of the window in order to convert the data from a time domain to a frequency domain with both complex and real numbers
    
    magnitude = abs(spec); % Take the absolute values of the spectrum in order to eliminate the complex numbers
    magnitude = magnitude(1:floor(length(magnitude)/2)); %  Remove the reflected data from the magnitude spectrum
    
    fbank = filterbank(magnitude,numberOfChannels); % Run the magnitude data through the filterbank in order to average it and make the data more managable
    fbank = log(fbank); % Convert the processed data now into the hearing spectrum
    
    % remove and inf or NaN values that may cause issues for the .mfc files
    if(isnan(fbank) | isinf(fbank)) % Check for inf and NaN values
        for j=1:length(fbank)
            fbank(j) = 0;
        end
    end
    
    fbank = dct(fbank); % Convert the data from the frequency domain into the quefrency doimain(cepstral) in order to ideantify pitch and audio features
    fbank = fbank(1:length(fbank)/2); % Remove the pitch data as it is uneccassary in the English language and makes the files smaller
    
    featureVectors(frameCount,:) = transpose(fbank); % Transpose the matrix and return the non-conjugate transpose of A (swap row and column)
    frameCount = frameCount + 1;
end




end

