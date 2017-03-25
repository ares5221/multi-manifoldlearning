
%%%%画出Hybrid数据集上运行DMPPCA算法
% 参数M Knn power angel 对分解相交多流形的精度的影响
figure('color','w');
%%%%M对结果的影响
subplot(2,4,1)
load MInfluence;
x=5:5:70;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Number of mixture models(M)');
ylabel('Clustering accuracy');
title('(a) Different M values','fontsize',12); 
%%%%KNN对结果的影响
subplot(2,4,2)
load KNNInfluence;
x=2:1:21;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Number of nearest neighbors(K)');
ylabel('Clustering accuracy');
title('(b) Different neighbors','fontsize',12); 
%%%%o对结果的影响
subplot(2,4,3)
load oInfluence;
x=1:1:15;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Tuning parameter(o)');
ylabel('Clustering accuracy');
title('(c) Different o values','fontsize',12); 
%%%%theta对结果的影响
subplot(2,4,4)
load thetaInfluence;
x=1:1:25;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Maximum tangent angle parameter(\theta)');
ylabel('Clustering accuracy');
title('(c) Different \theta values','fontsize',12); 