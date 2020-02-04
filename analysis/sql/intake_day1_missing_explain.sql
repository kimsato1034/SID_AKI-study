-- This query tries to explain why patients have missing intake data after 24 hrs of adm

SELECT
patient.patientunitstayid 
, MAX(CASE WHEN patient.patientunitstayid = intakeoutput.patientunitstayid
THEN 1 ELSE 0
END) AS appears_in_intakeoutput
, MAX(CASE WHEN LOWER(cellpath) LIKE '%intake%' 
THEN 1 ELSE 0
END) AS receives_intake_atsomepoint
FROM
    `physionet-data.eicu_crd.patient` patient
LEFT JOIN
    `physionet-data.eicu_crd.intakeoutput` intakeoutput
USING
(patientunitstayid)
GROUP BY 
patientunitstayid
ORDER BY 
patientunitstayid
