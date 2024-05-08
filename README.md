# ISPConfig cron cleaner - English

## Description

This script assists in automating maintenance tasks for the ISPConfig server. It clears the `sys_cron` table, which resets the ISPConfig internal cron system. Additionally, it runs the `server.sh` and `cron.sh` scripts and checks the root crontab to ensure it includes the necessary entries for minute-by-minute script execution.

## Installation

1. Download the script from the GitHub repository.
2. Make the script executable:
   `chmod +x run_ispconfig_cron_cleaner.sh`
3. `./run_ispconfig_cron_cleaner.sh`

## Features

- **Database operations**: Clears the content of the `sys_cron` table.
- **ISPConfig script execution**: Runs the `/usr/local/ispconfig/server/server.sh` and `/usr/local/ispconfig/server/cron.sh` files.
- **Crontab check**: Verifies that the root crontab contains the necessary entries.

## Security Warnings

- Ensure you have the proper permissions, especially when performing operations that require root access.
- Passwords are not displayed during terminal input for security reasons.


----------


# ISPConfig cron tisztító - Magyar

## Leírás

Ez a szkript segít automatizálni az ISPConfig szerver karbantartási feladatait. Törlésre kerül a `sys_cron` tábla, amely reseteli az ISPConfig belső cron rendszerét. Emellett futtatja a `server.sh` és `cron.sh` szkripteket, és ellenőrzi a root crontabot, hogy tartalmazza-e a szükséges bejegyzéseket a szkriptek percenkénti futtatásához.

## Telepítés

1. Töltsd le a szkriptet a GitHub repository-ból.
2. Állítsd be a szkript futtathatóságát:
   `chmod +x run_ispconfig_cron_cleaner.sh`
3. `./run_ispconfig_cron_cleaner.sh`

## Funkciók

- **Adatbázis műveletek**: Törli a `sys_cron` tábla tartalmát.
- **ISPConfig szkriptek futtatása**: A `/usr/local/ispconfig/server/server.sh` és `/usr/local/ispconfig/server/cron.sh` fájlok futtatása.
- **Crontab ellenőrzés**: Ellenőrzi, hogy a root crontab tartalmazza-e a szükséges bejegyzéseket.

## Biztonsági Figyelmeztetések

- Győződj meg róla, hogy megfelelő jogosultsággal rendelkezel, különösen amikor root hozzáférést igénylő műveleteket végzel.
- A jelszavakat a terminálban való beírás során nem jelenítjük meg biztonsági okokból.