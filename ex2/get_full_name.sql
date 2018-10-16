FUNCTION "get_full_name" (   
            IN im_firstname NVARCHAR(40) , 
            IN im_middlename NVARCHAR(40), 
            IN im_lastname NVARCHAR(40), 
            IN im_employeeid NVARCHAR(10) DEFAULT '' )
 RETURNS ex_fullname NVARCHAR(265)
 LANGUAGE SQLSCRIPT 
 SQL SECURITY INVOKER AS 
BEGIN 

if :im_middlename IS NULL THEN
   ex_fullname = :im_lastname || ', ' || :im_firstname;
 ELSE 
   ex_fullname = :im_lastname || ', ' ||
                 :im_firstname || ' ' || :im_middlename;
 END IF;
       
 IF :im_employeeid <> '' then 
   ex_fullname = :ex_fullname || '(' ||
                 :im_employeeid || ')';
 END IF;

END;
