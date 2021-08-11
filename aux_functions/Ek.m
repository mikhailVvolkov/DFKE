function E_k=Ek(XUV,w_pump,e_bg,U_pond,m,l,p_sign)
    E_k=p_sign*(XUV+2*cnst.h_bar*m*w_pump)-(e_bg+U_pond+l'*cnst.h_bar*w_pump);
    E_k(E_k<0)=0; 
end