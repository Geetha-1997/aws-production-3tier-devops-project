@echo off

echo ==========================================
echo Deploying Application to Kubernetes
echo ==========================================

helm upgrade --install production-app .\helm\production-app ^
-n production ^
--create-namespace

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Helm deployment failed!
    exit /b 1
)

echo.
echo Deployment Successful
echo.

kubectl get pods -n production

kubectl get svc -n production
