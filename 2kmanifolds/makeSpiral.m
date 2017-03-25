function [P, Cluster] = makeSpiral(numP, sigma, numArms);

for ix = 1:numP
   tmp = rand(1);
   jx = floor(tmp*numArms) + 1;   %向下取整
   theta = jx * (2*pi)./numArms;
   tmp = rand(1);
   P(:, ix) = (exp(tmp)-1) .* [cos(3*tmp+theta) sin(3*tmp+theta)];
   Cluster(ix) = jx;
end
P = P + sigma*randn(size(P));  %产生一个元素是正态分布的随机数的与P同行列矩阵

return
 