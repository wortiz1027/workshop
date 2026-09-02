#!/bin/bash

# -------------------------------------------------------------------------
# 🚀 SCRIPT AUTOMATIZADO DE RENDIMIENTO - COMPATIBLE CON BASH & ZSH
# - AUTOR: @DevSoft Team
# - DESCRIPCION: Proporciona un menu interactivo multiplataforma administrando
# -              entornos y reportes en k6 para la suite de microservicios.
# -------------------------------------------------------------------------

# Configuración de colores para una terminal atractiva y visual
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0;m' # Sin Color

clear
echo -e "${CYAN}===================================================================${NC}"
echo -e "${CYAN}⚡        SUITE DE PRUEBAS DE RENDIMIENTO Y ESTRÉS (k6)            ⚡${NC}"
echo -e "${CYAN}===================================================================${NC}"
echo -e "Selecciona el escenario de prueba que deseas ejecutar:\n"

# Definimos las opciones lógicas del menú (Sintaxis universal compatible)
options=(
    "Productos: Carga Progresiva Moderada (application-load)"
    "Productos: Estrés Exhaustivo al Límite (application-stress)"
    "Usuarios:  Carga Progresiva Moderada (users-load)"
    "Usuarios:  Estrés Exhaustivo al Límite (users-stress)"
    "Salir de la Suite"
)

# Renderizado del menú interactivo nativo
PS3=$'\n👉 Por favor, digita el número de tu opción: '
select opt in "${options[@]}"
do
    case $opt in
        "Productos: Carga Progresiva Moderada (application-load)")
            SCRIPT_PATH="src/rest/products/scenarios/products-load.test.js"
            REPORT_NAME="products-load-report"
            break
            ;;
        "Productos: Estrés Exhaustivo al Límite (application-stress)")
            SCRIPT_PATH="src/rest/products/scenarios/products-stress.test.js"
            REPORT_NAME="products-stress-report"
            break
            ;;
        "Usuarios:  Carga Progresiva Moderada (users-load)")
            SCRIPT_PATH="src/rest/users/scenarios/users-load.test.js"
            REPORT_NAME="users-load-report"
            break
            ;;
        "Usuarios:  Estrés Exhaustivo al Límite (users-stress)")
            SCRIPT_PATH="src/rest/users/scenarios/users-stress.test.js"
            REPORT_NAME="users-stress-report"
            break
            ;;            
        "Salir de la Suite")
            echo -e "\n${YELLOW}Operación cancelada por el instructor. ¡Hasta luego!${NC}\n"
            exit 0
            ;;
        *) 
            # REPLY funciona de forma idéntica en Bash y Zsh para almacenar la entrada cruda del select
            echo -e "${RED}Opción inválida [${REPLY}]. Intenta de nuevo.${NC}"
            ;;
    esac
done

echo -e "\n-------------------------------------------------------------------"
echo -e "💡 El entorno de producción ${GREEN}'prod'${NC} (Docker Compose) está seleccionado por defecto."
echo -e "📊 ¿Deseas activar y exportar el Reporte Gráfico Web Dashboard? (y/n): "

# DETECCIÓN DE COMPATIBILIDAD DE SHELL:
# Zsh define la variable $ZSH_VERSION, si está vacía asumimos que estamos en Bash.
if [ -n "$ZSH_VERSION" ]; then
    read -k 1 USER_REPLY # Sintaxis nativa para Zsh (captura 1 tecla)
else
    read -n 1 USER_REPLY # Sintaxis nativa para Bash (captura 1 tecla)
fi
echo "" # Salto de línea estético requerido tras la captura de teclado

# Estructurar la ejecución del comando base de k6 según la decisión del usuario
if [[ "$USER_REPLY" =~ ^[Yy]$ ]]
then
    echo -e "\n🚀 ${GREEN}Iniciando k6 con Web Dashboard activado...${NC}"
    echo -e "📁 El reporte HTML se guardará en: ${YELLOW}reports/${REPORT_NAME}.html${NC}\n"
    
    K6_WEB_DASHBOARD=true \
    K6_WEB_DASHBOARD_EXPORT="reports/${REPORT_NAME}.html" \
    k6 run "$SCRIPT_PATH" -e TEST_ENV=prod
else
    echo -e "\n🚀 ${GREEN}Iniciando k6 en modo consola puro...${NC}\n"
    k6 run "$SCRIPT_PATH" -e TEST_ENV=prod
fi

echo -e "\n${CYAN}===================================================================${NC}"
echo -e "${GREEN}✓ Prueba finalizada de forma exitosa.${NC}"
echo -e "${CYAN}===================================================================${NC}\n"
