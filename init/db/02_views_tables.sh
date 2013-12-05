DB_NAME="rosebud2"

sudo -u postgres psql -d $DB_NAME -f helper_views.sql
sudo -u postgres psql -d $DB_NAME -f verification_tables.sql

