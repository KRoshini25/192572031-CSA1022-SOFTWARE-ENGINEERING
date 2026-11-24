#!/bin/sh
set -e
docker build -t notes-app .
docker run -d --name notes-container -p 3000:3000 notes-app
echo "Open http://localhost:3000"
