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