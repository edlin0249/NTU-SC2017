function p = SolvePro(t);
for i=2:Xmax;
    for j=2:Ymax;
        if state_edeg(i,j)=0
            p=(data(t,i-1,j)+data(t,i+1,j)+data(t,i,j-1)+data(t,i,j+1))/4;
            data(t,i,j)=p;
        end
    end
end
for j=2:Ymax;
    p=(data(t,2,j)+data(t,2,j)+data(t,1,j+1)+data(t,1,j-1))/4;
    data(t,1,j)=p;
end