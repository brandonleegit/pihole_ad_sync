# pihole_ad_sync
Synchronize Pihole local dns with Microsoft Active Directory DNS

##What does the script do?

- Dumps the DNS entries from the Active Directory database to a file
- Strip the file of any blank lines
- The file is SCPed by PowerShell to my primary Pihole server
- A cron job runs and copies entires from the uploaded file to the custom.list file in etc/pihole/ directory
- It restarts the DNS server in Pihole (a quick process)
- GravitySync (a separate community project) synchronizes the DNS entries between the primary Pihole server and the secondary Pihole server.
