import numpy as np
from scipy.io.wavfile import write, read

file, audio = read('Data\\test\\something-1.wav')
RMS_noise = math.sqrt(np.mean(signal ** 2))  # Root mean squred of signal


def get_white_noise(audio, Signal_to_noise_ratio):
    RMS_s = math.sqrt(np.mean(signal ** 2))
    RMS_n = math.sqrt(RMS_s ** 2 / (pow(10, Signal_to_noise_ratio / 10)))
    STD_n = RMS_n
    white_noise = np.random.normal(0, STD_n, audio.shape[0])
    return white_noise


# Additive White Gaussian Noise (AWGN)

audio = np.interp(audio, (audio.min(), audio.max()), (-1, 1))
white_noise = get_white_noise(audio, Signal_to_noise_ratio=10)

# analyze the frequency components in the signal

audio_white_noise = audio + white_noise

write("something_Noise-1.wav", file, audio_white_noise)
