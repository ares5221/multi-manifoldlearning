% This code checks to see that you have the required packages
% in order to test DC

clear;
load('X1500.mat');
tic;
disp('Running D-C...');
d=3;k=3;
[y,sX] = DC_meng(X,d,k);
toc

X1=X(:,sX{1});
X2=X(:,sX{2});
X3=X(:,sX{3});
X4=X(:,sX{4});
X5=X(:,sX{5});
X6=X(:,sX{6});
X7=X(:,sX{7});
%画出DC分解后的分类图，将X1X2保存即可

figure;      hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;

hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','c');       hold off;

hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','m');       hold off;

hold on;        
hin=scatter3(X4(1,:),X4(2,:),X4(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','y');       hold off;

hold on;        
hin=scatter3(X5(1,:),X5(2,:),X5(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','k');       hold off;

hold on;        
hin=scatter3(X6(1,:),X6(2,:),X6(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','b');       hold off;

hold on;        
hin=scatter3(X7(1,:),X7(2,:),X7(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','g');       hold off;

view(-10,10)
%计算分类精度
 labels(sX{1})=1;
labels(sX{2})=2;
labels(sX{3})=3;
 labels(sX{4})=4;
labels(sX{5})=5;
labels(sX{6})=6; 
labels(sX{7})=7;
accuracy_score = accuracy(labels', true_labels)