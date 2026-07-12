#!/usr/bin/env bash
set -e

if [ ! -d "backend" ]; then
  echo "backend directory not found"
  exit 1
fi

if [ ! -d "frontend" ]; then
  echo "frontend directory not found"
  exit 1
fi

echo "Starting DevOpsHub services..."
echo "Backend: http://localhost:8080"
echo "Frontend: http://localhost:3000"
