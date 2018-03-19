function [minV, minInd] = minxy(matrix)
minCol = min(matrix);
minV = min(minCol);
[row,col] = find(matrix==minV);
minInd = [row,col];