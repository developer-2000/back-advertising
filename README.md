# Проект Back-Advertising

## Инструкция по установке и запуску

### Клонирование репозитория и установка зависимостей

- Для начала, клонируйте репозиторий проекта:

```sh
git clone https://github.com/involveno/shell2-backend.git
```
- Запустить Docker на компьютере
- Из папки shell2-backend запустите сборку контейнера Docker с помощью команды:
```sh
docker-compose up --build -d
```
- Проверьте статус контейнеров:
```sh
docker-compose ps
```
- Перейти во-внутрь контейнера для команд:
```sh
docker-compose exec php bash
```
- Генерация ключа приложения Laravel:
```sh
php artisan key:generate
```
- Установка зависимостей Composer:
```sh
composer install
```
- Установка зависимостей npm:
```sh
npm install
```
- Запуск миграций базы данных:
```sh
php artisan migrate
```
## Ссылки:
### Настройки базы данных
 - Имя базы данных: db_docker
 - Логин: user
 - Пароль: user
- Домен страницы Laravel: http://localhost/
- Домен страницы PhpMyAdmin: http://localhost:8080/

## Инструкции к Docker:
- Перезапуск контейнеров без потери данных:
```sh
docker-compose restart
```
- Перезапуск конкретного контейнера:
```sh
docker-compose restart имя_контейнера
```
- Пересборка образов и перезапуск контейнеров - Если вы внесли изменения в Dockerfile, вам нужно пересобрать образы:
- Полное удаление и пересоздание контейнеров с сохранением данных:
```sh
docker-compose down
docker-compose up --build -d
```
- Полное удаление и пересоздание контейнеров с удалением данных:
```sh
docker-compose down -v 
docker-compose up --build -d
```
- Пересборка контейнеров без потери данных:
```sh
docker-compose up --build -d
```
- Пересборка конкретного образа и перезапуск контейнера
```sh
docker-compose up --build -d имя_контейнера
```

