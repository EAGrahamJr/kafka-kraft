#!/usr/bin/env sh
TARGET=$(hostname -I | awk '{print $1}')
export TARGET
docker compose up --detach
