# Zaguán

**Tu página de inicio, en un solo fichero.**

Una página de nueva pestaña para navegadores basados en Chromium: buscador, carpetas de
favoritos al estilo del lanzador de Android y cinco estilos visuales. Un único HTML, sin
dependencias, sin compilación y sin una sola petición a servidores de terceros.

<!-- Sustituye por tus capturas reales -->
![Estilo Vivo](capturas/vivo.png)

| Vivo | Cristal | Mínimo |
|:---:|:---:|:---:|
| ![](capturas/vivo.png) | ![](capturas/cristal.png) | ![](capturas/minimo.png) |

---

## Qué hace

- **Buscador** con DuckDuckGo, Brave, Startpage, Wikipedia, Google o tu propia plantilla
  (útil si te autoalojas un SearXNG).
- **Detección de direcciones**: si escribes `proxmox.local:8006` o `localhost:8080`, navega
  en lugar de buscar.
- **Filtrado de favoritos en vivo**: al teclear aparecen los enlaces que coinciden, con la
  carpeta a la que pertenecen. Flechas para elegir, Enter para abrir.
- **Carpetas tipo lanzador**: icono compacto con vista previa 2×2 que se expande en un panel
  mediante *container transform*, la transición nace del icono que has pulsado.
- **Accesos sueltos** conviviendo con las carpetas en la misma rejilla.
- **Arrastrar y soltar** para reordenar, meter enlaces en carpetas o sacarlos al escritorio.
- **Copias de seguridad**: historial dentro del navegador con copia automática diaria, más
  exportación e importación en JSON.
- **Cinco estilos** y color dinámico generado a partir de un tono semilla.
- **Favicon propio** que se recolorea con el tema.

## Estilos

| Estilo | Idea | Rasgos |
|---|---|---|
| **Vivo** | Material You | Color saturado de fondo, formas blandas, radios de 24 px |
| **Clásico** | Mac OS X de la vieja escuela | Grises azulados, biseles, iconos con brillo Aqua, buscador hundido |
| **Cristal** | Vidrio profundo | Superficies al 10 %, desenfoque de 58 px, destello diagonal y dispersión cromática en los cantos |
| **Mínimo** | Monocromo | Iconos de contorno, cero sombras, buscador reducido a una línea |
| **Nórdico** | Lino y madera | Base cálida, veta sutil, iconos en pastel apagado |

Cada uno tiene su variante clara y oscura, y el modo automático sigue la preferencia del
sistema.

## Atajos

| Tecla | Acción |
|---|---|
| `/` o cualquier letra | Enfocar el buscador |
| `↑` `↓` | Elegir entre los favoritos filtrados |
| `Enter` | Abrir o buscar |
| `Ctrl` + `Enter` | Abrir en pestaña nueva |
| `E` | Modo edición |
| `Esc` | Cerrar carpeta o limpiar el buscador |

## Instalación

### Opción A — desde la web (recomendada)

Abre la [demo publicada](https://charlyrr.github.io/zaguan/) y úsala directamente, o
clona el repositorio y publícala en tus propias GitHub Pages. Servirla por HTTPS garantiza
que el almacenamiento del navegador funcione sin sorpresas.

### Opción B — fichero local

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

### Configurar el navegador

**Helium** — abre `helium://flags/#custom-ntp`, ponlo en *Enabled* y escribe la URL de tu
página. Reinicia. En `helium://settings/onStartup`, marca *Abrir la página de nueva pestaña*.

**Chrome, Brave, Edge y otros Chromium sin ese flag** — no permiten cambiar la nueva pestaña
sin extensión. Puedes ponerla como página de inicio en Ajustes → Al abrir el navegador, o
usar cualquier extensión de tipo *custom new tab*.

**Firefox** — sirve como página de inicio, pero la nueva pestaña requiere extensión.

## Privacidad

- Ninguna petición de red. Sin CDN, sin fuentes web, sin analítica, sin telemetría.
- Los favicons están **desactivados por defecto**; los iconos son iniciales con color
  derivado del dominio. Si los activas, se piden al propio sitio, nunca al servicio de
  favicons de Google, que revelaría tu lista de favoritos.
- Tus datos viven en el `localStorage` de tu navegador y no salen de tu equipo.

## Notas técnicas

- HTML, CSS y JavaScript sin dependencias ni proceso de compilación.
- Requiere Chromium 111 o superior por `oklch()` y `backdrop-filter`. En navegadores
  anteriores la página funciona, pero los colores se ven planos.
- El color se genera en OKLCH para que los cinco estilos mantengan contraste al cambiar de
  tono. El favicon usa `hsl()` porque se renderiza como imagen aislada.
- Las animaciones respetan `prefers-reduced-motion`.
- Estructura de datos versionada, con migración automática desde formatos anteriores.

## Migrar tus datos

El almacenamiento es por origen: si pasas del fichero local a una URL, empiezas de cero.
Antes de mudarte, entra en *Ajustes → Copias de seguridad → Descargar fichero* y luego
*Restaurar fichero* en el destino.

## Licencia

MIT. Haz con ello lo que quieras.
