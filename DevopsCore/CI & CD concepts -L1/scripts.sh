#!/bin/bash

echo "CI/CD Pipeline Demo"

echo "Step 1: Source Code"
echo "Code received from GitHub"

echo "Step 2: Build"
echo "Build Successful"

echo "Step 3: Test"

if [ -f "index.html" ]; then
    echo "Test Passed"
else
    echo "Test Failed"
    exit 1
fi

echo "Step 4: Deploy"
echo "Application deployed successfully"

echo "CI/CD Pipeline Completed"