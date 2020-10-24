function SSPout(file,low,high,order,spike_window, tf, offset, max_thresh,PCs,Numclu)
    load(file,'data','samplingInterval');
    fs=1000/samplingInterval;
    [pca_result,idx,C]=Spike_sort(data,low,high,fs,order,spike_window, tf, offset, max_thresh,PCs,Numclu);
    Plot_sorted(pca_result,idx,C);
end