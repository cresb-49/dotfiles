#!/bin/bash

# Preguntamos si el usuario desea instalar las configuraciones
echo "¿Desea instalar las configuraciones de Archcraft?"
echo "1) Si"
echo "2) No"
read -p "Opción: " opcion

# Si la opción es 1, se instalan las configuraciones
if [ $opcion -eq 1 ]; then
    #Preguntamos si la version de escritorio o de laptop
    echo "¿Qué tipo de configuraciones desea instalar?"
    echo "1) Escritorio"
    echo "2) Laptop"
    read -p "Opción: " tipo

    # Si la opcion es diferente de 1 o 2, se muestra un mensaje de error y termina el script
    if [ $tipo -gt 2 ]; then
        echo "Opción no válida"
        exit 1
    fi
    # Preguntamos si quiere instalar las configuraciones de Openbox o de BSPWM
    echo "¿Qué configuraciones desea instalar?"
    echo "1) Openbox"
    echo "2) BSPWM"
    read -p "Opción: " entorno
    if [ $entorno -eq 1 ]; then
        echo "Instalando configuraciones de Openbox..."
        if [$tipo -eq 1]; then
            
            echo "Configuraciones de Openbox instaladas correctamente"
        elif [$tipo -eq 2]; then
            
            echo "Configuraciones de Openbox instaladas correctamente"
        else
            echo "Opción no válida"
            echo "Configuraciones no instaladas"
        fi
        elif [ $entorno -eq 2 ]; then
        echo "Instalando configuraciones de BSPWM..."
        
        echo "Configuraciones de BSPWM instaladas correctamente"
    else
        echo "Opción no válida"
        echo "Configuraciones no instaladas"
    fi
else
    echo "Configuraciones no instaladas"
fi
