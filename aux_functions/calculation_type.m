function [full_path,dirname,np] = calculation_type(base_path,np,lm,use_lookup)
    if use_lookup
       dirname = ['th2_',num2str(np.th2_min),'-',num2str(np.dth2),'-',num2str(np.th2_max)];
       path = [base_path,'Lookup tables\'];
       if not(isfolder([path,dirname]))
          mkdir(path,dirname)
       end  
       np.th2 = linspace(np.th2_min,np.th2_max,np.th2_max/np.dth2); 
    else
      dirname = ['th2_',num2str(lm.th2)];
      path = [base_path,'Exact calculations\'];
      if not(isfolder([path,dirname]))
         mkdir(path,dirname)
      end
      np.th2=lm.th2; 
    end  
    full_path = [path,dirname,'\'];
end