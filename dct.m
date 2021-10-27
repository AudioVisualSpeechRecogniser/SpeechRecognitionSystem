function [dctData] = dct(logData)
	% As a rule truncate to keep half the number of dct coefficients	
    dctData = dct(logData);
end
