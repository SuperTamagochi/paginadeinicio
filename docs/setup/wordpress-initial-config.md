# Configuración Inicial WordPress - Blog Cine y Series

**Usuario**: Guardian del Canon (Administrador)
**Objetivo**: Configurar WordPress para automatización y SEO óptimo

## 🔧 Configuración Básica

### 1. Ajustes Generales
**Ubicación**: `Ajustes > Generales`

```
Título del sitio: Página de Inicio - Cine y Series
Descripción corta: Guías curadas sin paja para ver series y películas
URL de WordPress: https://tu-dominio.com
URL del sitio: https://tu-dominio.com
Zona horaria: Madrid
Formato de fecha: j F, Y (ej: 28 septiembre, 2024)
Formato de hora: G:i (ej: 14:30)
```

### 2. Permalinks (CRÍTICO para API)
**Ubicación**: `Ajustes > Enlaces permanentes`

✅ **Seleccionar**: `Nombre de la entrada`
- Estructura: `/%postname%/`
- ❌ **NUNCA**: "Enlaces sin formato" (rompe la API)

**Custom Structure** para categorías:
```
Base de categoría: /series/%category%
Base de etiqueta: /tag
```

### 3. Ajustes de Lectura
**Ubicación**: `Ajustes > Lectura`

```
La página de inicio muestra: Últimas entradas
Páginas del blog a mostrar: 12
Feeds muestran: 10 elementos
Para cada entrada en feed: Resumen
Visibilidad: ✅ Permitir a motores de búsqueda indexar el sitio
```

### 4. Ajustes de Comentarios
**Ubicación**: `Ajustes > Comentarios`

```
✅ Permitir comentarios en artículos nuevos
✅ Autor del comentario debe introducir nombre y email
✅ Los usuarios deben estar registrados para comentar
✅ Cerrar automáticamente comentarios en artículos de más de 30 días
✅ Mostrar avatares
❌ Desactivar trackbacks/pingbacks (spam protection)
```

### 5. Ajustes de Medios
**Ubicación**: `Ajustes > Medios`

```
Tamaño miniatura: 300 x 300 (recortada)
Tamaño medio: 768 x 576 (para contenido)
Tamaño grande: 1200 x 900 (featured images)
✅ Organizar subidas en carpetas por mes/año
```

## 🔌 Plugins Esenciales

### SEO y Performance
1. **Yoast SEO** o **RankMath**
   - Meta descriptions automáticas
   - Schema markup para listas
   - XML sitemaps

2. **WP Rocket** o **WP Super Cache**
   - Cache de páginas
   - Optimización Core Web Vitals

3. **Smush** o **ShortPixel**
   - Compresión automática de imágenes

### Automatización y API
4. **Application Passwords** (si WP < 5.6)
   - Para REST API access

5. **Advanced Custom Fields** (opcional)
   - Para metadata de series

6. **WP-CLI** (vía hosting)
   - Para automatizaciones avanzadas

### Analytics y Tracking
7. **Site Kit by Google**
   - Conecta GA4, GSC, PageSpeed
   - Dashboard integrado

8. **MonsterInsights** (alternativa)
   - Google Analytics integration

### Seguridad
9. **Wordfence** o **Sucuri**
   - Firewall y malware scan
   - Protección brute force

10. **UpdraftPlus**
    - Backups automáticos

## 🎨 Configuración Tema

### Customización básica
**Ubicación**: `Apariencia > Personalizar`

```
Colores primarios:
  - Primario: #1a1a1a (negro cinematográfico)
  - Secundario: #ff6b35 (naranja cine)
  - Accent: #4ecdc4 (azul/verde claro)

Tipografía:
  - Headings: Inter o Poppins (web fonts)
  - Body: System fonts o Open Sans

Logo: Subir logo del blog (recomendado: 300x80px)
Favicon: 32x32px con tema cinematográfico
```

### Menús
**Ubicación**: `Apariencia > Menús`

