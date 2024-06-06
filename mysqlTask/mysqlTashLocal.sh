#!/bin/bash

# Configurare variabile
DB_HOST="instanta-hellen.mysql.database.azure.com"
DB_USER="pablitahellen"
DB_PASS="Elenitabonit@11"
DB_NAME="dbhellen"
BACKUP_PATH="/Users/elenita/work/mysqlTask"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_PATH}/${DB_NAME}_${DATE}.sql"


# Creează directorul de backup dacă nu există
mkdir -p $BACKUP_PATH

# Creează backup-ul bazei de date
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

# Verifică dacă backup-ul a fost creat cu succes
if [ $? -eq 0 ]; then
  echo "Backup-ul bazei de date $DB_NAME a fost creat cu succes: $BACKUP_FILE"
fi

