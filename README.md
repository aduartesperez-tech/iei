# Instituto de Educación Integral — Sitio Web

Sitio web institucional del **Instituto de Educación Integral (IEI)**, ubicado en Las Nubes de Vázquez de Coronado, San José, Costa Rica.

## Descripción

Sitio estático de 5 páginas desarrollado en HTML puro con [Tailwind CSS](https://tailwindcss.com/) (CDN). Sin frameworks ni dependencias de build. Incluye animaciones de scroll, carrusel de imágenes, diseño responsive y SEO básico.

## Páginas

| Archivo | Descripción |
|---------|-------------|
| `index.html` | Página principal con carrusel hero, secciones de presentación y talleres |
| `nosotros.html` | Historia, misión, visión y valores del instituto |
| `talleres.html` | Detalle de los 5 talleres: Diseño Gráfico, Ciberseguridad, Barismo, Gastronomía y Deportes |
| `contacto.html` | Información de contacto, mapa de ubicación y redes sociales |
| `trabajando.html` | Página temporal para secciones en construcción |
| `404.html` | Página de error 404 personalizada |

## Estructura

```
WEBIEI/
├── index.html
├── nosotros.html
├── talleres.html
├── contacto.html
├── trabajando.html
├── 404.html
├── sitemap.xml
├── robots.txt
├── comprimir_imagenes.ps1
└── IMG/
    ├── logo.png
    ├── casa_rosada.jpg
    ├── talleres.jpg
    ├── taller_barismo.jpg
    ├── taller_ciber.jpg
    ├── taller_deporte.jpg
    ├── taller_diseno.jpg
    ├── taller_gastro.jpg
    ├── collage_actividades.jpg
    ├── estudiantes_escaleras.jpg
    ├── estudiantes_exterior.jpg
    ├── estudiantes_fachada.jpg
    ├── estudiantes_jardin.jpg
    └── estudiantes_pasillo.jpg
```

## Correr localmente

```bash
python -m http.server 8000
```

Luego abrí `http://localhost:8000` en el navegador.

## Tecnologías

- HTML5 semántico
- [Tailwind CSS](https://tailwindcss.com/) via CDN
- JavaScript vanilla (menú móvil, animaciones reveal, carrusel)
- Google Maps embed

## Contacto IEI

- **Teléfono:** 2529 0676
- **Correo:** direccion@iei.ed.cr
- **Ubicación:** X2PR+94Q, Vázquez de Coronado, San José, Costa Rica
- **Facebook:** [facebook.com/ieicr](https://www.facebook.com/ieicr)
- **Instagram:** [@iei_cr](https://www.instagram.com/iei_cr/)
