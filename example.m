% CIJ is your adjacency matrix
thrvals = 10.^(-3:0.1:0); % thresholds

tic;
% adoption time matrix: seeds x targets x thresholds
A = zeros(N,N,length(thrvals),'single');
for t = 1:length(thrvals)
    thr = thrvals(t);
    for i = 1:N
        seeds = [i 1];
        [~,Z] = fcn_spread_synchronous_fast(CIJ,seeds,thr);
        A(i,:,t) = Z(:,1);
    end
    fprintf('thr %d done\n',thr);
end
toc;