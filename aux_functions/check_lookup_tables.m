function [lookup_ok,warnings]=check_lookup_tables(full_path,th2,np)
    display(full_path)
    [TwoD_B_ok,warning_1]=TwoD_Bessel_lookup_check(full_path,th2,np);
    [Ak_ok,warning_2]=Ak_product_check(full_path,th2,np);
    
    warnings = [warning_1 ' ' warning_2];
    display(warnings);
    lookup_ok = TwoD_B_ok & Ak_ok;
end
