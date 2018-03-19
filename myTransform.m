function output = myTransform(vec, theta, mode)
xset=vec(1,:);
yset=vec(2,:);
[theta2, rho2] = cart2pol(xset, yset);
if strcmp(mode, "rotate") == 1
    theta3 = theta + theta2;
    [x, y] = pol2cart(theta3, rho2);
else
   theta3 = theta2 - theta;
   theta4 = theta2 + theta3 * (-2.0);
   [x, y] = pol2cart(theta4, rho2);
end
output = [x;y];
