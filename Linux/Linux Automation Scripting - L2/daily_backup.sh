#!/bin/bash

SOURCE_DIR="/home/ec2-user/app_data"
DEST_DIR="/home/ec2-user/backups"

DATE=$(date +"%Y-%m-%d")

BACKUP_FILENAME="backup_${DATE}.tar.gz"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

tar -czf "$DEST_DIR/$BACKUP_FILENAME" \
    -C "$(dirname "$SOURCE_DIR")" \
    "$(basename "$SOURCE_DIR")"

echo "Backup completed successfully!"
echo "Backup file: $DEST_DIR/$BACKUP_FILENAME"