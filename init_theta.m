function itheta = init_theta(hl,m);
  [rowct,colct] = row_colct(hl,m);
  layer = [(m-1), hl, 1];
  
  epsilon = zeros(1, size(hl,2) +1);
  
  for i = 1: (size(rowct,2) -1)
    epsilon(i) = sqrt(6) / (sqrt(layer(i+1)) + sqrt(layer(i)));
  end
  
  itheta = [];
  for i = 1:(size(rowct,2) -1);
    itheta_ = rand(layer(i+1), layer(i) + 1)* (2* epsilon(i)) - epsilon(i);
    itheta = blkdiag(itheta,itheta_);
  end
  