#!/bin/bash


if [ ! -d "vendor" ]; then
    echo "Instalando dependências do Composer..."
    composer install --no-interaction --optimize-autoloader
fi

echo "Gerando chave da aplicação..."
php artisan key:generate --force

echo "Executando migrações..."
php artisan migrate --force

echo "Limpando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

echo "Iniciando servidor Laravel..."
php artisan serve --host=0.0.0.0 --port=8000