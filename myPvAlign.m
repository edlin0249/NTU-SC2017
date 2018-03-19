function [minDistance, dpPath]=myPvAlign(p,q)
dpTable=zeros(length(q), length(p));
%initial dpTable(1,:) and dpTable(:,1)
for i = 1:length(p)
    dpTable(1,i) = sum(abs(q(1)-p(1:i)));
end

%construct dp table
for i = 2:length(q)
    for j = i:length(p)
        if j == i
            dpTable(i, j) = abs(q(i)-p(j))+dpTable(i-1, j-1);
        else
            dpTable(i, j) = abs(q(i)-p(j))+min(dpTable(i, j-1), dpTable(i-1, j-1));
        end
    end
end

[minDistance,minIndex] = min(dpTable(:,length(p)));
%backtrack the dp table
dpPath = zeros(2,length(p));
dpPath(:,length(p)) = [length(p) ; minIndex];
for i = length(p)-1:-1:1
    idx = dpPath(:,i+1);
    if idx(1) == idx(2)
        dpPath(:,i) = [idx(1)-1;idx(2)-1];
    elseif idx(2) == 1
        dpPath(:,i) = [idx(1)-1;idx(2)];
    else
        if dpTable(idx(2), idx(1)-1) < dpTable(idx(2)-1, idx(1)-1)
            dpPath(:,i) = [idx(1)-1;idx(2)];
        else
            dpPath(:,i) = [idx(1)-1;idx(2)-1];
        end
    end
end

end