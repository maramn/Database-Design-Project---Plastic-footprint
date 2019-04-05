-- Users with less than avg plastic disposal.

DROP VIEW IF EXISTS Average_disposal_of_plastic ;

CREATE VIEW Average_disposal_of_plastic AS 
SELECT card_id4, plasticweight
FROM disposal_material
WHERE plasticweight > (SELECT AVG(plasticweight) FROM disposal_material);
 
SELECT * FROM Average_disposal_of_plastic;

################################################################################################################

-- Least plastic disposal users

DROP VIEW IF EXISTS Least_plastic_disposal ;


CREATE VIEW Least_plastic_disposal AS 
SELECT card_id4, plasticweight
FROM disposal_material
ORDER BY plasticweight DESC
LIMIT 3;

SELECT * FROM Least_plastic_disposal;

################################################################################################################


-- Disposal time of view

DROP VIEW IF EXISTS Disposal_time ;


CREATE VIEW Disposal_time AS


SELECT user.username, card.Card_ID, bin.type,transaction.date_time
FROM user INNER JOIN card ON user.user_id = card.user_id
JOIN transaction ON card.Card_ID = transaction.card_id2
JOIN bin ON transaction.bin_id = bin.bin_id
ORDER BY username; 

SELECT * FROM Disposal_time;


################################################################################################################

-- Final total Score view 

DROP VIEW IF EXISTS Final1_score ;


CREATE VIEW Final1_score AS 

SELECT card.card_ID, purchase_material.plasticweight AS PW, disposal_material.plasticweight AS DW, purchase_material.glassweight AS PG,  disposal_material.glassweight AS DG,  purchase_material.metalweight AS PM, disposal_material.metalweight AS DM, purchase_material.otherweight AS PO, disposal_material.otherweight AS `DO`,

((disposal_material.plasticweight/purchase_material.plasticweight)*10 + (disposal_material.glassweight/purchase_material.glassweight)*3 + (disposal_material.metalweight/purchase_material.metalweight) + (disposal_material.otherweight/purchase_material.otherweight))AS total_score

FROM disposal_material INNER JOIN card 

ON disposal_material.card_id4 = card.card_ID 

JOIN orders ON card.card_ID = orders.card_id 

JOIN purchase_material ON orders.order_id = purchase_material.order_id;


 

SELECT*FROM Final1_score;



################################################################################################################


DROP VIEW IF EXISTS users_higher_than_average ;


create view users_higher_than_average
as
select `User`.username, card_id3, score, Disposal_material.plasticweight,  Disposal_material.glassweight,  Disposal_material.metalweight,  Disposal_material.otherweight
from  `User` 
INNER JOIN Card 
ON `User`.user_id = card.user_id
JOIN Score 
ON Card.Card_ID = Score.card_id3
JOIN Disposal_material 
ON Card.Card_id = Disposal_material.card_id4
where Score.score > (select avg(score)
								from score) 
order by score desc;


select * from users_higher_than_average;