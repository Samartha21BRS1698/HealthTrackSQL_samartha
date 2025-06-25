-- table to log entries of triggers
CREATE TABLE Vitals_Alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    recorded_on DATETIME,
    alert_type VARCHAR(100),
    alert_message TEXT
);

-- Trigger: Flag Critical Vitals (BP > 150 OR Temp > 102)
DELIMITER $$

CREATE TRIGGER trg_vitals_alert
AFTER INSERT ON Vitals
FOR EACH ROW
BEGIN
    IF NEW.bp > 140 THEN
        INSERT INTO Vitals_Alerts(patient_id, recorded_on, alert_type, alert_message)
        VALUES (NEW.patient_id, NEW.recorded_on, 'High BP', CONCAT('BP is ', NEW.bp));
    END IF;

    IF NEW.temperature > 100 THEN
        INSERT INTO Vitals_Alerts(patient_id, recorded_on, alert_type, alert_message)
        VALUES (NEW.patient_id, NEW.recorded_on, 'High Temperature', CONCAT('Temp is ', NEW.temperature));
    END IF;
END$$

DELIMITER ;

-- testing the trigger
INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature)
VALUES (5, '2024-07-02 08:30:00', 130, 88, 100.5);  -- This should now trigger an alert

SELECT * FROM Vitals_Alerts WHERE patient_id = 5;
