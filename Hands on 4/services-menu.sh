#!/bin/bash

# Función para mostrar el menú
function mostrar_menu() {
  echo "***********************************************"
  echo "*             Menú de servicios              *"
  echo "***********************************************"
  echo "1) Listar contenido de un fichero"
  echo "2) Crear un archivo de texto"
  echo "3) Comparar dos archivos de texto"
  echo "4) Mostrar uso del comando awk"
  echo "5) Mostrar uso del comando grep"
  echo "0) Salir"
  echo "***********************************************"
  echo -n "Seleccione una opción: "
}

# Función para listar el contenido de un fichero
function listar_fichero() {
  read -p "Introduzca la ruta absoluta del fichero: " ruta
  ruta=$(eval echo "$ruta")
  ls "$ruta"
}

# Función para crear un archivo de texto
function crear_archivo_texto() {
  echo -n "Introduzca la cadena de texto a almacenar: "
  read cadena_texto
  echo -n "Introduzca el nombre del archivo a crear: "
  read nombre_archivo
  echo "$cadena_texto" > "$nombre_archivo"
  echo "Archivo $nombre_archivo creado con éxito."
}

# Función para comparar dos archivos de texto
function comparar_archivos() {
  echo -n "Introduzca la ruta del primer archivo: "
  read archivo1
  echo -n "Introduzca la ruta del segundo archivo: "
  read archivo2
  if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
    diff "$archivo1" "$archivo2"
  else
    echo "Uno o ambos archivos no existen."
  fi
}

# Función para mostrar el uso del comando awk
function mostrar_uso_awk() {
  echo "Herramienta usada para manipular datos y generar reportes."
  echo "En este caso muestra las líneas donde aparece manager"
  echo "en el archivo employee.txt" 
  awk '/manager/ {print}' employee.txt 
}

# Función para mostrar el uso del comando grep
function mostrar_uso_grep() {
  echo "Herramienta usada para buscar y manipular patrones de texto dentro 						 de archivos."
  echo "En este caso cuenta cuántas veces esta la palabra manager"
  echo "en el documento employee.txt:"
  grep -c "manager" employee.txt
}

# Bucle principal del script
while true; do
  mostrar_menu
  read opcion
  case $opcion in
    1) listar_fichero ;;
    2) crear_archivo_texto ;;
    3) comparar_archivos ;;
    4) mostrar_uso_awk ;;
    5) mostrar_uso_grep ;;
    0) break ;;
    *) echo "Opción no válida." ;;
  esac
done

echo "Saliendo del script..."
