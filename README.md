A database to track each citizen's plastic and other material consumption by also tracking their purchases. To essentially compare their purchases and disposal. We aimed to incentivise citizens with responsible behaiour. We have considered utilizing smart dust bins for tracking each disposed items properties and a card to individual customer. Here are the functionalities of the database

Triggers
```
tr_purchase_material_update : To calculate the cumulative plastic, metal, glass weights from individual citizen's grocery purchase order tracked by a card

disposal_update : Each transaction recording in smart bin is linked to key card account tracking the disposal

plastic_high : Notification if any citizen disposes plastic with more than 500 grams waste

person_bi : A notification, when a new user registers for this service

```

Functions 
```
score_estimator : A estimated score generating feature in our website for customers who would like to try our service

```

Stored Procedures
```
total_cost : Generates total cost for an order

insert_order_data : inserts data into order and order_product table
```
