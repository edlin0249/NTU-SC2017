x=[1.44  2.27  4.12  3.04  5.13  7.01  7.01 10.15  8.30  9.88];
y=[8.20 11.12 14.31 17.78 17.07 21.95 25.11 30.19 30.95 36.05];
data=[x; y];
theta=lineFitViaTls(data);
% TLS fitting
x2=linspace(min(x), max(x));
x2=linspace(min(x), max(x));
y2=(-theta(1)*x2-theta(3))/theta(2);	% y=(-ax-c)/b
plot(x, y, 'ro', x2, y2, 'b-'); axis image
% LS fitting
A=[x', ones(length(x), 1)];
theta2=A\y';
y3=theta2(1)*x2+theta2(2);	% y=a*x+b
line(x2, y3, 'color', 'm');
title('Line fit via TLS & LS');
legend('Sample data', 'TLS', 'LS', 'location', 'northOutside');