[sample, fs] = audioread("speech.wav");

magnitude = magPhase(sample);

fbank = filterbank(magnitude, 8);

writeFile(fbank);

% logData = logFunc(fbank);

% dctData = dct(logData);
