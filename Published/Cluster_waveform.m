function AvgWF=Cluster_waveform(wave_form,idx,nclu)
    AvgWF=[];
    for k=1:nclu
        a=wave_form(idx==k,:);
        b=mean(a,1);
        AvgWF=[AvgWF;b];
    end
    figure;
    Colors=hsv(nclu);        
    for i = 1: size(AvgWF,2) 
        spike = randperm(size(AvgWF,1),1);
        AvgWFi = AvgWF(spike,:);
        plot(AvgWFi,'Color',Colors(spike,:));
        hold on
        title('Cluster Waveforms')
        xlabel("No of samples")
        ylabel("Amplitude(microV)")
    end
        
end