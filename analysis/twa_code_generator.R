for (i in 16:59){
 print(paste('sq',i,' AS(    
  SELECTpatientunitstayid,labresultoffset AS offset',i,',sodiumn AS sodium',i,',chloriden AS chloride',i,'FROM aggregateddata WHERE rn=',i,')'
,sep=''))
}  

for (i in 16:59){
  cat(paste('LEFT JOIN sq',i,' USING (patientunitstayid)'
              ,sep=''))
} 

final<-0
for (i in 2:4){
  newterm <- cat('WHEN max_per_unitid_rn=',i,' THEN (((sodium',i-1,'+sodium',i,')/2)*(offset',i,'-offset',i-1,')',sep = '' )
  final <- paste(newterm ,'+', final, ')/(offset',i,'-offset01)', sep = '')
  print(final)
} 

#WHEN max_per_unitid_rn = 2 THEN (((sodium_1+sodium_2)/2)*(offset02-offset01))/(offset02-offset01)