**Menú Principal**:
```
- Inicio
- Series Sin Paja
  - Expediente X
  - CSI Las Vegas
  - House MD
- Por Género
  - Drama
  - Sci-Fi
  - Comedia
- Guías Completas
- Contacto
```

### Widgets recomendados
**Ubicación**: `Apariencia > Widgets`

**Sidebar**:
- Posts recientes (5)
- Categorías (dropdown)
- Tags populares
- Newsletter signup
- Amazon affiliate box

## 📊 Configuración Analytics

### Google Analytics 4
1. Crear propiedad GA4
2. Instalar código tracking via Site Kit
3. Configurar objetivos:
   - Page views (engagement)
   - Affiliate clicks (conversions)
   - Newsletter signups

### Google Search Console
1. Verificar propiedad
2. Conectar con GA4
3. Enviar sitemap.xml

## 🔗 Configuración Amazon Associates

### Setup básico
1. Crear cuenta Amazon Associates
2. Configurar tracking ID
3. Instalar plugin Amazon Associates Link Builder
4. Configurar automatic link insertion

### Productos target
```
Categorías principales:
- DVD/Blu-ray series completas
- Streaming devices
- Home theater equipment
- Libros sobre cine/TV
```

## 🎯 Configuración SEO específica

### Schema Markup para guías
```json
{
  "@type": "HowTo",
  "name": "Cómo ver [Serie] sin paja",
  "description": "Guía de episodios esenciales",
  "step": [...]
}
```

### Categories structure
```
Series Sin Paja/
├── Drama
├── Sci-Fi
├── Comedia
├── Crime
└── Antología

Guías Completas/
├── Expediente X
├── CSI Las Vegas
└── House MD
```

### Tags strategy
- Nombre de serie
- Actor principal
- Género específico
- Año/década
- Network (HBO, Netflix, etc.)

## ⚙️ Configuración REST API avanzada

### Custom endpoints (opcional)
**Archivo**: `functions.php` del tema child

```php
// Endpoint para estadísticas de guías
add_action('rest_api_init', function() {
    register_rest_route('series/v1', '/stats/(?P<series>[a-zA-Z0-9-]+)', array(
        'methods' => 'GET',
        'callback' => 'get_series_stats',
        'permission_callback' => function() {
            return current_user_can('edit_posts');
        }
    ));
});

function get_series_stats($request) {
    $series = $request['series'];
    // Return episode counts, ratings, etc.
}
```

## 🔒 Seguridad adicional

### htaccess optimizations
```apache
# Proteger wp-config.php
<files wp-config.php>
order allow,deny
deny from all
</files>

# Limitar acceso a REST API si necesario
# (No recomendado si usas automatización)

# Cache headers para imágenes
<IfModule mod_expires.c>
ExpiresActive on
ExpiresByType image/jpg "access plus 1 month"
ExpiresByType image/jpeg "access plus 1 month"
ExpiresByType image/gif "access plus 1 month"
ExpiresByType image/png "access plus 1 month"
</IfModule>
```

## ✅ Checklist de configuración

### Básico
- [ ] Usuario Guardian-del-Canon creado como Admin
- [ ] Application Password generada
- [ ] Permalinks configurados (NO "Plain")
- [ ] Título y descripción del sitio
- [ ] Zona horaria correcta

### SEO y Performance
- [ ] Plugin SEO instalado y configurado
- [ ] Google Analytics conectado
- [ ] Search Console verificado
- [ ] Plugin de cache activo
- [ ] Compresión de imágenes configurada

### Seguridad
- [ ] Plugin de seguridad instalado
- [ ] Backups automáticos configurados
- [ ] .htaccess optimizado
- [ ] Updates automáticos activados

### Automatización
- [ ] REST API testeada con curl
- [ ] Variables de entorno configuradas
- [ ] Make Connect conectado
- [ ] N8N configurado (si aplica)

---

**⚠️ IMPORTANTE**: Como tienes backups, experimenta sin miedo. Es el entorno perfecto para probar configuraciones antes de aplicarlas al blog principal.
