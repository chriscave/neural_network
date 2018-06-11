function [theta, Cost_history] = TrainDNN(X,y,hl,alpha,lambda,num_iters);
  [n,m] = size(X);
  [rowct,colct] = row_colct(hl,m+1);
   
  Cost_history = [];
  theta = init_theta(hl,m+1);
  for iter = 1:num_iters;    
    D = BackProp(X,y,theta,lambda);    
    theta = theta - alpha * D;
    Cost_history = [Cost_history;Cost(X,y,theta,lambda,rowct,colct)'];
  end
end