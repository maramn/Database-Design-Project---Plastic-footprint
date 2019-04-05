

--  inserting data into bin

INSERT INTO Bin (`type`, address, PostalCode, City, State, ImageSensor_ID)
values 
( 'Home', '3 Smith Street', 23457, 'Los Angeles', 'CA', 1),
( 'Public', 'Belconto Road', 23457, 'Los Angeles', 'CA', 2),
( 'Public', 'Roscomare Road', 23457, 'Los Angeles', 'CA', 3),
( 'Home', '59 Peter Street', 56732, 'Boston', 'MA', 4),
( 'Public', 'Downtown crossing', 21352, 'Boston', 'MA', 5),
( 'Home', '4 Parker Street', 67563, 'Cambridge', 'MA', 6),
( 'Public', 'Park Drive', 34567, 'Boston', 'MA', 7),
( 'Public', 'Newton', 56743, 'Boston', 'MA', 8),
( 'Home', '5 Boston Avenue', 29876, 'Albany', 'NY', 9),
( 'Home', '2371 Jerold Avenue', 78564, 'Kulpsville', 'PA', 10),
( 'Home', '750 Huntington Ave', 67865, 'Boston', 'MA', 11),
( 'Public', '3rd Avenue', 45673, 'Albany', 'NY', 12),
( 'Public', '227th Street', 56746, 'Albany', 'NY', 13),
( 'Public', 'Ames Street', 57632, 'Kulpsville', 'PA', 14),
( 'Public', 'James Street', 47373, 'Kulpsville', 'PA', 15);


-- SELECT * FROM bin;

-- Inserting data into USER

INSERT INTO USER (username, `password`, firstname, lastname, address, city, state, zipcode, Reg_date)
VALUES ( 'chris12', 'pranav123','Chris','Pratt','3 Smith Street','Boston','California',56745,'2019-02-23'),
('Evans1','rishi234','Chris','Evans','59 Peter Street','Boston','Massachusetts',73993,'2019-02-24'),
('Mark123','charan56','Mark','ruffalo','4 Parker street','Cambridge','Massachusetts',73993,'2019-02-25'),
('Josh','kiran78','Josh','Brolin','5 Boston Ave','Albany','New York',88976,'2019-02-26'),
('Robdow123','rob234','Robert','Downey','2371 Jerold Ave','Kulpsville','Pennslyvania',78654,'2019-02-27'),
('Scar17','clint23','Scarlett','Johhanson','750 Huntington','Boston','Massachusetts',78476,'2019-02-28');

INSERT INTO USER (username, `password`, firstname, lastname, address, city, state, zipcode, Reg_date)
VALUES 
('Sc17','clt23','Scaett','Johhson','750 Huntgton','Boston','Massachusetts',78476,'2019-02-28');

-- SELECT * FROM USER;


--  inserting data into CARD

INSERT INTO Card (`Status`, Expiry_date, user_id, Origination_date)
VALUES
( 'Active', '2025-12-31', 1, '2019-02-23' ),
( 'Active', '2025-12-31', 2, '2019-02-24' ),
( 'Active', '2025-12-31', 3, '2019-02-25' ),
( 'Active', '2025-12-31', 4, '2019-02-26' ),
( 'Active', '2025-12-31', 5, '2019-02-27' ),
( 'Active', '2025-12-31', 6, '2019-02-28' );



-- SELECT * FROM Card;

-- inserting data into store

INSERT INTO Store (`Name`, Address, city, state, Zipcode, Phone)
VALUES
 ('Walmart','3 Westland Avenue','NYC','NY',18872, 6177098764),
('Target','603 Mass Ave','Boston','MA',21151,8574136550),
 ('CVS','616 Columbus Ave','NYC','NY',16872,8929887654),
('Gaint Foodstores','65 PA-611','Bartonsville','PA',18321,8774543368),
('CVS','3210 Charlisle Road','Dover','PA',17315, 6746745673), 
('College Convenience','496 Southern Artery','Quincy','MA',12269, 7785679043),
('Whole Foods','Mill Town Square','Dowingtown','PA', 19335, 8764332156);

-- SELECT * FROM Store;


-- Data insert into Orders

