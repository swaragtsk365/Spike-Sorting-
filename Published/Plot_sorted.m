function Plot_sorted(Data,idx,C)
    [m,n]=size(C);
    figure;
    Colors=hsv(m);
    for i=1:m %plot data points 
        plot3(Data(idx == i,1),Data(idx == i,2),Data(idx == i,3),'s','MarkerEdgeColor','k','MarkerFaceColor',Colors(i,:)); 
        hold on;
        plot3(C(i,1),C(i,2),C(i,3),'s','Color',Colors(i,:));
    end
end