function [final_gram,final_d,final_z] = run_csdp(alld,NX,NY,b_zmax)
% A = mat_completion(Ainit,indices,C);
% dxy - Given distances between x and y. Must be kept up to a constant. All others are free

% There are NX^2+NY^2+1 variables, for the Gram of X,Y and the shift variable

dxy = alld(1:NX,NX+1:end);


N = NX+NY;
% Z is the last element of P
P = sparse(N+1,N+1);
if b_zmax
  m = sparse(N+1,N+1);
  m(N+1,N+1) = -1;
else
  % Minimize trace
  m = speye(N+1,N+1);
  m(N+1,N+1) = 0;
end

% This means we minimize Z only

C(:,1) = m(:);
A=[];
b=[];
blk={};
A = sparse((N+1)*(N+1),NX*NY+1);
ind = 0;

for xi=1:NX
    for yi=1:NY
        ind = ind +1;
        m = sparse(N+1,N+1);
        fprintf('xi=%d yi=%d\n',xi,yi);
	% Set the constraint P(xi,xi)+P(NX+yi,NX+yi)-2*P(xi,NX+yi)==dxy(xi,yi)-Z);	
	m(xi,xi) = 1;
	m(NX+yi,NX+yi) = 1;
	m(xi,NX+yi) = -1;
	m(NX+yi,xi) = -1;	
	m(N+1,N+1) = 1;
	A(:,ind) = m(:);
	b(end+1) = dxy(xi,yi);
    end
end

% Add centering requirement
m = ones(N+1,N+1);
m(N+1,:) = 0;
m(:,N+1) = 0;
ind = ind +1;
A(:,ind) = m(:);
b(end+1) = 0;
%x0 = allg;
%x0(N+1,N+1) = 0;
%x0 = x0+eye(N+1)*1e-8;
%y0 = zeros(1,length(A));
%z0 = x0;

%sqlparameters;
K.s = N+1;
[final_gram] = csdp(A,b',C,K);
final_gram = reshape(final_gram,N+1,N+1);
final_z = final_gram(N+1,N+1);
final_gram = final_gram(1:N,1:N);

final_d = g_to_d(final_gram);
