function z = myAdd(x, y)
%assignment1
row = max(length(x(:, 1)), length(y(:, 1)));
col = max(length(x(1, :)), length(y(1, :)));

x2 = zeros(row, col);
x2(1:length(x(:, 1)), 1:length(x(1, :))) = x;

y2 = zeros(row, col);
y2(1:length(y(:, 1)), 1:length(y(1, :))) = y;

z = x2 + y2;