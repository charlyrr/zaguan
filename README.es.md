<div align="center">

# Zaguán

**Tu página de inicio, en un solo fichero.**

Una página de nueva pestaña para navegadores basados en Chromium: buscador, carpetas de
favoritos al estilo del lanzador de Android y seis estilos visuales. Un único HTML, sin
dependencias, sin compilación y sin una sola petición a servidores de terceros.

[![Licencia: MIT](https://img.shields.io/badge/Licencia-MIT-8A9A5B.svg?style=flat-square)](LICENSE)
![Fichero único](https://img.shields.io/badge/fichero%20único-113%20KB-4FB6C4?style=flat-square)
![Sin dependencias](https://img.shields.io/badge/dependencias-0-E8A33D?style=flat-square)
![Idiomas](https://img.shields.io/badge/idiomas-8-9B7EDE?style=flat-square)

[English](README.md) · **Español**

[**Ver la demo →**](https://charlyrr.github.io/zaguan/?demo=1&lang=es)

</div>

<br>

<div align="center">
  <img src="capturas/vivo.png" alt="Zaguán, estilo Vivo" width="820">
</div>

<br>

---

## Estilos

Seis acabados, cada uno con su variante clara y oscura.

|  |  |
|:---:|:---:|
| <img src="capturas/vivo.png" width="400"><br>**Vivo** — Material You | <img src="capturas/clasico.png" width="400"><br>**Clásico** — Mac OS X de la vieja escuela |
| <img src="capturas/cristal.png" width="400"><br>**Cristal** — vidrio profundo | <img src="capturas/minimo.png" width="400"><br>**Mínimo** — monocromo, a un filete |
| <img src="capturas/nordico.png" width="400"><br>**Nórdico** — lino y madera | <img src="capturas/breeze.png" width="400"><br>**Breeze** — KDE Plasma |

<table>
<tr><th align="left">Estilo</th><th align="left">Idea</th><th align="left">Rasgos</th></tr>
<tr><td><b>Vivo</b></td><td>Material You</td><td>Manchas de color saturadas, formas blandas, radios de 24 px</td></tr>
<tr><td><b>Clásico</b></td><td>Mac OS X de la vieja escuela</td><td>Grises azulados, biseles, iconos con brillo Aqua, buscador hundido</td></tr>
<tr><td><b>Cristal</b></td><td>Vidrio profundo</td><td>Superficies al 10 %, desenfoque de 58 px, destello diagonal y cantos con dispersión cromática</td></tr>
<tr><td><b>Mínimo</b></td><td>Monocromo</td><td>Iconos de contorno, cero sombras, buscador reducido a una línea</td></tr>
<tr><td><b>Nórdico</b></td><td>Lino y madera</td><td>Base cálida, veta sutil, iconos en pastel apagado</td></tr>
<tr><td><b>Breeze</b></td><td>KDE Plasma</td><td>Superficies planas, marcos de 1 px, paleta oficial de Breeze, selección en azul Plasma</td></tr>
</table>

El color de acento se genera a partir de un único tono semilla que eliges tú, así que todos
los estilos mantienen la legibilidad sea cual sea el color. Breeze luce de fábrica con el
tono **236**, que corresponde al azul Plasma.

---

## Qué hace

**Buscador**
DuckDuckGo, Brave, Startpage, Wikipedia, Google o tu propia plantilla, útil si te
autoalojas un SearXNG. Si escribes `proxmox.local:8006` o `localhost:8080`, navega en
lugar de buscar.

**Filtrado de favoritos en vivo**
Al teclear aparecen los enlaces que coinciden, con la carpeta a la que pertenecen. Flechas
para elegir, Enter para abrir.

**Carpetas tipo lanzador**
Icono compacto con vista previa 2×2 que se expande en un panel mediante *container
transform*: la animación nace del icono que has pulsado.

**Accesos sueltos**
Favoritos individuales conviviendo con las carpetas en la misma rejilla.

**Arrastrar y soltar**
Para reordenar, meter enlaces en carpetas o sacarlos al escritorio. Construido sobre
eventos de puntero, así que también funciona con el dedo en pantallas táctiles.

**Copias de seguridad**
Historial dentro del navegador con copia automática diaria, más exportación e importación
en JSON.

**Favicon propio**
Generado al vuelo y recoloreado con el tono que elijas.

---

## Idiomas

La interfaz sigue automáticamente el idioma del navegador:

Español · English · Français · Deutsch · Italiano · Português · Русский · 中文

Cualquier otro cae a inglés. Puedes fijar uno en *Ajustes → Idioma*, o con `?lang=fr`.

<details>
<summary><b>Añadir un idioma</b></summary>

<br>

Las traducciones están en el objeto `I18N`, al principio del `<script>`. Copia el bloque
`en`, traduce los valores y usa el código ISO como clave:

```js
"nl": {
  _name: "Nederlands",   // como aparece en el selector
  _locale: "nl",         // para fechas y horas
  appTitle: "Start",
  searchPlaceholder: "Zoeken, een adres invoeren of bladwijzers filteren",
  ...
}
```

Son 74 claves. Deja las variables entre llaves (`{name}`, `{n}`, `{folders}`, `{links}`,
`{date}`) tal cual, se sustituyen en tiempo de ejecución. Las contribuciones de traducción
son muy bienvenidas.

</details>

---

## Atajos

| Tecla | Acción |
|---|---|
| `/` o cualquier letra | Enfocar el buscador |
| `↑` `↓` | Moverse por los favoritos filtrados |
| `Enter` | Abrir o buscar |
| `Ctrl` + `Enter` | Abrir en pestaña nueva |
| `E` | Modo edición |
| `Esc` | Cerrar carpeta o limpiar el buscador |

---

## Instalación

### Desde la web

Abre la [demo publicada](https://charlyrr.github.io/zaguan/) y úsala tal cual, o clona el
repositorio y publícala en tus propias GitHub Pages. Servirla por HTTPS garantiza que el
almacenamiento del navegador funcione sin sorpresas.

### Como fichero local

```bash
mkdir -p ~/.local/share/zaguan
curl -o ~/.local/share/zaguan/index.html \
  https://raw.githubusercontent.com/charlyrr/zaguan/main/index.html
```

Chromium trata cada fichero local como origen opaco y en algunos casos bloquea el
almacenamiento. La página lo detecta y avisa. Si ocurre, sírvela en local:

```bash
cd ~/.local/share/zaguan && python3 -m http.server 8088 --bind 127.0.0.1
```

<details>
<summary><b>Ponerla como página de nueva pestaña</b></summary>

<br>

**Helium** — abre `helium://flags/#custom-ntp`, ponlo en *Enabled* y escribe la URL de tu
página. Reinicia. Después, en `helium://settings/onStartup`, marca *Abrir la página de
nueva pestaña*.

**Chrome, Brave, Edge y otros Chromium sin ese flag** — no permiten cambiar la nueva
pestaña sin extensión. Puedes ponerla como página de inicio en Ajustes → Al abrir el
navegador, o usar cualquier extensión de tipo *custom new tab*.

**Firefox** — sirve como página de inicio, pero la nueva pestaña requiere extensión.

</details>

---

## Parámetros de URL

Útiles para enlazar una configuración concreta o automatizar capturas:

| Parámetro | Valores | Efecto |
|---|---|---|
| `demo` | `1` | Carga favoritos de ejemplo y **no escribe nada** en el navegador |
| `style` | `material`, `clasico`, `cristal`, `minimo`, `nordico`, `breeze` | Fuerza el estilo |
| `mode` | `auto`, `light`, `dark` | Fuerza claro u oscuro |
| `lang` | `en`, `es`, `fr`, `de`, `it`, `pt`, `ru`, `zh` | Fuerza el idioma |
| `hue` | `0`–`359` | Fuerza el tono semilla |

Ejemplo: `index.html?demo=1&style=cristal&mode=dark&hue=258`

---

## Privacidad

- **Ninguna petición de red.** Sin CDN, sin fuentes web, sin analítica, sin telemetría.
- **Los favicons están desactivados por defecto.** Los iconos son iniciales con color
  derivado del dominio. Si los activas, se piden al propio sitio, nunca al servicio de
  favicons de Google, que revelaría tu lista de favoritos.
- **Tus datos viven en el `localStorage` del navegador** y no salen de tu equipo.

---

## Notas técnicas

- HTML, CSS y JavaScript sin dependencias ni proceso de compilación.
- Requiere Chromium 111 o superior por `oklch()` y `backdrop-filter`. En navegadores
  anteriores la página funciona, pero los colores se ven planos.
- El color se genera en OKLCH para que los cinco estilos mantengan el contraste al cambiar
  de tono. El favicon usa `hsl()` porque se renderiza como imagen aislada.
- El arrastre usa eventos de puntero en lugar de la API de arrastre de HTML5: `<button>` no
  dispara `dragstart` de forma fiable, `<a>` arrastra su propia URL, y ninguno funciona en
  pantallas táctiles.
- La reordenación se anima con una transición FLIP; todas las animaciones respetan
  `prefers-reduced-motion`.
- Estructura de datos versionada, con migración automática desde formatos anteriores.

<details>
<summary><b>Mover tus datos entre orígenes</b></summary>

<br>

El almacenamiento es por origen: si pasas del fichero local a una URL, empiezas de cero.
Antes de mudarte, entra en *Ajustes → Copias de seguridad → Descargar fichero* y luego
*Restaurar fichero* en el destino.

</details>

---

## Contribuir

Traducciones, estilos y avisos de fallos son bienvenidos. Todo el proyecto es un único
`index.html`: lo abres en un editor y ya estás listo.

## Licencia

MIT. Haz con ello lo que quieras.