INSERT INTO Orders (card_id, Store_id, order_date, total_cost)
VALUES 
( 4, 1, '2019-03-01', 0 ),
( 4, 2, '2019-03-04', 0 ),
( 5, 1, '2019-03-05', 0),
( 2, 3, '2019-03-05', 0 ),
( 1, 3, '2019-03-06', 0 ),
( 6, 2, '2019-03-10', 0 ),
( 5, 6, '2019-03-12', 0 );



-- SELECT * FROM Orders;


-- Data insert to transaction 

INSERT INTO Transaction (card_id2, bin_id, date_time, materialtype, weight)
VALUES
( 4, 1, '2019-03-31 3:22:11', 'Plastic', 20),
( 3, 5, '2019-03-31 3:24:11', 'Glass', 11),
( 1, 6, '2019-03-31 3:25:11', 'Plastic', 6),
( 6, 8, '2019-03-31 4:25:15', 'Other', 7),
( 4, 1, '2019-03-31 4:25:11', 'Plastic', 20),
( 4, 4, '2019-03-31 5:25:11', 'Plastic', 6),
( 3, 10, '2019-03-31 6:25:11', 'Glass', 18),
( 1, 14, '2019-03-31 7:25:11', 'Plastic', 26),
( 4, 1, '2019-03-31 8:25:11', 'Plastic', 20),
( 5, 7, '2019-03-31 9:25:15', 'Metal', 28),
( 2, 8, '2019-03-31 10:25:11', 'Metal', 26),
( 4, 11, '2019-04-01 12:48:10', 'Glass', 20),
( 1, 1, '2019-04-01 1:48:10', 'Plastic', 8),
( 6, 15, '2019-04-01 2:48:10', 'Other', 27),
( 1, 10, '2019-04-01 3:48:10', 'Plastic', 20),
( 5, 1, '2019-04-01 4:48:10', 'Plastic', 21),
( 4, 11, '2019-04-01 5:48:10', 'Glass', 20),
( 3, 4, '2019-04-01 6:48:10', 'Other', 16),
( 6, 7, '2019-04-01 7:48:10', 'Other', 15),
( 1, 10, '2019-04-01 8:48:10', 'Plastic', 8),
( 1, 12, '2019-04-01 9:48:10', 'Plastic', 25),
( 3, 12, '2019-04-02 6:48:10', 'Plastic', 30),
( 3, 12, '2019-04-02 6:48:10', 'Plastic', 30),
( 6, 10, '2019-04-02 7:48:10', 'Plastic', 16),
( 6, 4, '2019-04-02 8:48:10', 'Plastic', 18),
( 1, 11, '2019-04-02 9:48:10', 'Glass', 15),
( 1, 10, '2019-04-02 10:48:10', 'Metal', 29),
( 6, 10, '2019-04-02 11:48:10', 'Metal', 5),
( 6, 9, '2019-04-02 12:48:10', 'Glassl', 6),
( 6, 13, '2019-04-02 1:48:10', 'Plastic', 14),
( 3, 13, '2019-04-02 2:48:10', 'Plastic', 18),
( 2, 15, '2019-04-02 3:48:10', 'Plastic', 8),
( 4, 5, '2019-04-03 10:34:10', 'Plastic', 28);


-- SELECT * FROM Transaction;



-- Data insertion for product_details

