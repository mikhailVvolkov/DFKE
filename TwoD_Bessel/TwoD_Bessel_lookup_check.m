function [lookup_ok,message]=TwoD_Bessel_lookup_check(full_path,th2,np)
    
a0 = isfile([full_path,'\bp.mat']);
a1 = isfile([full_path,'\TwoD_Bessel_lookup.mat']);

message = [];
if a0 && a1
    bp = load([full_path,'\bp.mat']);
    a2 = (bp.th2_max >= th2);
    if ~a2
        message = [message,'theta2 out of range'];
    end
    display(np.th1_max)
    display(bp.th1_max)
    a3 = (bp.th1_max >= np.th1_max);
    if ~a3
        message = [message,'theta1 out of range'];
    end
    a4 = (bp.l_max >=np.l_max);
    if ~a4
        message = [message,'l out of range'];
    end
    a5 = (bp.dth1 <= np.dth1);
    if ~a5
        message = [message,'d_theta not small enough'];
    end
    lookup_ok = a2 && a3 && a4 && a5;
else
    lookup_ok = 0;
    message = [message,'file not found'];
end

end