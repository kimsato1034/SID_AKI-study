-- Outcomes
SELECT
   patientunitstayid
  ,MAX(unabridgedunitlos) AS unitlos_days
  ,MAX(unabridgedhosplos) AS hosplos_days
  ,MAX(unabridgedactualventdays) AS ventdays_days
  ,MAX(CASE WHEN actualhospitalmortality = 'ALIVE' THEN 0 
            WHEN actualhospitalmortality = 'EXPIRED' THEN 1 END) AS hospitalmortality
  ,MAX(CASE WHEN actualicumortality = 'ALIVE' THEN 0 
            WHEN actualicumortality = 'EXPIRED' THEN 1 END) AS icumortality        
FROM
  `physionet-data.eicu_crd.apachepatientresult`
  GROUP BY 
   patientunitstayid
  ,unabridgedunitlos
  ,unabridgedhosplos
  ,unabridgedactualventdays
  ORDER BY patientunitstayid