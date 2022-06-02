DROP PROCEDURE IF EXISTS TagPopularDishes;

DELIMITER $$
CREATE PROCEDURE TagPopularDishes() 
BEGIN 
	DECLARE varRestaurantID INT;
	DECLARE varDish VARCHAR(255);
	DECLARE varPurchaseCt INT;
   	DECLARE loopExit BOOLEAN DEFAULT FALSE;
    
    DECLARE varReviewCt INT;
	DECLARE varAvgRating REAL;
	
	DECLARE cur CURSOR FOR (
		SELECT 	p2.RestaurantID, p2.DishName AS PopularDishes, Count(*) AS PurchaseCt
		FROM   Purchases p2 
		GROUP BY p2.RestaurantID, p2.DishName
		HAVING PurchaseCt = (
			SELECT Max(temp.purchaseCt) 
			FROM (
				SELECT p1.RestaurantID, p1.DishName, Count(*) AS purchaseCt 
				FROM   Purchases p1 
				GROUP  BY p1.RestaurantID, p1.DishName) AS temp 
				WHERE  temp.RestaurantID = p2.RestaurantID
			)
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET loopExit = TRUE;

	DROP TABLE IF EXISTS NewTable;
	CREATE TABLE NewTable(			 
		RestaurantID INT PRIMARY KEY,
		PopularDish VARCHAR(255)	
	);

OPEN cur;
   	cloop: LOOP
       	FETCH cur INTO varRestaurantID, varDish, varPurchaseCt;
        	IF loopExit THEN 
				LEAVE cloop;
        	END IF;
            
            SET varReviewCt = (SELECT  Count(*)
			FROM Reviews r JOIN Purchases p ON (r.PurchaseID = p.PurchaseID)
			WHERE  p.RestaurantID = varRestaurantID AND p.DishName = varDish);
            
            SET varAvgRating = (SELECT  Avg(r.Rating)
			FROM Reviews r JOIN Purchases p ON (r.PurchaseID = p.PurchaseID)
			WHERE  p.RestaurantID = varRestaurantID AND p.DishName = varDish);
                        
			IF (varPurchaseCt >= 3 OR (varReviewCt >= 2 AND varAvgRating >= 3.5)) THEN
				INSERT IGNORE INTO NewTable(RestaurantID, PopularDish) VALUES (varRestaurantID, varDish);
			END IF;
            
    END LOOP cloop;
CLOSE cur;
    
SELECT r.Name, r.Address, n.PopularDish FROM NewTable n NATURAL JOIN Restaurants r;

END$$

DELIMITER ;
