-- Total Cost of an Order

SET SQL_mode = ' ' ;

SELECT * FROM Orders;

SELECT * FROM Orders_Product;

SELECT * FROM Product_details;

-- STORED PROCEDURE TO COMPUTE TOTAL COST OF AN ORDER

DROP PROCEDURE total_cost;

DELIMITER $$

CREATE PROCEDURE total_cost ( in p_id INT)
BEGIN

SELECT SUM(Orders_Product.Quantity * Product_details.price) AS Cost
FROM ((Orders JOIN Orders_Product ON Orders.order_id = Orders_Product.Orders_Order_id)
JOIN Product_details ON Orders_Product.Product_details_product_id = Product_details.product_id)
WHERE Orders.order_id = p_id;

END$$

DELIMITER ;


call total_cost(1);


-- #####################################################################################

-- STORED PROCEDURE TO INSERT DATA INTO ORDERS AND ORDER_PRODUCT TABLES


SELECT * FROM Orders;

SELECT * FROM Orders_Product;

SELECT * FROM Product_details;


DROP PROCEDURE IF EXISTS insert_order_data;


DELIMITER $$

Create Procedure insert_order_data(
 in orderid VARCHAR(5),in cardid VARCHAR(5), in storeid VARCHAR(5), in orderdate DATE, in ProductID1 VARCHAR(5), in Quantity1 SMALLINT(5))
BEGIN 

START TRANSACTION;
      INSERT INTO Orders (order_id, card_id, Store_id, order_date)
        values(orderid, cardid, storeid, orderdate);
	  
      INSERT INTO Orders_Product (Orders_Order_id, Product_details_product_id, Quantity)
        values(orderid, ProductID1, Quantity1);
        
Commit;
END $$

DELIMITER ;



CALL insert_order_data ( 8, 4, 1, '2019-03-19', 3, 1) ;


SELECT * FROM Orders;

SELECT * FROM Orders_Product;









	































