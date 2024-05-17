-- Задание 1
DELIMITER $$
CREATE FUNCTION format_seconds(seconds INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
DECLARE days INT;
DECLARE hours INT;
DECLARE minutes INT;
DECLARE remaining_seconds INT;
DECLARE result TEXT;
SET days = seconds / 86400; 
SET hours = (seconds - days * 86400) / 3600;
SET minutes = (seconds - days * 86400 - hours * 3600) / 60; 
SET remaining_seconds = seconds - days * 86400 - hours * 3600 - minutes * 60 ;
SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');
RETURN result;
END $$
DELIMITER ;
-- Проверка
SELECT format_seconds(123789);

 
 
-- Задание 2
DELIMITER $$
CREATE PROCEDURE Number2(x INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE res VARCHAR(255) DEFAULT '';
    IF x >= 2 THEN
		WHILE i <= x DO
			IF i % 2 = 0 THEN
				SET res = CONCAT(res, ' ', i);
			END IF;
            SET i = i + 1; 
		END WHILE;
    SELECT res;    
    ELSE
		SELECT 'Задайте корректное число';
	END IF;
END $$
DELIMITER ;
-- Проверка
CALL Number2(28);