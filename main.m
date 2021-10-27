[sample, fs] = audioread("speech.wav");

magnitude = magPhase(sample);

fbank = filterbank(magnitude);

logData = logFunc(fbank);

dctData = dct(logData);
