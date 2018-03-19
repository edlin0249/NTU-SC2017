function output=circleFit(data)
avg = mean(data, 2);
diff = data-avg;
dist = diff.*diff;
dist = sum(dist, 1);
distsum=sqrt(sum(sqrt(dist)));
output0=[avg' distsum];
output1=fminsearch(@equation, output0);
output=output1'
    function f=equation(x)
    center=x(1:2)';
    t = data-center;
    t = t.*t;
    t = sum(t,1);
    t = abs(sqrt(t) - x(3));
    f=sum(t);
    end
end