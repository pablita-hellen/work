#!/bin/bash

# Configurare variabile
DB_HOST="instanta-hellen.mysql.database.azure.com"
DB_USER="pablitahellen"
DB_PASS="Elenitabonit@11"
DB_NAME="dbhellen"
BACKUP_PATH="/Users/elenita/work/mysqlTask"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_PATH}/${DB_NAME}_${DATE}.sql"

# Configurare variabile pentru Azure Blob Storage
STORAGE_ACCOUNT="backupshellen"
CONTAINER_NAME="backupshellencontainer"

# Creează directorul de backup dacă nu există
mkdir -p $BACKUP_PATH

# Creează backup-ul bazei de date
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

# Verifică dacă backup-ul a fost creat cu succes
if [ $? -eq 0 ]; then
  echo "Backup-ul bazei de date $DB_NAME a fost creat cu succes: $BACKUP_FILE"

  # Încărcare backup în Azure Blob Storage
  az storage blob upload --account-name $STORAGE_ACCOUNT --container-name $CONTAINER_NAME --file $BACKUP_FILE --name $(basename $BACKUP_FILE)

  # Verifică dacă upload-ul a fost realizat cu succes
  if [ $? -eq 0 ]; then
    echo "Backup-ul bazei de date $DB_NAME a fost încărcat cu succes în Azure Blob Storage: $(basename $BACKUP_FILE)"
  else
    echo "Eroare la încărcarea backup-ului în Azure Blob Storage" >&2
  fi
else
  echo "Eroare la crearea backup-ului pentru baza de date $DB_NAME" >&2
fi

