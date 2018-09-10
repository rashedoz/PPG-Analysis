fc = 20;
fs = 1000;

[b,a] = butter(6,fc/(fs/2));


dataIn = raw_ppg;
dataOut = filter(b,a,dataIn);





figure
subplot(2,2,1)
plot(dataIn)
subplot(2,2,2)
findpeaks(dataOut)
subplot(2,2,[3,4])
plot(dataOut)




