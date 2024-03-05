echo "Introduce el nombre de la máquina virtual: "
read NOMBRE_MV

echo "Introduce el sistema operativo: "
read SISTEMA_OPERATIVO

echo "Introduce el número de CPUs: "
read NUM_CPUS

echo "Introduce el tamaño de Memoria ram en GB: "
read TAM_MEMORIA

echo "Introduce el tamaño de Memoria vram (MB): "
read TAM_VRAM

echo "Introduce el tamaño del disco duro virtual en GB: "
read TAM_HDD

echo "Introduce un controlador SATA: "
read NOMBRE_CONTROLADOR_SATA

echo "Introduce un controlador IDE: "
read NOMBRE_CONTROLADOR_IDE

# Crear la máquina virtual
if ! VBoxManage createvm --name "$NOMBRE_MV" --ostype "$SISTEMA_OPERATIVO" --register; then
  echo "Error al crear la máquina virtual."
  exit 1
fi

# Configurar CPUs y memoria
VBoxManage modifyvm "$NOMBRE_MV" --cpus "$NUM_CPUS" --memory "$(($TAM_MEMORIA * 1024))" --vram "$TAM_VRAM"

# Crear disco duro virtual
VBoxManage createhd --filename "/home/kali/VirtualBox VMs/$NOMBRE_MV/$NOMBRE_MV.vdi" --size "$((TAM_HDD * 1024))" --variant Standard

# Agregar el controlador a la máquina virtual
VBoxManage storagectl "$NOMBRE_MV" --name "$NOMBRE_CONTROLADOR_SATA" --add sata --bootable on
VBoxManage storageattach "$NOMBRE_MV" --storagectl "$NOMBRE_CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "/home/kali/VirtualBox VMs/$NOMBRE_MV/$NOMBRE_MV.vdi"

# Agregar controlador IDE
VBoxManage storagectl "$NOMBRE_MV" --name "$NOMBRE_CONTROLADOR_IDE"  --add ide

# Configurar unidad óptica virtual
VBoxManage storageattach $NOMBRE_MV --storagectl "$NOMBRE_CONTROLADOR_IDE" --port 0 --device 0 --type dvddrive --medium emptydrive

# Mostrar información de la configuración
echo "**Configuración MV"
VBoxManage showvminfo "$NOMBRE_MV"
