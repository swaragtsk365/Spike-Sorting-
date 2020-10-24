function pca_result=DimReduction(scaled_data,numdim)
    [coeff,score,latent] = pca(scaled_data);
    proj=coeff(:,1:numdim);
    pca_result=scaled_data*proj;
    
    
end