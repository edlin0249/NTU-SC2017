function output=circleFit(X, method)


if method == 1
x = X(1,:)
y = X(2,:)


A = [2*x; 2*y; ones(1, size(X, 2))]

    %dim = size(A)

b = x.^2+y.^2
theta = A'\b'
a = theta(1)
b = theta(2)
r = sqrt(theta(3)+a^2+b^2)
output = [a b r]'
end    
if method == 2
    
center0 = mean(X, 2);% Initial guess of the center
center = fminsearch(@(x)sseOfcircleFit(x, X), center0);	% Use fminsearch to find center
[sse, r]=sseOfcircleFit(center, X);	% Use sseOfEllipseFit to obtain the final sse &amp; radius
center;
output=[center', r]';

    % Function that returns SSE and the linear parameters
end

%{
function [theta, sse]=ellipseFit(data)

center0 = mean(data, 1)	;	% Initial guess of the center
center=fminsearch(@(x)sseOfEllipseFit(x, data), center0);	% Use fminsearch to find center
[sse, radius]=sseOfEllipseFit(center, data);	% Use sseOfEllipseFit to obtain the final sse &amp; radius
theta=[center, radius]

% Function that returns SSE and the linear parameters
    function [sse, radius]=sseOfEllipseFit(center, data)
    x = data(:,1);
    y = data(:,2);
    A = [(x-center(1)).^2 (y-center(2)).^2];
    s = size(x);
    r = A\ones(s(1), 1);
    r = sqrt(1./r);
    %y2 = sqrt(-(r(2)^2)/(r(1)^2)*(x.^2)+(r(2)^2));
    sse = sum((((x-center(1))/r(1)).^2+((y-center(2))/r(2)).^2 - 1).^2);
    radius = r';
    end
end

%}
end

    function [sse, r]=sseOfcircleFit(center, X)
    x = X(1,:);
    y = X(2,:);
    A = [2*x; 2*y; ones(1, size(X, 2))];
    A = [2*x; 2*y; ones(1, size(X, 2))];

    %dim = size(A)

    b = x.^2+y.^2;
    theta = A'\b';
    a = theta(1);
    b = theta(2);
    r = sqrt(theta(3)+a^2+b^2);
    %{
    s = size(x)
    r = A'\ones(3,s(2));
    r = sqrt(1./r)
    r_size = size(r)
    %}
    %y2 = sqrt(-(r(2)^2)/(r(1)^2)*(x.^2)+(r(2)^2));
    sse = sum((sqrt((x'-center(1)).^2+(y'-center(2)).^2)+r).^2);
    radius = r;

    end