function y_prob_pred = prob_pred(X,theta);
  H = hyp(X,theta);
  y_prob_pred = H(end,:)';
end
  