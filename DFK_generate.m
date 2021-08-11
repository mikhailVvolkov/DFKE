function DFK_generate(sc,lm,lp,sp,np,full_path,generate_tables,calculate_CmSm)
if generate_tables 
    TwoD_Bessel_lookup = TwoD_Bessel_lookup_generate(np);
    TwoD_Bessel_save(full_path,TwoD_Bessel_lookup,np); 
    [TwoD_Bessel_lookup,bp] = TwoD_Bessel_lookup_load(full_path);
    [Ak_product,bp] = Ak_product_lookup_generate(TwoD_Bessel_lookup,bp,np);
    Ak_product_save(full_path,Ak_product,bp);
end

if calculate_CmSm
    [th1,Ak]=Ak_product_load(full_path,lm,np,not(generate_tables));
    [Cm,Sm] = Cm_Sm_generate(sc.XUV,lm,lp,sp,np,th1,Ak);
    Cm_Sm_save(full_path,Cm,Sm);
end
end