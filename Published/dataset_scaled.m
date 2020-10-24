function dataset_scaled=dataset_scaled(wave_form)
    obj = MinMaxScalerN(wave_form);
    Fit(obj,X,~);
    X_new = Transform(obj,X)
    
end