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
  backup_path=$( echo"/var/uset-backups/$dirname" )

  mkdir -p /var/uset-backups/$dirname

  echo "Backup directory tree created"
  sleep 1s
}

fn_backup_apache () {
  echo "Backing up apache config files..."
  sleep 1s

#  echo "Making directory for apache"
#  mkdir $backup_path/apache

  echo "Copying files"
  cp -r /etc/apache2/ $backup_path/apache2
  echo "Copying files sucessfull"
}

fn_backup_nginx () {
  echo "Backing up nginx config files..."
  sleep 1s

  echo "Copying files"
  cp -r /etc/nginx/ $backup_path/nginx
  echo "Copying files sucessfull"
}

fn_backup_php_fpm () {
  echo "Backing up php-fpm config files..."
  sleep 1s

  echo "Copying files"
#  cp -r /etc/php/7.4/fpm $backup_path/php-fpm
  echo "Copying files sucessfull"
}

fn_backup_webmin () {
  echo "Backing up Webmin..."
  sleep 1s

  echo "Copying files"
  cp -r /etc/webmin/ $backup_path/webmin
  cp /etc/init.d/webmin $backup_path/webmin/init.d_webmin
  echo "Copying files sucessfull"
}

fn_backup_mysql () {
  echo "Backing up MySql configuration files..."
  sleep 1s

  echo "Copying files"
  cp -r /etc/mysql/ $backup_path/mysql_config
  echo "Copying files sucessfull"
}

fn_backup_mysql_databases () {

}

fn_backup_web_apps () {
  echo "Backing up web application app files..."
  sleep 1s

  echo "Copying files"
  cp -r /var/www/ $backup_path/www
  echo "Copying files sucessfull"
}

fn_make_archive () {
  echo "Making archive..."
  sleep 1s
  zip -r $dirname.zip $backup_path
  mv $dirname.zip $backup_path
  echo "Archive available at $backup_path$dirname.zip"
}
