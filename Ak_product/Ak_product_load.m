function [th1,ak_input]=Ak_product_load(full_path,lm,np,use_lookup)
S = matfile([full_path,filesep,'Ak_product.mat']);
ak = load([full_path,filesep,'ak.mat']);
l_array = [-ak.maxl_int:ak.maxl_int];
m_array = [-ak.m_max:ak.m_max];
th1 = ak.th1(ak.th1<=np.th1_max);

if use_lookup
        [~,th2_ind1] = min(abs(ak.th2 - lm.th2));
        th2_ind2 = th2_ind1 + sign(lm.th2 - ak.th2(th2_ind1));
        th2_qind = sort([th2_ind1 th2_ind2]);
        th1_qind = find(ak.th1<=np.th1_max);
        l_qindx = find(abs(l_array)<=np.maxl_int); % select only <= requested order l,m
        m_qindx = find(abs(m_array)<=np.m_max); % select only <= requested order l,m
        ak_query = S.Ak_product(th1_qind,th2_qind,l_qindx,m_qindx);
        ak_query_permuted = permute(ak_query,[2 1 3 4]);
        th2_query = ak.th2(th2_qind);
        ak_interpolated = interp1(th2_query,ak_query_permuted,lm.th2);
        ak_input = permute(ak_interpolated,[2 1 3 4]);
else
        ak_input = S.Ak_product;
end

end