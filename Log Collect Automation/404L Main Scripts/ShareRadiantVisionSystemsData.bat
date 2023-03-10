net share "Radiant Vision Systems Data" /del /yes
mkdir "C:\Radiant Vision Systems Data"
net share "Radiant Vision Systems Data"="C:\Radiant Vision Systems Data" /GRANT:Everyone,FULL
cacls "C:\Radiant Vision Systems Data" /t /e /g Everyone:f