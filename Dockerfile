# Используем официальный образ PHP 8.2 FPM
FROM php:8.2-fpm

# Аргументы, заданные в docker-compose.yml
ARG user
ARG uid

# Установка необходимых пакетов и зависимостей
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip \
    zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Установка расширений PHP
RUN docker-php-ext-install pdo_mysql

# Создание группы www и пользователя www
#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/bash -g www www

# Изменение членства пользователя www в группах www-data и root
RUN usermod -aG www-data,root www

# Установка рабочей директории
WORKDIR /var/www/html

# Копирование файлов вашего приложения Laravel
COPY . /var/www/html

# Опционально: установка дополнительного конфигурационного файла PHP
COPY php/local.ini /usr/local/etc/php/conf.d/local.ini

# Опционально: установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Другие инструкции по настройке и сборке вашего контейнера

# Запуск PHP-FPM при старте контейнера
CMD ["php-fpm"]

# Экспозиция порта PHP-FPM
EXPOSE 9000
