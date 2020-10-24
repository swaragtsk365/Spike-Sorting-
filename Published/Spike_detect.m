function [spike_samp,wave_form] = Spike_detect(filtered_data, spike_window, tf, offset, max_thresh)
           %Calculate the threshold = 4*an estimation of the standard deviation of the noise
            threshold = 4* median(abs(filtered_data)/0.6745);
            %Find the positions where filtered data crosses the threshold
            pos = find(filtered_data>threshold);
            pos = pos(pos>spike_window);
            % Extract potential spikes and align them to the maximum
            spike_samp=[];
            wave_form = [];
            s = size(filtered_data);
            for i = 1:length(pos)
                if pos(i) < s(2) - (spike_window+1)
                    % Data from position where threshold is crossed to end of window
                    tmp_waveform = filtered_data(pos(i):pos(i)+spike_window*2);
                    % Check if data in window is below upper threshold (artifact rejection)
                    if max(tmp_waveform) < max_thresh
                        % Find sample with maximum data point in window
                        [argvalue, argmax] = max(tmp_waveform);
                        tmp_samp =  argmax+pos(i);
                        %Re-center window on maximum sample and shift it by offset
                        tmp_waveform = filtered_data(tmp_samp-(spike_window-offset):tmp_samp+(spike_window+offset));
                        % Append data
                        spike_samp = [spike_samp;  tmp_samp];
                        wave_form = [wave_form;  tmp_waveform];
                    end
                end
            end
            ind = find(diff(spike_samp) > 1);
            spike_samp = spike_samp(ind,:);
            wave_form = wave_form(ind,:);
            figure;
            
            for i = 1: size(wave_form,2) 
                spike = randperm(size(wave_form,1),1);
                wave_formi = wave_form(spike,:);
                plot(wave_formi);
                hold on
                title('Spike Waveforms')
                xlabel("No of samples")
                ylabel("Amplitude(microV)")
            end
    
    