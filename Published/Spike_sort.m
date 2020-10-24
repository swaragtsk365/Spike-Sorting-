function [pca_result,idx,C]=Spike_sort(data,low,high,fs,order,spike_window, tf, offset, max_thresh,PCs,Numclu)
    filtered_data=filter_data(data,low,high,fs,order);
    [~,wave_form] = Spike_detect(filtered_data, spike_window, tf, offset, max_thresh);
    scaled_data=Data_scaling(wave_form,1);
    pca_result=DimReduction(scaled_data,PCs);
    [idx,C]=kmeans(pca_result,Numclu);
    AvgWF=Cluster_waveform(wave_form,idx,Numclu);
    
end