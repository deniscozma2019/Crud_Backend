CREATE TABLE if not exists logs (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      message VARCHAR(255)
);
CREATE TABLE if not exists log_history (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             action VARCHAR(255),
                             message VARCHAR(255)
);

INSERT INTO logs (message) VALUES
                               ('Aplicația a pornit cu succes.'),
                               ('Accesul la baza de date a fost stabilit.'),
                               ('Utilizatorul "admin" s-a autentificat.'),
                               ('S-a încărcat pagina principală.'),
                               ('Eroare: conexiunea la serverul de baze de date a eșuat.');


/*CREATE TABLE log_history (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             action VARCHAR(255),
                             message VARCHAR(255)
);

CREATE TABLE log_history (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             action VARCHAR(255),
                             message VARCHAR(255)
);
*/



/*CREATE TRIGGER log_trigger AFTER INSERT ON logs
    FOR EACH ROW
BEGIN
    INSERT INTO log_history (action, message)
    VALUES ('Insert', NEW.message);
END;
*/
DROP TRIGGER IF EXISTS log_trigger;
CREATE TRIGGER  log_trigger AFTER INSERT ON logs
    FOR EACH ROW
    INSERT INTO log_history (action, message)
    VALUES ('Insert', NEW.message);






