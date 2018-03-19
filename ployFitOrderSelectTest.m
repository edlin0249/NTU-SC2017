%% Generate dataset
function x = polyFitOrderSelectTest()
fcn=@(x)sin(x)+exp(-x/5);
%ezplot(fcn, [-10 10]);
dataCount=50;	% No of data pairs
x=20*rand(1,dataCount)-10;
y=fcn(x)+0.2*randn(1,dataCount);
%plot(x, y, 'marker', 'o', 'linestyle', 'none', 'color', 'r');%%
%data=[x; y];
data=[3.18218131111339 -1.18762258702026 -3.03227653248418 -0.0677135078479463 3.96579906729307 -9.54507900094835 -9.15307187695309 1.1814789810637 4.18585308504255 7.89958927370291 -9.91998242990989 6.58363817544357 5.17592273668605 -2.73528359345039 -4.1464682126446 -2.87402882090714 5.01173587069482 8.77179556040694 7.73822081554785 -1.52338467759702 -7.19254203863555 -8.86814898006054 0.0897452630148408 1.00965062158236 9.02838409955871 -9.32706281830323 -4.85351571957086 -2.23373302212051 0.115613784777961 -6.67197717254632 -4.3878130317223 9.18821242707169 -3.51286792188582 -1.7656104401137 -1.93479124962791 -4.68252990102949 -5.22761862732236 9.79628657351691 9.06749886804899 5.13677786805179 -4.96667747161248 -8.48954300083939 3.24061176905699 -8.15269135410554 -8.25304696708314 4.39637036816794 -2.6737532720031 8.86657350663039 1.73547716608639 8.1647689095997;0.232899224213904 -0.0799433849165456 1.75304652060637 0.965036214032515 -0.385559790812596 6.99852715603427 6.0270974255789 1.68424710388782 -0.908233825694012 1.26542671290538 7.92506297864626 0.644196484422006 -0.118952701591702 1.4011059730042 2.99401919850115 1.58978066562779 -0.32281764647044 0.812025133830034 1.50277229803285 0.374514340178889 3.24113919552416 5.34215044768062 1.05530044714563 1.97113254752229 0.359590487802781 6.28781181151787 3.49653610583923 0.664648421302197 1.01417111012126 3.32574948921258 3.33323685892824 0.256653185628986 2.28906507986727 -0.0132796501710816 0.29109020727861 3.55332804053328 3.98729140190471 -0.217259508108903 0.296299355833338 -0.474021837143569 3.47449926131264 4.61548837925692 0.542091669381333 4.22688023641731 4.34032409554792 -0.65072035931881 0.989650754757774 0.94725080568874 1.25004508759507 1.29810080749568];
fprintf('data=%s\n', mat2str(data));
%% Perform model complexity determination based on LOOCV (leave-one-out cross validation)
maxOrder=20;
[orderBest, vRmse, tRmse]=polyFitOrderSelect(data, maxOrder);
fprintf('orderBest=%g\n', orderBest);
fprintf('vRmse=%s\n', mat2str(vRmse));
fprintf('tRmse=%s\n', mat2str(tRmse));
%% Plot the result
figure;
plot(0:maxOrder, tRmse, 'b.-', 0:maxOrder, vRmse, 'g.-');
line(orderBest, vRmse(orderBest+1), 'color', 'r', 'marker', 'o');
set(gca, 'yscale', 'log');
legend('Training RMSE', 'Validation RMSE', 'Min. of Validation RMSE', 'location', 'best');
xlabel('Orders of fitting polynomials');
ylabel('RMSE');
%% Polynomial fitting based on the selected order
x=data(1,:); y=data(2,:);
xNorm=(x-mean(x))/std(x);
poly=polyfit(xNorm, y, orderBest);
xDense=linspace(-10, 10);
yDense=polyval(poly, (xDense-mean(x))/std(x));
figure;
plot(xDense, yDense, x, y, 'o');
end