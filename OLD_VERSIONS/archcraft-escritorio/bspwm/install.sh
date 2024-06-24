#!/bin/sh
echo "Instalacion cresb escritorio"
echo "Copia del archivo 'bspwmrc'"
cp bspwmrc ~/.config/bspwm/
echo "Copia del archivo 'sxhkdrc'"
cp sxhkdrc ~/.config/bspwm/
echo "Copiando el tema cresb"
cp -r themes/cresb ~/.config/bspwm/themes/
echo "Instalacion Finalizada!!!"