DELIMITER $$
CREATE TRIGGER UpdateCustomerCredibility
    AFTER INSERT ON Reviews
    FOR EACH ROW
    BEGIN
    SET @review_count = (SELECT COUNT(*) FROM Reviews AS r WHERE
r.NetID = NEW.NetID);
IF (@review_count IS NULL) THEN 
    UPDATE Customers
    SET Credibility = ‘level1’
    WHERE NetID= NEW.NetID;
    ELSEIF (@review_count >= 20) THEN 
        UPDATE Customers
        SET Credibility = ‘level3’
        WHERE NetID= NEW.NetID;
    ELSE 
        UPDATE Customers
        SET Credibility = ‘level2’
        WHERE NetID= NEW.NetID;
    END IF;
    END$$

DELIMITER ;