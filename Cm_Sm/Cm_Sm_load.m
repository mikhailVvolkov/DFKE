function [Cm,Sm]= Cm_Sm_load(full_path)
    C = load([full_path,'Cm.mat'],'Cm');
    Cm = C.Cm;
    S = load([full_path,'Sm.mat'],'Sm');
    Sm = S.Sm;
end