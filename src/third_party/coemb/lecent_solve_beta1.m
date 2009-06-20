function m = lecent_solve(samp,NX,NY)

Fd={};
coeffs = [];
% The Fd matrices are generated such that D = \sum_i x_i F_i, where x_i are the
% elements of the upper triangle of the Gram matrix, and D is the distance matrix
% coeffs give d_{ij} = \sum_k x(k) coeff(k)

for i=1:NX+NY
    for j=i:NX+NY
        mat = zeros(NX+NY,NX+NY);
        if i~=j
            mat(i,j) = 2;
            mat(j,i) = 2;
        else
            mat(i,:) = -1;
            mat(:,j) = -1;
            mat(i,i) = 0;
        end
        Fd{end+1} = mat;
    end
end

F={};
% F is generator of the Gram matrix T = \sum x(k)F(k) 
for i=1:NX+NY
    for j=i:NX+NY
        mat = zeros(NX+NY,NX+NY);
        mat(i,j) = 1;
        mat(j,i) = 1;
        F{end+1} = mat;
    end
end

for i=1:NX+NY
    for j=i:NX+NY
        for k=1:length(F)
            v(k) = F{k}(i,j);
        end
        coeffs{i,j} = v;
    end
end


t = 1;
MAXITERS = 100;
niters = 1;
primal_obj = 0;

% Generate posynomial expressions for f0
c = zeros(1,(NX+NY)*(NX+NY+1)/2)
x0  = uptri_to_x(eye(NX+NY))';
A=[]; b= [];
ai=0;
for xi=1:NX
    for yi=NX+1:NX+NY
        ai = ai+1;
%        for i=1:length(Fd)
%            A2(ai,i) = Fd{i}(xi,yi);
%        end
        A(ai,:) = 2*coeffs{xi,yi}-coeffs{xi,xi}-coeffs{yi,yi};
        b(ai) = 0;
        c = c+A(ai,:)*sum(samp(1,:)==xi & samp(2,:)==yi-NX);
    end
end
b = b';
c = c'/length(samp);

szs(1) = size(A,1);

if size(szs,1) < size(szs,2),  szs = szs';  end;
n = length(x0);  N = size(A,1);  m = length(szs)-1;
n0 = szs(1);


% INITIALIZE AND CHECK FEASIBILITY OF x0

x = x0;  y = A*x+b;  f = log(sum(exp(y)))-dot(c,x);

ntiters = 0;
MAXITERS = 40;  % maximum total number of Newton iterations
NTTOL = 1e-10;    % stop centering when Nt decrement <= NTTOL 
ALPHA = 0.01; 
BETA = 0.5;      % parameters for backtracking line search
MAXLSITERS = 20; % maxiters in line searches backtracking
MU = 2.5;         % mu for update tplus = mu*t;
ABSTOL=1e-7;     % duality gap based stopping criterion
big_iters = 0;
MAXBIGITERS = 15;
CENTER_MINDELTA = 1e-5;
last_f = 0;

while (big_iters <= MAXBIGITERS)
    
    % Next lines for explicitly calculating target function   
    curr_dmat = g_to_d(vec_to_smat(x,F));
    pxy = exp(-curr_dmat);
    pxy = pxy(1:NX,NX+1:end);
    Z = sum(pxy(:));
    logpxy = -curr_dmat-log(Z);  %pxy/sum(pxy(:));
    loglik = 0;
    for i=1:length(samp)
        loglik = loglik + logpxy(samp(1,i),NX+samp(2,i));
    end
    loglik = loglik/length(samp);
    
    fprintf(1,'t=%g  N=%4d f=%g. RealLog=%g\n',t,big_iters,f,loglik);   
    % 
    
    center_iters = 0;
    while (center_iters <= MAXITERS)
        
        % FORM GRADIENT AND HESSIAN
        
        [bar_grad,bar_hess] = det_barrier_grad(x,F);
        
        gradf = exp(y)./sum(exp(y));
        
        xmat = vec_to_smat(x,F);     
        
        gradphi = A' * (gradf*t)-t*c +bar_grad; % +centering_grad;
        hessphi =  - ... % add the rank one hessf terms
            (A' * (exp(y) * ...
            t./(sum(exp(y))).^2)) * ...
            (exp(y') * A)  ... 
            + ... % add the diagonal hessf terms
            (A'*diag(gradf)*t) * A + bar_hess; % + centering_hess;
        % SOLVE NEWTON EQUATION
        if (rcond(hessphi)<eps)
            fprintf(1,'Ill conditioned in Newton\n');
            break;
        end
        dx = -hessphi\gradphi;
        %      dx = [0;dx];       % Generate zero movement on the first element
        center_iters = center_iters + 1;
        %      fprime = gradphi'*dx;
        dy = A*dx;
        %      if (-fprime/2 < NTTOL), break; end; 
        
        
        % BACKTRACKING LINE SEARCH
        
        
        phi = t*f - log(det(xmat)); %-log(sum(xmat)); %sum(log(-f(2:m+1)));
        s = 1e-1;
        for lsiters = 1:MAXLSITERS
            newf = log(sum(exp(y+s*dy)))-dot(c,(x+s*dx));
            newmat = vec_to_smat(x+s*dx,F);
            
            if (min(eig(newmat))> 0) % & sum(newmat)>0
                newphi = t*newf - log(det(newmat)); %-log(sum(newmat));
                %            if (newphi < phi + ALPHA*s*fprime)
                if (newphi < phi )
                    break;
                end
            end
            s = BETA*s;
        end
        
        x = x+s*dx;
        y = A*x+b;
        f = log(sum(exp(y)))-dot(c,x);
        if (abs(f-last_f)<CENTER_MINDELTA)
            fprintf(1,'Break Newton at %d\n',center_iters);
            break;
        end
        last_f = f;
        
        %     fprintf('In Newton %g. Iter=%d\n',newphi,lsiters);
    end
    
    t = min(MU*t, (m+1)/ABSTOL);  
    if t>100000
        break;
    end
    big_iters = big_iters+1;
end

m = vec_to_smat(x,F);



%for k=0:length(x)-1
%    v = [v diag(x,k)];
%end



