@echo off
IF "%1"=="mysql" (
    copy /Y .env.mysql.example .env
    echo Using MySQL environment...
    php artisan serve
) ELSE IF "%1"=="pgsql" (
    copy /Y .env.pgsql.example .env
    echo Using PostgreSQL environment...
    php artisan serve
) ELSE (
    echo Usage: run_server [mysql|pgsql]
)