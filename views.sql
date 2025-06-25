-- Creating Views from Advanced Queries

--  View 1: Top Diagnoses Summary
CREATE VIEW view_top_diagnoses AS
SELECT 
    diagnosis,
    COUNT(*) AS occurrence_count
FROM Visits
GROUP BY diagnosis
ORDER BY occurrence_count DESC;

-- View 2: Diagnosis Count by Gender
CREATE VIEW view_diagnosis_by_gender AS
SELECT 
    p.gender,
    v.diagnosis,
    COUNT(*) AS count
FROM Visits v
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY p.gender, v.diagnosis;

-- View 3: Doctor Patient Load
CREATE VIEW view_doctor_patient_load AS
SELECT 
    d.doctor_id,
    d.name,
    COUNT(DISTINCT a.patient_id) AS total_patients
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.name;

-- View 4: Unpaid Bills by Doctor
CREATE VIEW view_pending_bills_by_doctor AS
SELECT 
    d.doctor_id,
    d.name,
    COUNT(*) AS pending_bills
FROM Billing b
JOIN Visits v ON b.visit_id = v.visit_id
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE b.payment_status = 'Pending'
GROUP BY d.doctor_id, d.name;
