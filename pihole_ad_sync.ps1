#Brandon Lee - Virtualizationhowto.com - v1.0
#Set variables for the script to run
$filename = "c:\custom.list"
$domain = 'mydomain.local'
$scppw = 'password'
$piholeconnect = 'dnscopy@pihole01.cloud.local:/home/dnscopy/'

#Run the DNS command to export entries to a file
Get-DnsServerResourceRecord -ZoneName $domain | where-object {$_.HostName -like "*.$domain" -and $_.Hostname -notlike "_*"} | select @{n='IP';E={$_.recorddata.IPV4Address}}, hostname | ft -HideTableHeaders | Out-File $filename

#Trim blank lines from the resulting file
(gc $filename) | ? {$_.trim() -ne "" } | set-content $filename

#Copy the exported DNS entries to Pihole
Start-Process 'C:\Program Files\PuTTY\pscp.exe' -ArgumentList ("-scp -pw $scppw $filename $piholeconnect")