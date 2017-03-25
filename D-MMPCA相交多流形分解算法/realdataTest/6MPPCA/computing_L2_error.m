function mse = computing_L2_error(data, dim, idx, ctr, dir)

%  Modified by yong wang (yongwang82@gmail.com)

D = size(data,2);

K = max(idx);

if length(dim) == 1 && K > 1
    dim = dim*ones(K,1);
end


mse = 0;
for k = 1:K
    cls_k = data((idx==k),:);
    n_k = size(cls_k,1);
    if n_k > dim(k)
        mse = mse + sum(sum(((cls_k - repmat(ctr{k,1},n_k,1))*(eye(D) - dir{k,1}'*dir{k,1})).^2,2));
    end
end
