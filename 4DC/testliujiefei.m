function [ output_args ] = testliujiefei( input_args )
%TESTLIUJIEFEI Summary of this function goes here
%   Detailed explanation goes here

clear;
load('COIL20Croped.mat');
tic;
disp('Running D-C.for 3 liner plant..');
d=3;k=3;
X=COILcrop;
X=X';
[y,sX] = DC_meng(X,d,k);
toc

X1=X(:,sX{1});
X2=X(:,sX{2});
X3=X(:,sX{3});
X4=X(:,sX{4});
X5=X(:,sX{5});


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
end

