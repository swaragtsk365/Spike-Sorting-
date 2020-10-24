function filtered_data=filter_data(data,low,high,fs,order)
    nyq=fs/2;
    nfc=[low high]/nyq;
    [b,a] = butter(order, nfc ,'bandpass');
    freqz(b,a);
    filtered_data=filter(b,a,data);
    k = length(data(1:1000));
    t = 0:1/fs:(1000-1)/fs;
    plot(t,data(1:1000),'-g',t,filtered_data(1:1000),'-b');
    title("Filtered signal");
    xlabel("t(in s)");
    ylabel("Amplitude(microV)");
end