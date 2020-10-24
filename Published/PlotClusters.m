function PlotClusters(Data,IDX,Centers,Colors)
%Checking inputs
switch nargin
    case 1 %Not enough inputs
        error('Clustering data is required to plot clusters. Usage: PlotClusters(Data,IDX,Centers,Colors)')
    case 2 %Need to calculate cluster centers and color scheme
        [NumOfDataPoints,Dimensions]=size(Data);
        if Dimensions~=2 && Dimensions~=3 %Check ability to plot
            error('It is only possible to plot in 2 or 3 dimensions.')
        end
        if length(IDX)~=NumOfDataPoints %Check that each data point is assigned to a cluster
            error('The number of data points in Data must be equal to the number of indices in IDX.')
        end
        NumOfClusters=max(IDX);
        Centers=zeros(NumOfClusters,Dimensions);
        NumOfCenters=NumOfClusters;
        NumOfPointsInCluster=zeros(NumOfClusters,1);
        for i=1:NumOfDataPoints
            Centers(IDX(i),:)=Centers(IDX(i),:)+Data(i,:);
            NumOfPointsInCluster(IDX(i))=NumOfPointsInCluster(IDX(i))+1;
        end
        for i=1:NumOfClusters
            Centers(i,:)=Centers(i,:)/NumOfPointsInCluster(i);
        end
        Colors=hsv(NumOfClusters);        
    case 3 %Need to calculate color scheme        
        [NumOfDataPoints,Dimensions]=size(Data);
        if Dimensions~=2 && Dimensions~=3 %Check ability to plot
            error('It is only possible to plot in 2 or 3 dimensions.')
        end
        if length(IDX)~=NumOfDataPoints %Check that each data point is assigned to a cluster
            error('The number of data points in Data must be equal to the number of indices in IDX.')
        end
        NumOfClusters=max(IDX);
        [NumOfCenters,Dims]=size(Centers);
        if Dims~=Dimensions
            error('The number of dimensions in Data should be equal to the number of dimensions in Centers')
        end
        if NumOfCenters<NumOfClusters %Check that each cluster has a center
            error('The number of cluster centers is smaller than the number of clusters.')
        elseif NumOfCenters>NumOfClusters %Check that each cluster has a center
            disp('There are more centers than clusters, all will be plotted')
        end
        Colors=hsv(NumOfCenters);
    case 4 %All data is given just need to check consistency        
        [NumOfDataPoints,Dimensions]=size(Data);
        if Dimensions~=2 && Dimensions~=3 %Check ability to plot
            error('It is only possible to plot in 2 or 3 dimensions.')
        end
        if length(IDX)~=NumOfDataPoints %Check that each data point is assigned to a cluster
            error('The number of data points in Data must be equal to the number of indices in IDX.')
        end
        NumOfClusters=max(IDX);
        [NumOfCenters,Dims]=size(Centers);
        if Dims~=Dimensions
            error('The number of dimensions in Data should be equal to the number of dimensions in Centers')
        end
        if NumOfCenters<NumOfClusters %Check that each cluster has a center
            error('The number of cluster centers is smaller than the number of clusters.')
        elseif NumOfCenters>NumOfClusters %Check that each cluster has a center
            disp('There are more centers than clusters, all will be plotted')
        end
        [NumOfColors,RGB]=size(Colors);
        if RGB~=3 || NumOfColors<NumOfCenters
            error('Colors should have at least the same number of rows as number of clusters and 3 columns')
        end            
end
%Data is ready. Now plotting
if Dimensions==2
    for i=1:NumOfCenters
        plot(Data(IDX == i,1),Data(IDX == i,2),'.','Color',Colors(i,:))
        hold on
        plot(Centers(i,1),Centers(i,2),'s','Color',Colors(i,:))
    end
else
    for i=1:NumOfCenters %plot data points 
        plot3(Data(IDX == i,1),Data(IDX == i,2),Data(IDX == i,3),'.','Color',Colors(i,:)) 
        hold on
        plot3(Centers(i,1),Centers(i,2),Centers(i,3),'s','Color',Colors(i,:))
    end
end