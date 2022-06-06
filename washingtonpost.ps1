#Automatic Data Scraper for The washingtonpost Scrapper
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$FinalPath = "." #"C:\Users\my\Downloads\washingtonpost"

$today=(Get-Date -Format "yyMMdd")
#Write-Host $today
##################################################################

$logdatetime = ((Get-Date).ToString('yyyy-MM-dd_HH-mm-ss'))
$LogFile= $logdatetime+".txt" #$FinalPath+"\log\log_"+$logdatetime+".txt"

$date = get-date -Format "yyyy-MM-dd"
$convertDate = [DateTime]$date

$GetDate = '{0:d MMMM yyyy}' -f $convertDate -replace "-"," "
$category = "Washington Post"

$path=$FinalPath+"\output"

$AnswerFile = $path+"\"+$date+".txt"

$edate=[DateTimeOffset]::Now.ToUnixTimeSeconds()
function WriteLog
{
    Param ([string]$LogString)
    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $LogFile -value $LogMessage
}

if (Test-Path $AnswerFile){
    # Remove the existing file
    Remove-Item -Path $AnswerFile -Force -ErrorAction Ignore
}
Writelog "[Info] Started scrapper"

[string]$sStringToEncode='{"uid":"2121475642_1651250365","updateLoadTable":false,"timestamp":'+$edate+'000}'
$sEncodedString=[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($sStringToEncode))

#$Url="https://cdn1.amuselabs.com/wapo/crossword?id=ebirnholz_"+$today+"&set=wapo-eb&embed=1&picker=wp-picker&limit=5&heightReduction=60&src=https://www.washingtonpost.com/crossword-puzzles/sunday-evan-birnholz/&uid=2121475642_1651250365&pickerToken=$sEncodedString"

#Write-Host $Url
#$Url="https://cdn1.amuselabs.com/wapo/crossword?id=ebirnholz_220522&set=wapo-eb&embed=1&picker=wp-picker&limit=5&heightReduction=60&src=https%3A%2F%2Fwww.washingtonpost.com%2Fcrossword-puzzles%2Fsunday-evan-birnholz%2F&uid=2121475642_1651250365&pickerToken=eyJ1aWQiOiIyMTIxNDc1NjQyXzE2NTEyNTAzNjUiLCJ1cGRhdGVMb2FkVGFibGUiOmZhbHNlLCJ0aW1lc3RhbXAiOjE2NTMyMTQ1OTE5NTd9"

$Url = "https://cdn1.amuselabs.com/wapo/crossword?id=ebirnholz_220529&set=wapo-eb&embed=1&picker=wp-picker&limit=5&heightReduction=60&src=https%3A%2F%2Fwww.washingtonpost.com%2Fcrossword-puzzles%2Fsunday-evan-birnholz%2F&uid=2121475642_1651250365&pickerToken=eyJ1aWQiOiIyMTIxNDc1NjQyXzE2NTEyNTAzNjUiLCJ1cGRhdGVMb2FkVGFibGUiOmZhbHNlLCJ0aW1lc3RhbXAiOjE2NTQ0MTI2MzEyMjl9"

$res2=invoke-webrequest $Url
$res2.Content -match "(window.rawc = ')([^']+)(')"
$ec=$matches[2]
# $dc=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(($ec+"==")))
# Write-Host $ec
# Writelog $dc 
# $json_ob=$dc|convertFrom-Json
# if ($json_ob.placedWords.count -gt 3){
# 	$json_ob.placedWords |ForEach-Object {
# 		$clue = $_.clue.clue -replace "\.$","" -replace "{[^}]+}"
# 		$ans = $_.originalTerm.toUpper() -replace "{[^}]+}"
# 		Add-Content $AnswerFile -value "$GetDate===$date===$category===$clue===$ans===$clue - Correct Answer For $category | $GetDate" -Encoding UTF8 
# 	}
# Writelog "[Info] Scrapper finished execution"
# }
# else {
# 	Writelog "[Info] No or less than 3 clues"
# }
