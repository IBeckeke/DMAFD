    function [Acc,Yt_pred] = DMA(Xs,Ys,Xt,Yt,options)    
    %% Load algorithm options
    if ~isfield(options,'p')
        options.p = 10;
    end
    if ~isfield(options,'eta')
        options.eta = 0.1;
    end
    if ~isfield(options,'lambda')
        options.lambda = 1.0;
    end
 
    
    X = [Xs,Xt];
    n = size(Xs,2);
    m = size(Xt,2);
    C = length(unique(Ys));
    acc_iter = [];
    
    YY = [];
    for c = 1 : C
        YY = [YY,Ys==c];
    end
    YY = [YY;zeros(m,C)];

    %% Data normalization
    X = X * diag(sparse(1 ./ sqrt(sum(X.^2))));

    %% Construct graph Laplacian
    if options.rho > 0
        manifold.k = options.p;
        manifold.Metric = 'Cosine';
        manifold.NeighborMode = 'KNN';
        manifold.WeightMode = 'Cosine';
        % options.gnd = gnd;
        % options.bLDA = 1;
        
        %% frist
        W = lapgraph(X',manifold);
        W(1:n,1:n)=0;
        %% second
        W(1:n,n+1:end)=0;
        W(n+1:end,1:n)=0;

        Dw = diag(sparse(sqrt(1 ./ sum(W))));
        L = eye(n + m) - Dw * W * Dw;
        
    else
        L = 0;
    end

    K = kernel_cal('rbf',X,sqrt(sum(sum(X .^ 2).^0.5)/(n + m)));
    V = diag(sparse([ones(n,1);zeros(m,1)]));
    knn_model = fitcknn(X(:,1:n)',Ys,'NumNeighbors',1);
    Cls = knn_model.predict(X(:,n + 1:end)');
    for t = 1 : options.T
     if ~isempty(Cls) && length(Cls)==m
        mu = evaluation(Xs',Ys,Xt',Cls);
        e = [1 / n * ones(n,1); -1 / m * ones(m,1)];
        M = e * e' * length(unique(Ys));
        N = 0;
        for c = reshape(unique(Ys),1,length(unique(Ys)))
            e = zeros(n + m,1);
            e(Ys == c) = 1 / length(find(Ys == c));
            e(n + find(Cls == c)) = -1 / length(find(Cls == c));
            e(isinf(e)) = 0;
            N = N + e * e';
        end
        M = (1/mu*M +mu*N)/(1/mu+mu);
        M = M / norm(M,'fro');
     else
        M=0;
     end
        Beta = ((V + options.lambda * (L)+options.rho* M) * K + options.eta *speye(n + m,n + m)) \ (V * YY);
        F = K * Beta;
	    [~,Cls] = max(F,[],2);
        C = Cls;
	%% Compute accuracy
    Acc = length(find(Cls(n+1:end)==Yt))/length(Yt);
	Cls = Cls(n+1:end);
    end
        Yt_pred = Cls;

    end

function V = updateV(n,m,Yt,F,ratio)
    Y = ones(m,1);
	ind = (sub2ind([m,size(F,2)],1:m,Yt'));
	tmp = (Y - F(ind)').^2;
	order = sort (tmp);
	M = tmp<order(ceil(ratio*m));
	V = diag(sparse([ones(n,1);M]));
 
end

function K = kernel_cal(ker,X,sigma)
    switch ker
        case 'linear'
            K = X' * X;
        case 'rbf'
            n1sq = sum(X.^2,1);
            n1 = size(X,2);
            D = (ones(n1,1)*n1sq)' + ones(n1,1)*n1sq -2*X'*X;
            K = exp(-D/(2*sigma^2));        
        case 'sam'
            D = X'*X;
            K = exp(-acos(D).^2/(2*sigma^2));
        otherwise
            error(['Unsupported kernel ' ker])
    end
end

function [mu,adist_m,adist_c] = evaluation(Xs,Ys,Xt,Yt)
    C = length(unique(Ys));
    list_adist_c = [];
    epsilon = 1e-3;
    for i = 1 : C
        index_i = Ys == i;
        Xsi = Xs(index_i,:);
        index_j = Yt == i;
        Xtj = Xt(index_j,:);
        adist_i = adist(Xsi,Xtj);
        list_adist_c = [list_adist_c;adist_i];
    end
    adist_c = mean(list_adist_c);
    
    adist_m = adist(Xs,Xt);
    mu = adist_c / adist_m;
    if mu > 1   
        mu = 1;
    elseif mu <= epsilon
        mu = 0;  
    end
end

function dist = adist(Xs,Xt)
    Yss = ones(size(Xs,1),1);
    Ytt = ones(size(Xt,1),1) * 2;
    
    model_linear = fitclinear([Xs;Xt],[Yss;Ytt],'learner','svm');
    ypred = model_linear.predict([Xs;Xt]);
    error = mae([Yss;Ytt],ypred);
    dist = 2 * (1 -   error);
end