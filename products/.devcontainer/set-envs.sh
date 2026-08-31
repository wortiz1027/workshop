#!/bin/zsh

# Buscar el archivo .env de forma dinámica
ENV_PATH="/workspaces/microservice/.devcontainer/.env"
[ ! -f "$ENV_PATH" ] && ENV_PATH="/workspaces/microservice/.env"

if [ -f "$ENV_PATH" ]; then
    echo "⚙️ Exportando variables desde $ENV_PATH..."
    # Filtra comentarios, líneas vacías y exporta directamente en Zsh/Bash
    export $(grep -v '^#' "$ENV_PATH" | xargs)
    
else
    echo "⚠️ Archivo .env no encontrado."
fi
