-- Stored Procedure to Get Patient Visit Summary
DELIMITER $$

CREATE PROCEDURE sp_patient_visit_summary(IN p_id INT)
BEGIN
    SELECT 
        v.visit_date,
        v.diagnosis,
        v.treatment,
        b.amount,
        b.payment_status
    FROM Visits v
    JOIN Appointments a ON v.appointment_id = a.appointment_id
    LEFT JOIN Billing b ON v.visit_id = b.visit_id
    WHERE a.patient_id = p_id
    ORDER BY v.visit_date DESC;
END$$

DELIMITER ;

-- calling the stored procedure
CALL sp_patient_visit_summary(10);
