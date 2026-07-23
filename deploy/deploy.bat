@echo off

echo =====================================
echo Pulling Latest Docker Images
echo =====================================

docker compose pull

echo.

echo =====================================
echo Stopping Old Containers
echo =====================================

docker compose down

echo.

echo =====================================
echo Starting New Containers
echo =====================================

docker compose up -d

echo.

echo =====================================
echo Deployment Completed
echo =====================================

docker ps