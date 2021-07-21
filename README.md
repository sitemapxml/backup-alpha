# backup-alpha
Experimental backup utility for USet. Currently not recommended for production use.

Running the script:
```
git clone https://github.com/sitemapxml/backup-alpha
chmod +x backup
./backup
```

The script currently offer saving of following resources:

backing up various config files:
- http server config files
- webmin config files
- mysql config files
- ufw config files

**BACKING UP WEB APPLICATION**<br>
copying everything inside /var/www/
or everything inside web root definied in (apache or nginx) configuration file - `add to roadmap`
