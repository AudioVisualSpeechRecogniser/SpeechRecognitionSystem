function[] = speech_capture()
    for fileNumber = 1:1 % Number of recordings to create 
        fs = 16000; % Sampling frequency of 16KHz
        r = audiorecorder(fs, 16,1);
        disp("Start speaking");
        record(r); % Record Audio
        
        pause; 
    
        disp("Saving Audio...");
    
        stop(r); 
    
        x = getaudiodata(r, 'double');
    
        xNorm = 0.99 * x / max(abs(x)); % Normalise audio data 
        audiowrite("Speech-" + fileNumber + ".wav", xNorm, 16000); % Saving audio data

        disp("Audio Saved :)");
    end
end