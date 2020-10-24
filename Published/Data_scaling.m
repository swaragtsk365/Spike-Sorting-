function scaled_data=Data_scaling(wave_form,ord)
    scaled_data=normalize(wave_form,ord);
    for i = 1: size(scaled_data,2) 
                spike = randperm(size(scaled_data,1),1);
                scaled_datai = scaled_data(spike,:);
                plot(scaled_datai);
                hold on
                title('Spike Waveforms Normalized')
                xlabel("No of samples")
                ylabel("Amplitude(microV)")
            end
end