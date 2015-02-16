function f = aug(x,k)
 sub    = 1000;
 perm   = randperm(size(x,1));
 sample = x(perm(1:sub),:);
 norms  = sum(sample.^2,2);
 dist   = norms*ones(1,sub)+ones(sub,1)*norms'-2*sample*sample';
 s      = 1/median(dist(:));
 w      = 2*s*randn(size(x,2),k);
 b      = 2*pi*rand(1,k)-pi;
 f      = @(x0) cos(bsxfun(@plus,x0*w,b));