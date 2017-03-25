clear;
%%导入数据集
% path(path, 'benchmark data sets');
% name = 'hybrid';
% disp('-->Reading database');
% 导入数据集
M = load('X1500.mat');
%2500个全部点是一个s与一个平面的交叉流形，还有一个swiss环
% X=M.X;
% figure;      hold on;        
% hin=scatter3(X(1,:),X(2,:),X(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;

%X的前1500个是s与一个平面的交叉流形左边部分
X=M.X;
X=X(:,1:1500);

ppca_dim=2;
maxAngle=20;
r=0.8;
ncentres=60;
knn=6;
power=8;
crossTan=20;
tic;
[newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan);
 toc;
%画出扩展后的结果
X1=X(:,newsX{1});
X2=X(:,newsX{2});
figure; 

% 画出smmc重新分类后两个聚类分别的图像
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
view(-10,10)

%计算准确率
if(size(newsX{1},2)>=1000)
  acc=1-(size(newsX{1},2)-1000)/1500;
else
    acc=1-(1000-size(newsX,2))/1500;
end;
acc