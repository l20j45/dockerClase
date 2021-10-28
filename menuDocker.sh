#!/bin/bash
 
# Codigo que muestra como gestionar un menu desde consola

function pause(){
   read -p "$*"
}

_menu()
{
    echo "Selecciona una opcion:"
    echo
    echo "1) Crear contenedores"
    echo "2) Parar contenedores"
    echo "3) Iniciar contenedores"
    echo "4) listar contenedores"
    echo
    echo "9) Salir"
    echo
    echo -n "Indica una opcion: "
}
 
# Muestra la opcion seleccionada del menu
_mostrarResultado()
{
    clear
    echo ""
    echo "------------------------------------"
    echo "Has seleccionado la opcion $1"
    echo "------------------------------------"
    echo ""
}
 
# opcion por defecto
opc="0"
 
# bucle mientas la opcion indicada sea diferente de 9 (salir)
until [ "$opc" -eq "9" ];
do
    case $opc in
        1)
            _mostrarResultado $opc
			echo "1) Crear contenedores "
			bash creacionDocker.sh
			pause 'Press [Enter] key to continue...'
            _menu
            ;;
        2)
            _mostrarResultado $opc
			echo "2) Parar contenedores"
			bash detenerDocker.sh
			pause 'Press [Enter] key to continue...'
            _menu
            ;;
        3)
            _mostrarResultado $opc
			echo "3) Iniciar contenedores"
			bash iniciarDocker.sh
			pause 'Press [Enter] key to continue...'
            _menu
            ;;
        4)
            _mostrarResultado $opc
			echo "4) listar contenedores"
            sudo docker ps -a
			pause 'Press [Enter] key to continue...'
            _menu
            ;;
        5)
            _mostrarResultado $opc
			pause 'Press [Enter] key to continue...'
            _menu
            ;;
        *)
            # Esta opcion se ejecuta si no es ninguna de las anteriores
            clear
            _menu
            ;;
    esac
    read opc
done
