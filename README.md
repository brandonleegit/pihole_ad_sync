# pihole_ad_sync
Synchronize Pihole local dns with Microsoft Active Directory DNS

## What does the script do?

- Dumps the DNS entries from the Active Directory database to a file
- Strip the file of any blank lines
- The file is SCPed by PowerShell to my primary Pihole server
- A cron job runs and copies entires from the uploaded file to the custom.list file in etc/pihole/ directory
- It restarts the DNS server in Pihole (a quick process)
- GravitySync (a separate community project) synchronizes the DNS entries between the primary Pihole server and the secondary Pihole server.

## Different parts of the script

Variables are set defining the file name, domain name, password (SCP purposes), and the connection string.  Note dnscopy is a nonsudo, underprivileged user I created, since I have the password embedded in the file
The PowerShell Get-DnsServerResourceRecord cmdlet dumps the DNS entries to the file specified
The file is then copied over to the Pihole server

## What you need to do

- 1). Replace the variables in the PowerShell script to match your domain, scp user password, and pihole connection properties
- 2). Create a non-privileged user on your Pihole server to use for the file upload
- 3). Replace the path for the home directory in the shell script to match your user created that accepts the upload
- 4). Create a CRON job to run the import.sh script to copy over the DNS entries
