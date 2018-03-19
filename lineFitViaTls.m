function coef=lineFitViaTls(data)
data_t = data'
mean_v = mean(data_t)
data_t = data_t - mean_v
C = cov(data_t)
[V,D] = eig(C)
d = diag(D)
%[B,I] = sort(d, 'descend')
U = V(2,:)
N = [U(2) -U(1)]
C3= -mean_v*N'
coef = [N C3]
end