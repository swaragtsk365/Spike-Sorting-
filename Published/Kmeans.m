function Clu, center_init, distance=Kmeans(data, num_clus, steps)
    [~,N]=size(data);
    center_initi=randi([1,N],1,num_clu);
    center_init=data(center_initi, :);
    for k=1:steps
        distance=[];
        for l=1:length(center_init(:,1))
            tmp_distance = sqrt(sum((data - center_init(:,l))^2,2));
            tmp_distance = tmp_distance + abs(random.randn(0,1,[1,length(tmp_distance)])*0.0001);
            distance=[distance temp_distance];
            Clu = find((distance == min(distance))');
        end
        center_init=[];
        for P=1:num_clus    
            center_init=[center_init mean(data(Clu == P, :),1)];
        end
    end
    
end