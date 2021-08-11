function [TwoD_Bessel_lookup,bp] = TwoD_Bessel_lookup_load(full_path)
    bp = load([full_path,'\bp.mat']);
    S = load([full_path,'\TwoD_Bessel_lookup.mat'],'TwoD_Bessel_lookup');
    TwoD_Bessel_lookup = S.TwoD_Bessel_lookup;
end