function [rowct,colct] = decompose_blk_diag(theta);
  A = theta * theta';
  B = theta' * theta;
  
  n = size(A)(1);
  p = zeros(1,n);
  p(1) = 1;
  rows = [];
  for i = 1:(n-1);
    if isequal(A * diag(p), diag(p) * A) ==1;
      rows = [rows,p'];
      p = zeros(1,n);
      p(i+1) = 1;
    else
      p(i + 1) = 1;
    end
  end
  rows = [rows,p']; #rows captures which projections commute with A. This will give the counter for the rows
  
  m = size(B)(1);
  q = zeros(1,m);
  q(1) = 1;
  
  cols = [];
  
  for i = 1:(m-1);
    if isequal(B * diag(q), diag(q) * B) ==1;
      cols = [cols,q'];
      q = zeros(1,m);
      q(i+1) = 1;
    else
      q(i + 1) = 1;
    end
  end
  cols = [cols,q']; #cols captures which projections commute with A. This will give the counter for the columns
  
  rowct = [];
  for i = 1: size(rows)(2);
    rowct = [rowct, min(find(rows(:,i)))];
  end
  rowct = [rowct, size(theta)(1)+1];
  
  colct = [];
  for i = 1: size(cols)(2);
    colct = [colct, min(find(cols(:,i)))];
  end
  colct = [colct, size(theta)(2)+1];
  
  
end