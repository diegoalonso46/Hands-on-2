#!/bin/bash

# Crear un archivo de texto plano llamado mytext
echo "Hola Mundo" > mytext.txt

# Desplegar/Imprimir en la terminal el contenido del archivo mytext
cat mytext.txt

# Crear una carpeta (folder) llamado backup
mkdir backup

# Mover el archivo mytext al fichero backup
mv mytext.txt backup

# Listar el contenido del fichero backup
ls -1 backup

# Eliminar el archivo mytext del fichero backup
rm backup/mytext.txt

# Eliminar el fichero backup
rmdir backup

echo "Proceso completado."
