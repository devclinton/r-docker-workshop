# Fetches our data for windows
$url = "http://www.biz.uiowa.edu/faculty/jledolter/DataMining/protein.csv"
$output = "data\protein.csv"
(New-Object System.Net.WebClient).DownloadFile($url, $output)