INSERT INTO Product_details (`Name`, Price, materialtype, weight )
VALUES
( 'Hood Milk Whole milk 1 gallon', '2.99', 'Plastic', 54),
( 'Kirkland eggs 30 Pieces', '5.99', 'Plastic', 12),
( 'Tropicana 52 OZ orange juice', '3.99', 'Plastic', 40),
( 'Kraft Tomato Sauce 8 OZ', '8.99', 'Plastic', 23),
( 'Kirkland Apples 12 Piece', '12.99', 'Plastic', 5 ),
( 'Pampers swaddlers', '39.99', 'Plastic', 8),
( 'Kirkland tortilla chips', '5.99', 'Plastic', 6),
( 'Dasani water bottle 16OZ - 24PK', '2.99', 'Plastic', 296 ),
( 'Dasani water bottle 8OZ - 24PK', '2.99', 'Plastic', 144 ),
( 'Standard Plastic bag', '.10', 'Plastic', 5 ),
( 'Dasani water bottle 1lt - 24PK', '3.99', 'Plastic', 441),
( 'Coca Cola 2 litre', '2.19', 'Plastic', 42 ),
( 'Take out dinner trays 24 PK', '6.99', 'Plastic', 46 ),
( 'Dunkin Donuts Large Coffee', '2.99', 'Plastic', 8),
( 'Dove Shampoo 12OZ', '3.99', 'Plastic', 22),
( 'Hood Ice cream 1 quart', '2.50', 'Plastic', 16 ),
( 'Budweiser 300 ML - 6PK', '9.99', 'Glass', 1200),
( 'Teddie Peanut Butter 16 OZ', '3.99', 'Glass', 36),
( 'Jack Daniels Whiskey - 750 ML', '36.99', 'Glass', 350),
( 'Bonne Maman Fruit jar 16 OZ', '15.99', 'Glass', 32 ),
( 'Prego Traditional Pasta Sauce 24 OZ', '1.69', 'Glass', 48),
( 'California Extra Virgin Olive oil ', '5.69', 'Glass', 39),
( 'Nescafe Gold Blend 7 OZ', '9.99', 'Glass', 26),
( 'Apple Cider Vinegar 16 OZ', '4.19', 'Glass', 42),
( 'Wood bridge Mandavi', '9.99', 'Glass', 157 );


-- SELECT * FROM Product_details;

-- data for orders_product

INSERT INTO Orders_product (Orders_Order_id, Product_details_product_id, Quantity)
VALUES 
(1, 5, 2),
( 1, 18, 1),
( 1, 13, 3),
( 1, 12, 3),
( 1, 21, 2),
( 1, 24, 2),
( 1, 6, 3),
( 1, 24,1),
( 2, 13, 3),
(2, 19, 3),
( 2, 20, 3),
( 2, 20, 3),
( 2, 9, 2),
( 3, 22, 2),
( 3, 21, 1),
( 3, 16, 1),
( 3, 15, 1),
( 3, 6, 2),
( 3, 3, 3),
( 4, 14, 3),
( 4, 1, 3),
( 5, 11, 1),
( 5, 11, 1),
( 5, 17, 2),
( 5, 23, 2),
( 6, 12, 7),
( 7, 2, 3),
( 7, 14, 3),
( 7, 5, 3),
( 7, 16, 1);

-- SELECT * FROM Orders_Product;

-- SELECT * FROM Orders;





##########################################################################################



INSERT INTO Disposal_material (card_id4, plasticweight, glassweight, metalweight, otherweight, `date`)
VALUES

(1, 80, 40, 35, 20, '2019-03-03'),
(2, 90, 55, 29, 15, '2019-03-03'),
(3, 110, 60, 33, 20, '2019-03-03'),
(4, 70, 40, 50, 10, '2019-03-03'),
(5, 45, 34, 20, 18, '2019-03-03'),
(6, 150, 69, 58, 30, '2019-03-03'); 





-- SELECT * FROM Disposal_material;

###########################################################################################


INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('1', '1', '30', '2019/3/1');
INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('2', '2', '30', '2019/3/1');
INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('3', '3', '50', '2019/3/1');
INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('4', '4', '40', '2019/3/1');
INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('5', '5', '60', '2019/3/1');
INSERT INTO `final`.`score` (`score_id`, `card_id3`, `Score`, `date_generated`) VALUES ('6', '6', '50', '2019/3/1');




-- SELECT * FROM Score;

###########################################################################################

-- SELECT * FROM Purchase_material;

TRUNCATE purchase_material;

INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('1', '1', '110', '70', '55', '20');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('2', '2', '120', '80', '60', '20');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('3', '3', '150', '60', '70', '30');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('4', '4', '160', '55', '50', '35');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('5', '5', '150', '70', '40', '40');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('6', '6', '150', '80', '70', '50');
INSERT INTO `final`.`purchase_material` (`ID`, `order_id`, `plasticweight`, `glassweight`, `metalweight`, `otherweight`) VALUES ('7', '7', '110', '90', '80', '45');


