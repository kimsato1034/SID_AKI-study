-- ------------------------------------------------------------------
-- Title: Patients first creatinine available value between -12 and +12h of ICU admission
-- Notes: SID_aki-study
--        eICU Collaborative Research Database v2.0.
-- ------------------------------------------------------------------
WITH tempo AS
  ( SELECT patientunitstayid,
           labname,
           labresultoffset,
           labresult,
           ROW_NUMBER() OVER (PARTITION BY patientunitstayid, labname ORDER BY labresultoffset ASC) AS POSITION
   FROM `physionet-data.eicu_crd.lab` lab
   WHERE ((labname) = 'creatinine')
     AND labresultoffset BETWEEN -6*60 AND 24*60 -- first creat available value between -6 and +24h from admission 
     ORDER BY patientunitstayid, labresultoffset )
SELECT patientunitstayid,
       max(CASE WHEN (labname) = 'creatinine' AND POSITION =1 THEN labresult ELSE NULL END) AS creat_first,
       max(CASE WHEN (labname) = 'creatinine' AND POSITION =1 AND labresult IS NOT NULL THEN labresultoffset ELSE NULL END) AS creat_first_offset
FROM tempo
GROUP BY patientunitstayid
HAVING MAX(labresult) IS NOT NULL
ORDER BY patientunitstayid
