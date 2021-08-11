function matrix = XUV_matrix(XUV,qJDOS)
    sz = size(qJDOS);
    matrix = XUV*ones(1,sz(2));
end