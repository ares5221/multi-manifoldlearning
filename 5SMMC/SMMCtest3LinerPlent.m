% This code checks to see that you have the required packages
% in order to run SMMC 在三交叉平面
clear;
load( 'three_linear_planes.mat');

disp('Running SMMC in three_linear_planes...')
nClusts=3;
ppca_dim=2;
ncentres=120;
knn=9;
power=8;
tic;
[cluster_labels,ppca_label,mse,time_mppca,time_smmc,time_sc,W] = smmc(X,nClusts,ppca_dim,ncentres,knn,power)
toc
cluster_labels=cluster_labels';
for j=1:3
    d=0;
    for i=1:1200 
        if (cluster_labels(:,i)==j)  
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出kmeans分解后的分类图，将X1X2保存即可
[m,n,b]=find(PP(1,:));
X1=X(:,b);
[m,n,bb]=find(PP(2,:));
X2=X(:,bb);
[m,n,bbb]=find(PP(3,:));
X3=X(:,bbb);
figure;      hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)
clear;
