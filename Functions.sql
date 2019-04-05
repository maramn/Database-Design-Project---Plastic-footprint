


DROP Function IF EXISTS score_estimator;


DELIMITER $$
CREATE FUNCTION score_estimator(p_plastic INT,p_glass INT,p_metal INT,p_other INT,d_plastic INT, d_glass INT,d_metal INT,d_other INT)
RETURNS TEXT
  
BEGIN
		IF (p_plastic + p_glass + p_metal  + p_other ) <> 100 THEN 
		RETURN 'Your purchase pecentage should be equal to 100';
		ELSEIF (d_plastic + d_glass + d_metal + d_other ) <> 100 then
		RETURN 'Your purchase pecentage should be equal to 100';
		END IF;
        
	RETURN CONCAT('Your Estimated Score ', ((p_plastic/d_plastic * 10)+(p_metal/d_metal * 3)+(p_glass/d_glass * 5)+(p_other/d_other * 2)));
END $$
DELIMITER ;


select score_estimator(40,30,20,10,10,50,20,20);




