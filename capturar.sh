#!/usr/bin/env bash
# Genera dos capturas por estilo, clara y oscura, con el mismo contenido de ejemplo.
#
#   ./capturar.sh                  usa chromium-browser
#   NAV=chromium ./capturar.sh     otro binario
#
set -euo pipefail

NAV="${NAV:-chromium-browser}"
ANCHO="${ANCHO:-1400}"
ALTO="${ALTO:-940}"
ESCALA="${ESCALA:-2}"
DESTINO="capturas"

command -v "$NAV" >/dev/null || {
  echo "No encuentro '$NAV'. Prueba con: NAV=chromium $0" >&2
  exit 1
}
[ -f index.html ] || { echo "Ejecutalo desde la raiz del repositorio." >&2; exit 1; }

mkdir -p "$DESTINO"

# estilo : fichero : tono caracteristico
#   el tono se mantiene en ambos modos para que la pareja sea comparable
for spec in \
  "material:vivo:172" \
  "clasico:clasico:210" \
  "cristal:cristal:300" \
  "minimo:minimo:172" \
  "fluent:fluent:258" \
  "breeze:breeze:236"
do
  IFS=: read -r estilo fichero tono <<< "$spec"
  for modo in light dark; do
    salida="$DESTINO/${fichero}-${modo}.png"
    echo "-> ${fichero}-${modo}.png  (tono ${tono})"
    "$NAV" \
      --headless=new \
      --hide-scrollbars \
      --force-device-scale-factor="$ESCALA" \
      --virtual-time-budget=2500 \
      --window-size="${ANCHO},${ALTO}" \
      --screenshot="$salida" \
      "file://$PWD/index.html?demo=1&style=${estilo}&mode=${modo}&hue=${tono}" 2>/dev/null
  done
done

# nombres antiguos: un solo modo por estilo, y el nordico retirado en la 1.9
rm -f "$DESTINO"/{vivo,clasico,cristal,minimo,fluent,breeze,nordico}.png

if command -v oxipng >/dev/null; then
  oxipng -o 3 -q "$DESTINO"/*.png && echo "Optimizadas con oxipng"
elif command -v optipng >/dev/null; then
  optipng -quiet -o3 "$DESTINO"/*.png && echo "Optimizadas con optipng"
fi

echo
ls -lh "$DESTINO"
echo
echo -n "Ficheros generados (deben ser 12): "
ls -1 "$DESTINO"/*.png | wc -l
echo -n "Imagenes unicas (deben ser 12):   "
md5sum "$DESTINO"/*.png | awk '{print $1}' | sort -u | wc -l
