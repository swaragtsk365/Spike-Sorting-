function scaled_data=MinMaxScaling(P)
    mindata = min(P);
    maxdata = max(P);
    scaled_data = ((P-mindata)/((maxdata)-mindata));
end