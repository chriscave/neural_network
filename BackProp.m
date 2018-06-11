function D = BackProp(X,y,theta,lambda)
  [rowct,colct] = decompose_blk_diag(theta);
  r = size(rowct,2);
  hyprowct = [1];
  for i = 2:r;
    k = hyprowct(i-1) + (rowct(i)-rowct(i-1)) + 1;
    hyprowct = [hyprowct,k];
  end
  H = hyp(X, theta);
  D = [];
  delta = H(hyprowct(size(rowct,2) - 1),:) - y';
  for i = (r - 1):-1:2;
    Delta = delta * H((hyprowct(i-1): hyprowct(i) -1),:)';
    theta_ = theta((rowct(i):rowct(i+1) - 1), (colct(i):colct(i+1) - 1));
    
    D_ = 1/(size(X,1)) * (Delta(:,(2:size(Delta,2))) + lambda * theta_(:,(2:size(Delta,2))));
    d_ = 1/(size(X,1)) * (Delta(:,1));
    
    D_ = [d_,D_];
    D = blkdiag(D_,D);
    
    A = (theta_' * delta);
    delta = A.* H(hyprowct(i-1): hyprowct(i) - 1, :) .* (1 - H(hyprowct(i-1): hyprowct(i) - 1, :) );
    delta(1,:) = [];
  end
  Delta = delta *  [ones(size(X,1),1),X];
  theta_ = theta((rowct(1):rowct(2) - 1), (colct(1):colct(2) - 1));
  D_ = 1/(size(X,1)) * (Delta(:,(2:size(Delta,2))) + lambda * theta_(:,(2:size(Delta,2))));
  d_ = 1/(size(X,1)) * (Delta(:,1));    
  D_ = [d_,D_];
  D = blkdiag(D_,D);
end  