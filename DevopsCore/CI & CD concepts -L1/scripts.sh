#!/bin/bash

echo "================================="
echo "       CI/CD PIPELINE DEMO"
echo "================================="

echo ""
echo "Step 1: Source Code"
echo "Application code received from GitHub."

echo ""
echo "Step 2: Build"
echo "Building web application..."
sleep 1
echo "Build Successful"

echo ""
echo "Step 3: Testing"
echo "Running automated tests..."
sleep 1

if [ -f "index.html" ]; then
    echo "Test Passed - index.html found"
else
    echo "Test Failed - index.html not found"
    exit 1
fi

echo ""
echo "Step 4: Package"
echo "Preparing application for deployment..."
sleep 1
echo "Packaging Successful"

echo ""
echo "Step 5: Staging"
echo "Deploying application to staging environment..."
sleep 1
echo "Staging Deployment Successful"

echo ""
echo "Step 6: Production"
echo "Application is ready for production deployment."

echo ""
echo "================================="
echo " CI/CD Pipeline Completed Successfully"
echo "================================="