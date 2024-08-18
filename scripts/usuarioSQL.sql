/*Script criado por Israel Alves Lucena Gomes em 30/04/2023*/
DROP DATABASE IF EXISTS T_REX;

CREATE DATABASE T_REX;

USE T_REX;

DROP PROCEDURE IF EXISTS concedePermissoes;

DELIMITER //
CREATE PROCEDURE concedePermissoes ()
	
	BEGIN
		/*Caso os usuários já existam*/
		DROP USER IF EXISTS 'BabyDino'@'localhost';
		DROP USER IF EXISTS 'BabyDino'@'%.%.%.%';
		DROP USER IF EXISTS 'BabyDino'@'%%';
		DROP USER IF EXISTS 'BabyDino'@'%';
		DROP USER IF EXISTS 'BabyDino'@'0';
		DROP USER IF EXISTS 'BabyDino'@'0.0.0.0';
		
		/* Criação do usuário */
		CREATE USER 'BabyDino'@'localhost' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
		CREATE USER 'BabyDino'@'%.%.%.%' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
		CREATE USER 'BabyDino'@'%%' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
		CREATE USER 'BabyDino'@'%' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
		CREATE USER 'BabyDino'@'0' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
		CREATE USER 'BabyDino'@'0.0.0.0' IDENTIFIED WITH mysql_native_password BY '12Nao_Eh_A_Mamae34';
	
		/* Concedendo privilégios */
		GRANT ALL PRIVILEGES ON *.* TO 'BabyDino'@'localhost';
		GRANT CREATE, ALTER, SELECT, DROP, REFERENCES, INDEX, RELOAD, TRIGGER, UPDATE, INSERT, DELETE ON *.* TO 'BabyDino'@'%.%.%.%';
		GRANT CREATE, ALTER, SELECT, DROP, REFERENCES, INDEX, RELOAD, TRIGGER, UPDATE, INSERT, DELETE ON *.* TO 'BabyDino'@'%';
		GRANT CREATE, ALTER, SELECT, DROP, REFERENCES, INDEX, RELOAD, TRIGGER, UPDATE, INSERT, DELETE ON *.* TO 'BabyDino'@'%%';
		GRANT CREATE, ALTER, SELECT, DROP, REFERENCES, INDEX, RELOAD, TRIGGER, UPDATE, INSERT, DELETE ON *.* TO 'BabyDino'@'0';
		GRANT CREATE, ALTER, SELECT, DROP, REFERENCES, INDEX, RELOAD, TRIGGER, UPDATE, INSERT, DELETE ON *.* TO 'BabyDino'@'0.0.0.0';
		
		/* Reiniciando */
		FLUSH PRIVILEGES;
		
END;

DELIMITER ;

CALL concedePermissoes();
