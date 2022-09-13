#!/bin/bash

# Definimos la funcion de alta de usuarios para posteriormente llamarla desde un case



### MAIN ###

# Comprobamos que el script se ejeuta con usuario root

if [ `whoami` != "root" ]
then
echo
echo "El alta de usuarios en el sistema precisa privilegios de superusuario (root)"
echo
exit 1
fi

# Construimos el menu dentro de un bucle de forma que lo repinte cuando sea necesario






while IFS= read -r line
do
    echo
    echo "---------------------"
    echo "Dando de alta alumnos"
    echo

    # Vamos a currarnos un case lo mas limpito posible

    echo
    USER="$line"
    EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${USER}`

    if [ ${#EXISTE} -ne 0 ]
    then
    echo "Ese usuario ya existe en el sistema. Pulse intro para continuar..."; 
    fi

    GROUP="alumnos"
    EXISTE=`cat /etc/group | awk -F':' '{print $1}' | egrep -x ${GROUP}`

    if [ ${#EXISTE} -eq 0 ]
    then
    echo "Ese grupo no existe en el sistema. Pulse intro para continuar..."; 
    fi

    GUID=`cat /etc/group | egrep ${GROUP} | awk -F':' '{print $3}' | head -1`

    useradd -m -g ${GUID} -d /home/${USER} -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "password")' 'alumno1')  ${USER} 

    EXISTE=`cat /etc/passwd | awk -F':' '{print $1}' | egrep -x ${USER}`

    if [ ${#EXISTE} -ne 0 ]
    then
    echo "Usuario dado de alta correctamente en el sistema. Pulse intro para continuar..."; 
    else
    echo "Se ha producido un error al dar de alta el usuario. Pulse intro para continuar..."; 
    fi

done < nombres.dat

exit 0
