


SELECT User from mysql.user;
 
 -- Administrator
 
 
 CREATE USER admin_db@localhost IDENTIFIED BY 'mypass'; 
 
-- granting all privilages to administrator 
 
grant select, INSERT, update, delete on final.* to admin_db@localhost; 
grant all  on final.* to admin_db@localhost; 
 show grants for admin_db@localhost; 
 
 
 
 -- customer 

 CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'password123';  
  
-- granting select and update privilages to user

grant select, update on final.user to app_user@localhost; 
grant select, update on final.card to app_user@localhost; 
grant select, update on final.score to app_user@localhost; 
show grants for app_user@localhost; 



 -- company employee
 
 CREATE USER company_employee@localhost IDENTIFIED BY 'companylogin123'; 


 -- granting insert and update privilages to company employees 

 
grant select, insert, update on final.store to company_employee@localhost; 
grant select, insert, update on final.orders to company_employee@localhost; 
grant select, insert, update on final.product_details to company_employee@localhost; 
show grants for company_employee@localhost;