function [lookup_ok,message]=Ak_product_check(full_path,th2,np)

    b0 = isfile([full_path ,'\ak.mat']);
    b1 = isfile([full_path ,'\AK_product.mat']);

    message = [];
    if b0 && b1
       ak = load([full_path,'\ak.mat']);
       b2 = (ak.th2_max >= th2) & (ak.th2_min <= th2); 
       if ~b2
          message = [message,'theta2 out of range'];
       end      
       b3 = (ak.th1_max >= np.th1_max);
       if ~b3
          message = [message,'theta1 out of range'];
       end
       b4 = (ak.m_max >= np.m_max);
       if ~b4
          message = [message,'m out of range'];
       end
       b5 = (ak.l_max >= np.l_max);
       if ~b5
          message = [message,'l out of range'];
       end
       b6 = (ak.dth1 <= np.dth1);
       if ~b6
          message = [message,'d_theta1 not small enough'];
       end
       b7 = (ak.maxl_int >= np.maxl_int);
       if ~b7
          message = [message,'maxl_int out of range'];
       end
       lookup_ok = b2 && b3 && b4 && b5 && b6 && b7;
    else
       lookup_ok = 0;
       message = [message,'file not found'];
    end
end