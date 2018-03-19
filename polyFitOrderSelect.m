function [bestOrder, vRmse, tRmse]=polyFitOrderSelect(data, maxOrder)
%polyFitOrderSelect: Polynomial order selection based on LOOCV (leave-one-out cross validation)
%
%	Usage: [bestOrder, vRmse, tRmse]=polyFitOrderSelect(data, maxOrder)

dataCount=size(data, 2);	% Count of data pairs
orders=0:maxOrder;				% All possible orders
orderCount=length(orders);		% Count of orders for test
tRmse=zeros(orderCount, 1);		% Training RMSE (root mean squared error)
vRmse=zeros(orderCount, 1);		% Validation RMSE (root mean squared error)
tSse=zeros(dataCount, 1);		% SSE (sum of squared error) of training data of LOOCV for a specific order
vSse=zeros(dataCount, 1);		% SSE (sum of squared error) of validation data of LOOCV for a specific order

for i=1:orderCount
	order=orders(i);
	for j=1:dataCount	% Perform LOOCV
		vData=data(:,j);		% Validation data (which is held out)
		tData=data; tData(:,j)=[];	% Training data
		mu= mean(tData(1,:));		% Find mu and sigma of tData
		sigma=std(tData(1,:), 0);% Find mu and sigma of tData
		tData(1,:)=	(tData(1,:)-mu)/sigma;% Perform z-normalization on the input part of tData
		vData(1,:)= (vData(1,:)-mu)/sigma;	% Perform z-normalization on the input part of vData (using the mu and sigma from tData)
		theta = polyfit(tData(1,:), tData(2,:), order);  %implement the polyfit function
		tSse(j)=sum((tData(2,:)-polyval(theta, tData(1,:))).^2);	% Compute SSE of tData
		vSse(j)=sum((vData(2,:)-polyval(theta, vData(1,:))).^2);	% Compute SSE of vData
	end
	tRmse(i)=sqrt(sum(tSse)/(dataCount*(dataCount-1)));
	vRmse(i)=sqrt(sum(vSse)/dataCount);
end
[minValue, minIndex]=min(vRmse);
bestOrder=orders(minIndex);
end