function y_pred = pred(X,theta,threshold);
  y_prob_pred = prob_pred(X,theta);
  y_pred = y_prob_pred > threshold;
end