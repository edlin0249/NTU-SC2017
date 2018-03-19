function teamRank=myTeamRank(GD)

A = 1./(1+exp(-GD));
A(1:5:end)=0;
B = bsxfun(@rdivide, A, sum(A));
tol = 0.00001;
[eigvec,eigval] = eig(B);
[deig, col] = max(max(abs(eigval)))
if (eigval(1) <= 1 + tol) && (eigval(1) >= 1 - tol)
    teamRank = eigvec(:,1);
    teamRank = abs(teamRank) / sum(abs(teamRank));
else
    teamRank = eigvec(col,:);
    teamRank = transpose(teamRank);
end
%[V, D] = eig(B)
%d = diag(D)
%[M, I] = max(d)
%teamRank = V(:,I)
end