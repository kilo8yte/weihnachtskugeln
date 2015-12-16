$BASEURL="http://ausbildung.fum.de"
$PAGENUM=9
$COUNTER=0

#Liste aller Artikel erstellen
for($PAGECOUNT=1;$PAGECOUNT -le $PAGENUM;$PAGECOUNT++){
   $URL=$BASEURL+"/page/"+$PAGECOUNT
   $FILENAME=[string]$PAGECOUNT+".html"
    $URLS+=((wget $URL).Links| Where-Object {$_.href -like "http*"}|where class -eq "more-link").href
}

#Alle Artikel abrufen und nach dem Bild mit der Weihnachtskugel suchen
foreach($line in $URLS){
 write-host "Teste: "$line
 $Kugel=$NULL
 $Kugel=(wget $line).Images|Where-Object {$_.src -like "http://ausbildung.fum.de/wp-content/uploads/2015/11/weihnachtskugel.png"}|select alt
 if($Kugel -ne $NULL){
    Write-Host "Treffer: "$line -ForegroundColor Green
    ++$COUNTER
  }
}

write-host "Es sind insgesamt $COUNTER Weihnachtskugeln"




