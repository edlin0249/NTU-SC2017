data=[12 -5 13 -3 -8 3 7 -4 7 -4 -4 -1 -5 2 13 -5 -6 5 -5 -8 -6 -7 2 9 -5 -4 -5 8 4 -1 12 1 7 11 11 -1 9 0 -5 14 -3 -8 -3 12 -1 -1 13 7 -6 -7 12 12 -8 10 6 14 -7 6 10 12 8 14 7 8 -1 10 9 13 3 13 -7 12 7 13 -5 -7 -2 9 10 -6 7 7 14 10 9 -6 11 -3 12 -6 8 12 9 10 11 11 1 1 -6 -4;
	3 13 6 1 9 16 15 1 17 13 -1 -3 9 17 12 5 3 -2 0 7 6 10 15 -4 8 -1 0 14 17 16 12 -3 -3 6 11 -3 14 16 13 9 -2 6 12 7 -4 15 5 -3 12 4 7 5 4 2 -1 6 10 16 0 7 1 10 15 -1 17 0 14 5 16 9 0 1 -1 0 12 2 -1 16 0 13 -2 15 7 1 -2 11 11 3 6 10 15 0 15 7 0 4 -4 -1 5 1];
theta1=circleFit(data, 1);
theta2=circleFit(data, 2);
fprintf('Method 1:\n');
fprintf('theta1=%s\n', mat2str(theta1));
difVec=data-repmat(theta1(1:2), 1, size(data,2)); J1=sum((sqrt(sum(difVec.^2))-theta1(3)).^2);	% Compute the objective function
fprintf('J1=%g (Obj. function)\n', J1);
fprintf('Method 2:\n');
fprintf('theta2=%s\n', mat2str(theta2));
difVec=data-repmat(theta2(1:2), 1, size(data,2)); J2=sum((sqrt(sum(difVec.^2))-theta2(3)).^2);	% Compute the objective function
fprintf('J2=%g (Obj. function)\n', J2);
% Plotting
t=linspace(0, 2*pi);
x1=theta1(1)+theta1(3)*cos(t);
y1=theta1(2)+theta1(3)*sin(t);
x2=theta2(1)+theta2(3)*cos(t);
y2=theta2(2)+theta2(3)*sin(t);
plot(data(1,:), data(2,:), '.', x1, y1, 'b', x2, y2, 'm');
axis image
legend('Sample data', 'Method=1', 'Method=2', 'location', 'northOutside', 'orientation', 'horizontal');