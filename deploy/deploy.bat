@echo off

echo =====================================
echo Pull Latest Docker Images
echo =====================================

docker compose pull

echo =====================================
echo Stop Existing Containers
echo =====================================

docker compose down

docker rm -f production-app 2>nul
docker rm -f nginx 2>nul

echo =====================================
echo Start New Containers
echo =====================================

docker compose up -d

echo =====================================
echo Deployment Completed
echo =====================================

docker ps