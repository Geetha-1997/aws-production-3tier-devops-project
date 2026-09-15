@echo off

echo ==========================================
echo Deploying Application to Kubernetes
echo ==========================================

set IMAGE_TAG=%1

if "%IMAGE_TAG%"=="" (
    set IMAGE_TAG=latest
)

echo Image tag: %IMAGE_TAG%
echo.

helm upgrade --install production-app .\helm\production-app ^
-n production ^
--create-namespace ^
--set image.tag=%IMAGE_TAG%

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Helm deployment failed!
    exit /b 1
)

echo.
echo Helm deployment successful
echo.

echo Waiting for deployment rollout...
kubectl rollout status deployment/production-app -n production --timeout=180s

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Kubernetes rollout failed!
    exit /b 1
)

echo.
echo ==========================================
echo Deployment Successful
echo ==========================================
echo.

kubectl get pods -n production
kubectl get svc -n production
