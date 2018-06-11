function [rowct,colct] = row_colct(hl,m);
  layer = [(m-1), hl, 1];
  
  rowct = zeros(1, size(hl,2) + 1); 
  colct = zeros(1, size(hl, 2) + 1);
  rowct(1) = 1;
  colct(1) = 1;
  rowct = [rowct,sum(hl) + 2];
  colct = [colct,  m + sum(hl) + size(hl,2)+1];

  for i = 2: (size(rowct,2) -1);
    colct(i) = colct(i-1) + layer(i-1) + 1;
    rowct(i) = rowct(i-1) + layer(i);
  end
end