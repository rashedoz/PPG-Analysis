

function [filtered_PPG] = filter_configuration(raw_PPG,filter_type,order,Fs,fL,fH)

Fn = Fs/2;

switch filter_type

 

case 1

[A,B,C,D] = butter(order,[fL fH]/Fn);

[filter_SOS,g] = ss2sos(A,B,C,D);

filtered_PPG = filtfilt(filter_SOS,g,raw_PPG);

 

case 2

[A,B,C,D] = cheby1(order,0.1,[fL fH]/Fn);

[filter_SOS,g] = ss2sos(A,B,C,D);

filtered_PPG = filtfilt(filter_SOS,g,raw_PPG);

 

case 3

[A,B,C,D] = cheby2(order,20,[fL fH]/Fn);

[filter_SOS,g] = ss2sos(A,B,C,D);

filtered_PPG = filtfilt(filter_SOS,g,raw_PPG);

 

case 4

[A,B,C,D] = ellip(order,0.1,30,[fL fH]/Fn);

[filter_SOS,g] = ss2sos(A,B,C,D);

filtered_PPG = filtfilt(filter_SOS,g,raw_PPG);

 

case 5

d = fir1(order,[fL fH]/Fn,'bandpass');

filtered_PPG = filtfilt(d,1,raw_PPG);

 

case 6

d = designfilt('bandpassfir','FilterOrder',order,'StopbandFrequency1',fL-0.2,'PassbandFrequency1',fL,...

'PassbandFrequency2',fH,'StopbandFrequency2',fH+2,'DesignMethod','ls','SampleRate',sample_freq);

filtered_PPG = filtfilt(d,raw_PPG);

 

case 7

filtered_PPG = smooth(raw_PPG,order);

 

case 8

filtered_PPG = medfilt1(raw_PPG,order);

 

case 9

filtered_PPG= wden(raw_PPG,'modwtsqtwolog','s','mln',order,'db2');

 

end

end