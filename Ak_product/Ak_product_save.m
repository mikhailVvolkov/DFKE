function Ak_product_save(full_path,Ak_product,ak)
    save([full_path,'Ak_product.mat'],'-v7.3','Ak_product');
    save([full_path,'ak.mat'],'-struct','ak');
end