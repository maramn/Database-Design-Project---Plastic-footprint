####################################################################################################
-- Trigger to update disposal_material


-- TRUNCATE Purchase_material;

SELECT * FROM Orders;

SELECT * FROM Orders_Product;


SELECT * FROM Product_details;

SELECT * FROM Purchase_material;





DROP TRIGGER IF EXISTS tr_purchase_material_update;

DELIMITER $$

CREATE TRIGGER tr_purchase_material_update
	AFTER INSERT
	ON Orders_Product
	FOR EACH ROW
BEGIN

DECLARE P INT;
DECLARE G INT;
DECLARE M INT;
DECLARE O INT;
DECLARE N INT;

SET N = NEW.orders_order_id;


SELECT  SUM(Orders_Product.Quantity * Product_details.weight ) 
				INTO @P
                FROM Orders 
                JOIN Orders_Product ON Orders.order_id = Orders_Product.Orders_Order_id
                JOIN Product_details  ON Orders_Product.Product_details_product_id = Product_details.product_id
                WHERE Orders_Product.Orders_Order_id = NEW.orders_order_id AND Product_details.materialtype = 'Plastic';


 SELECT  SUM(Orders_Product.Quantity * Product_details.weight ) 
                 INTO @G
                 FROM Orders 
				 JOIN Orders_Product ON Orders.order_id = Orders_Product.Orders_Order_id
                 JOIN Product_details  ON Orders_Product.Product_details_product_id = Product_details.product_id
                 WHERE Orders_Product.Orders_Order_id = NEW.orders_order_id AND Product_details.materialtype = 'Glass';


 SELECT  SUM(Orders_Product.Quantity * Product_details.weight )
                 INTO @M
                 FROM Orders 
                 JOIN Orders_Product ON Orders.order_id = Orders_Product.Orders_Order_id
                 JOIN Product_details  ON Orders_Product.Product_details_product_id = Product_details.product_id
                 WHERE Orders_Product.Orders_Order_id = NEW.orders_order_id AND Product_details.materialtype = 'Metal';

SELECT  SUM(Orders_Product.Quantity * Product_details.weight )
                INTO @O
                FROM Orders 
                JOIN Orders_Product ON Orders.order_id = Orders_Product.Orders_Order_id
                JOIN Product_details  ON Orders_Product.Product_details_product_id = Product_details.product_id
                WHERE Orders_Product.Orders_Order_id = NEW.orders_order_id AND Product_details.materialtype = 'Other';

INSERT INTO Purchase_material (order_id, plasticweight, glassweight, metalweight, otherweight) VALUES (NEW.orders_order_id, @P, @G, @M, @O);




END $$

DELIMITER ;

SELECT * FROM Orders;

SELECT * FROM Orders_Product;


SELECT * FROM Product_details;

SELECT * FROM Purchase_material;

INSERT INTO Orders(order_id, card_id, Store_id, order_date, total_cost) VALUES (9, 4, 1, '2019-03-01', 0 );
INSERT INTO Orders_Product(Orders_order_id, Product_details_product_id, Quantity) VALUES (9, 17, 3);



#########################################################################################

-- TRIGGER TO UPDATE DISPOSAL_MATERIAL TABLE FROM TRANSACTION


SELECT * FROM `Transaction`;

SELECT * FROM Disposal_material;



DROP TRIGGER IF EXISTS disposal_update;

DELIMITER $$


CREATE TRIGGER disposal_update
AFTER INSERT 
ON `Transaction`
FOR EACH ROW
BEGIN

IF new.materialtype = 'Plastic' THEN UPDATE Disposal_material SET plasticweight = plasticweight + new.weight WHERE new.card_id2 = Disposal_material.card_id4;

ELSEIF new.materialtype = 'Glass' THEN UPDATE Disposal_material SET glassweight = glassweight + new.weight  WHERE new.card_id2 = Disposal_material.card_id4;

ELSEIF new.materialtype = 'Metal' THEN UPDATE Disposal_material SET metalweight = metalweight + new.weight WHERE new.card_id2 = Disposal_material.card_id4;

ELSEIF new.materialtype = 'Other' THEN UPDATE Disposal_material SET otherweight = otherweight + new.weight  WHERE new.card_id2 = Disposal_material.card_id4;


END IF;


UPDATE Disposal_material SET `date` = NOW() WHERE new.card_id2 = Disposal_material.card_id4;

END $$


DELIMITER ;



INSERT INTO Transaction (card_id2, bin_id, date_time, materialtype, weight) VALUES (3,1,'2019-03-31 3:22:11', 'Glass', 500 );


SELECT * FROM `Transaction`;

SELECT * FROM Disposal_material;


###############################################################################################

-- TRIGGER ON USER TO TRACK NEW ADDITIONS IN USER_LOG


SELECT * FROM `User`;

SELECT * FROM User_log;


DELIMITER $$

CREATE TRIGGER person_bi
AFTER INSERT 
ON `User`
FOR EACH ROW

BEGIN

INSERT INTO User_log(`user`, message, `time`)

VALUES(CURRENT_USER(), 'New record is added to the person table', NOW());

END $$

DELIMITER ;

INSERT INTO `User`(username, `password`, firstname, lastname, address, city, state, zipcode, Reg_date)
VALUES
('spiderman','newavenger','peter','Parker','23rd street','Queens','Newyork',78476,'2019-04-04');


SELECT * FROM `User`;

SELECT * FROM User_log;



###################################################################################################

-- TRIGGER TO TRACK SPIKED DISPOSALS

SELECT * FROM `Transaction`;


DELIMITER $$

CREATE TRIGGER plastic_high
AFTER INSERT 
ON `Transaction`
FOR EACH ROW
BEGIN

IF NEW.weight > 500  THEN INSERT INTO User_log(`user`, message, `time`)

VALUES (CURRENT_USER(), 'A user has disposed more than 500 grams of plastic', NOW());


END IF ;


END $$

DELIMITER ; 


INSERT INTO Transaction (card_id2, bin_id, date_time, materialtype, weight) VALUES (3,1,'2019-03-31 3:22:11', 'Glass', 550 );

SELECT * FROM User_log;







