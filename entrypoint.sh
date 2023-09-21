#!/bin/bash

# Menentukan nilai variabel lingkungan berdasarkan argumen perintah
export APP_NAME="$1"
export APP_ENV="$2"
export APP_KEY="$3"
export APP_DEBUG="$4"
export APP_URL="$5"
export LOG_CHANNEL="$6"
export LOG_LEVEL="$7"
export DB_CONNECTION="$8"
export DB_HOST="$9"
export DB_PORT="${10}"
export DB_DATABASE="${11}"
export DB_USERNAME="${12}"
export DB_PASSWORD="${13}"
export BROADCAST_DRIVER="${14}"
export CACHE_DRIVER="${15}"
export FILESYSTEM_DRIVER="${16}"
export QUEUE_CONNECTION="${17}"
export SESSION_DRIVER="${18}"
export SESSION_LIFETIME="${19}"
export MEMCACHED_HOST="${20}"
export REDIS_HOST="${21}"
export REDIS_PASSWORD="${22}"
export REDIS_PORT="${23}"
export MAIL_MAILER="${24}"
export MAIL_HOST="${25}"
export MAIL_PORT="${26}"
export MAIL_USERNAME="${27}"
export MAIL_PASSWORD="${28}"
export MAIL_ENCRYPTION="${29}"
export MAIL_FROM_ADDRESS="${30}"
export MAIL_FROM_NAME="${31}"
export AWS_ACCESS_KEY_ID="${32}"
export AWS_SECRET_ACCESS_KEY="${33}"
export AWS_DEFAULT_REGION="${34}"
export AWS_BUCKET="${35}"
export AWS_USE_PATH_STYLE_ENDPOINT="${36}"
export PUSHER_APP_ID="${37}"
export PUSHER_APP_KEY="${38}"
export PUSHER_APP_SECRET="${39}"
export PUSHER_APP_CLUSTER="${40}"
export MIX_PUSHER_APP_KEY="${41}"
export MIX_PUSHER_APP_CLUSTER="${42}"
export SERVICE_USER_URL="${43}"
export SERVICE_ORDER_PAYMENT_URL="${44}"

# Mengganti variabel-placeholder dengan nilai yang sesuai dalam file .env
sed -i "s/{{APP_NAME}}/$APP_NAME/g" /app/.env
sed -i "s/{{APP_ENV}}/$APP_ENV/g" /app/.env
sed -i "s/{{APP_KEY}}/$APP_KEY/g" /app/.env
sed -i "s/{{APP_DEBUG}}/$APP_DEBUG/g" /app/.env
sed -i "s/{{APP_URL}}/$APP_URL/g" /app/.env
sed -i "s/{{LOG_CHANNEL}}/$LOG_CHANNEL/g" /app/.env
sed -i "s/{{LOG_LEVEL}}/$LOG_LEVEL/g" /app/.env
sed -i "s/{{DB_CONNECTION}}/$DB_CONNECTION/g" /app/.env
sed -i "s/{{DB_HOST}}/$DB_HOST/g" /app/.env
sed -i "s/{{DB_PORT}}/$DB_PORT/g" /app/.env
sed -i "s/{{DB_DATABASE}}/$DB_DATABASE/g" /app/.env
sed -i "s/{{DB_USERNAME}}/$DB_USERNAME/g" /app/.env
sed -i "s/{{DB_PASSWORD}}/$DB_PASSWORD/g" /app/.env
sed -i "s/{{BROADCAST_DRIVER}}/$BROADCAST_DRIVER/g" /app/.env
sed -i "s/{{CACHE_DRIVER}}/$CACHE_DRIVER/g" /app/.env
sed -i "s/{{FILESYSTEM_DRIVER}}/$FILESYSTEM_DRIVER/g" /app/.env
sed -i "s/{{QUEUE_CONNECTION}}/$QUEUE_CONNECTION/g" /app/.env
sed -i "s/{{SESSION_DRIVER}}/$SESSION_DRIVER/g" /app/.env
sed -i "s/{{SESSION_LIFETIME}}/$SESSION_LIFETIME/g" /app/.env
sed -i "s/{{MEMCACHED_HOST}}/$MEMCACHED_HOST/g" /app/.env
sed -i "s/{{REDIS_HOST}}/$REDIS_HOST/g" /app/.env
sed -i "s/{{REDIS_PASSWORD}}/$REDIS_PASSWORD/g" /app/.env
sed -i "s/{{REDIS_PORT}}/$REDIS_PORT/g" /app/.env
sed -i "s/{{MAIL_MAILER}}/$MAIL_MAILER/g" /app/.env
sed -i "s/{{MAIL_HOST}}/$MAIL_HOST/g" /app/.env
sed -i "s/{{MAIL_PORT}}/$MAIL_PORT/g" /app/.env
sed -i "s/{{MAIL_USERNAME}}/$MAIL_USERNAME/g" /app/.env
sed -i "s/{{MAIL_PASSWORD}}/$MAIL_PASSWORD/g" /app/.env
sed -i "s/{{MAIL_ENCRYPTION}}/$MAIL_ENCRYPTION/g" /app/.env
sed -i "s/{{MAIL_FROM_ADDRESS}}/$MAIL_FROM_ADDRESS/g" /app/.env
sed -i "s/{{MAIL_FROM_NAME}}/$MAIL_FROM_NAME/g" /app/.env
sed -i "s/{{AWS_ACCESS_KEY_ID}}/$AWS_ACCESS_KEY_ID/g" /app/.env
sed -i "s/{{AWS_SECRET_ACCESS_KEY}}/$AWS_SECRET_ACCESS_KEY/g" /app/.env
sed -i "s/{{AWS_DEFAULT_REGION}}/$AWS_DEFAULT_REGION/g" /app/.env
sed -i "s/{{AWS_BUCKET}}/$AWS_BUCKET/g" /app/.env
sed -i "s/{{AWS_USE_PATH_STYLE_ENDPOINT}}/$AWS_USE_PATH_STYLE_ENDPOINT/g" /app/.env
sed -i "s/{{PUSHER_APP_ID}}/$PUSHER_APP_ID/g" /app/.env
sed -i "s/{{PUSHER_APP_KEY}}/$PUSHER_APP_KEY/g" /app/.env
sed -i "s/{{PUSHER_APP_SECRET}}/$PUSHER_APP_SECRET/g" /app/.env
sed -i "s/{{PUSHER_APP_CLUSTER}}/$PUSHER_APP_CLUSTER/g" /app/.env
sed -i "s/{{MIX_PUSHER_APP_KEY}}/$MIX_PUSHER_APP_KEY/g" /app/.env
sed -i "s/{{MIX_PUSHER_APP_CLUSTER}}/$MIX_PUSHER_APP_CLUSTER/g" /app/.env
sed -i "s/{{SERVICE_USER_URL}}/$SERVICE_USER_URL/g" /app/.env
sed -i "s/{{SERVICE_ORDER_PAYMENT_URL}}/$SERVICE_ORDER_PAYMENT_URL/g" /app/.env

# Jalankan aplikasi Laravel
exec "$@"
