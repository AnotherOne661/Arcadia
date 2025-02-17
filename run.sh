#!/bin/bash

# Set variables
PHP_BINARY='php'
SERVER_PATH='public'

# Run PHP server
echo "Starting PHP server..."
$PHP_BINARY -t $SERVER_PATH -S localhost:8000 &
