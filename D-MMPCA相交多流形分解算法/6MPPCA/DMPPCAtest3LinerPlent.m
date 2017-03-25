% This code checks to see that you have the required packages
% in order to run SMMC 在三交叉平面
clear;
load( 'three_linear_planes.mat');

disp('Running DMPPCA in three_linear_planes...')
ppca_dim=2;
maxAngle=20;
r=0.6;
ncentres=60;
knn=9;
power=8;
crossTan=20;
tic;
[newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan);
 toc
%画出扩展后的结果
figure; 
X1=X(:,newsX{1});
X2=X(:,newsX{2});
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)

%计算准确率
if(size(newsX{1},2)>=1000)
  acc=1-(size(newsX{1},2)-1000)/1500;
else
    acc=1-(1000-size(newsX,2))/1500;
end;
acc


clear;

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
