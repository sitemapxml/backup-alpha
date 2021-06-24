# Table of contents  #
# ####################

# backing up various config files:
# - http server config files
# - webmin config files
# - mysql config files
# - ufw config files
#
# BACKING UP WEB APPLICATION
# copying everything inside /var/www/
# or everything inside definied webroot (apache or nginx conf) - add to roadmap

fn_create_backup_directory () {
  echo "Creating backup directory /var/uset-backups/"
  sleep 1s
  mkdir /var/uset-backups

  echo "Creating backup archive directory "
  # dprint=$( date "+%D" | sed 's/\//_/g' )

  # Print date, hours and minutes
  dprint=$( date "+%D-%H%M" | sed 's/\//_/g' )
  dirname=$( echo "backup_$dprint" )

  mkdir -p /var/uset-backups/$dirname
}
