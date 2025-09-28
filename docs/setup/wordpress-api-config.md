# Configuración WordPress REST API - Guía Práctica

**Objetivo**: Configurar acceso seguro para automatizaciones con Pabbly Connect, N8N y agentes IA.

## 🔧 Pasos de Configuración

### 1. Crear Usuario Específico para API

#### En el WordPress Admin:
1. Ve a **Usuarios > Añadir nuevo**
2. Completa los datos:
   ```
   Nombre de usuario: sin-paja-bot
   Email: api-blog@tu-dominio.com (usar email real)
   Rol: Editor
   Contraseña: [generar una robusta, no la usaremos]
   ```
3. **Importante**: Desmarcar "Enviar notificación por email al usuario"
4. Guardar usuario

### 2. Generar Application Password

#### Para WordPress 5.6+:
1. Ve a **Usuarios > Todos los usuarios**
2. Haz clic en **Editar** del usuario `sin-paja-bot`
3. Scroll down hasta **Application Passwords**
4. En "New Application Password Name" escribe: `Pabbly-N8N-Automation`
5. Clic en **Add New Application Password**
6. **¡CRÍTICO!** Copia inmediatamente la contraseña generada (formato: `xxxx xxxx xxxx xxxx`)
7. Guárdala en un lugar seguro (1Password, Bitwarden, etc.)

#### Si tu WordPress es anterior a 5.6:
Instala el plugin **Application Passwords** desde el repositorio oficial.

### 3. Verificar que REST API Funciona

#### Test básico con curl:
```bash
# Reemplaza con tus datos reales
curl -u "sin-paja-bot:xxxx xxxx xxxx xxxx" \
  https://tu-dominio.com/wp-json/wp/v2/posts?per_page=1
```

**Respuesta esperada**: JSON con array de posts (aunque esté vacío).
**Si falla**: Verificar que los permalinks no sean "Plain" en WordPress.

### 4. Configurar Variables de Entorno

#### Crear archivo `.env.local` (NO subir a Git):
```bash
# WordPress REST API Configuration
WP_API_BASE_URL=https://tu-dominio.com/wp-json/wp/v2
WP_API_USERNAME=sin-paja-bot
WP_API_PASSWORD=xxxx xxxx xxxx xxxx
WP_SITE_URL=https://tu-dominio.com

# Para debugging
WP_API_DEBUG=true
```

#### Añadir al .gitignore:
```bash
echo ".env.local" >> .gitignore
echo "*.env" >> .gitignore
```

## 🔒 Configuración de Seguridad

### 1. Limitar Capacidades del Usuario API

#### Opción A: Plugin User Role Editor
1. Instalar "User Role Editor"
2. Crear rol custom "API Agent" con solo:
   - `edit_posts`
   - `publish_posts`
   - `upload_files`
   - `edit_published_posts`
   - `delete_posts`

#### Opción B: Código en functions.php (theme child):
```php
// Crear rol específico para API
function create_api_agent_role() {
    add_role('api_agent', 'API Agent', array(
        'read' => true,
        'edit_posts' => true,
        'publish_posts' => true,
        'upload_files' => true,
        'edit_published_posts' => true,
        'delete_posts' => true,
    ));
}
add_action('init', 'create_api_agent_role');
```

### 2. Monitoreo y Logs

#### Plugin recomendado: WP Security Audit Log
- Trackea todos los cambios vía API
- Alertas por actividad inusual
- Logs específicos para REST API

#### Log personalizado (opcional):
```php
// En functions.php
function log_api_usage($request) {
    if (strpos($request->get_route(), '/wp/v2/') === 0) {
        error_log('API Usage: ' . $request->get_method() . ' ' . $request->get_route());
    }
}
add_action('rest_api_init', function() {
    add_filter('rest_pre_dispatch', 'log_api_usage', 10, 1);
});
```

## 🛠️ Testing de Endpoints Principales

### 1. Listar Posts
```bash
curl -u "sin-paja-bot:password" \
  "https://tu-dominio.com/wp-json/wp/v2/posts?per_page=5"
```

### 2. Crear Post (Draft)
```bash
curl -X POST \
  -u "sin-paja-bot:password" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Test API Post",
    "content": "Contenido de prueba desde API",
    "status": "draft",
    "categories": [1]
  }' \
  "https://tu-dominio.com/wp-json/wp/v2/posts"
```

### 3. Subir Imagen
```bash
curl -X POST \
  -u "sin-paja-bot:password" \
  -F "file=@imagen.jpg" \
  "https://tu-dominio.com/wp-json/wp/v2/media"
```

### 4. Listar Categorías
```bash
curl -u "sin-paja-bot:password" \
  "https://tu-dominio.com/wp-json/wp/v2/categories"
```

## 🔗 Integración con Pabbly Connect

### Configuración en Pabbly:
1. **App**: WordPress
2. **Connection Name**: "Blog Cine Series API"
3. **WordPress URL**: `https://tu-dominio.com`
4. **Username**: `sin-paja-bot`
5. **Password**: `[Application Password generada]`

### Test de Conexión:
- Pabbly debería poder listar posts existentes
- Crear un post de prueba en draft mode

## 🔗 Integración con N8N

### Node Configuration:
```json
{
  "name": "WordPress",
  "type": "n8n-nodes-base.wordpress",
  "credentials": {
    "url": "https://tu-dominio.com",
    "username": "sin-paja-bot",
    "password": "[Application Password]"
  }
}
```

## 🚨 Troubleshooting

### Error 401 (Unauthorized)
- Verificar username/password correctos
- Comprobar que Application Password esté activa
- Verificar que el usuario tenga permisos suficientes

### Error 404 (Not Found)
- Verificar que permalinks NO sean "Plain"
- Ir a **Configuración > Enlaces permanentes** y elegir cualquier otra opción

### Error 403 (Forbidden)
- Usuario sin permisos suficientes
- Plugin de seguridad bloqueando REST API
- Servidor (hosting) bloqueando requests

### REST API completamente deshabilitada
Añadir en functions.php:
```php
// Asegurar que REST API esté habilitada
remove_filter('rest_enabled', '__return_false');
remove_filter('json_enabled', '__return_false');
```

## ✅ Checklist de Validación

- [ ] Usuario `sin-paja-bot` creado con rol Editor/API Agent
- [ ] Application Password generada y guardada de forma segura
- [ ] Test curl básico funciona (status 200)
- [ ] Variables de entorno configuradas en `.env.local`
- [ ] `.env.local` añadido a .gitignore
- [ ] Pabbly Connect conectado y testeado
- [ ] N8N configurado (si aplica)
- [ ] Monitoreo/logs configurado
- [ ] Documentadas las credenciales de forma segura

## 🔄 Mantenimiento

### Rotación de Passwords (cada 90 días):
1. Generar nueva Application Password
2. Actualizar en Pabbly Connect
3. Actualizar en N8N
4. Actualizar variables de entorno
5. Revocar password anterior

### Auditoría mensual:
- Revisar logs de uso de API
- Verificar que solo actividad legítima
- Comprobar performance (response times)
- Verificar que todas las automatizaciones funcionan

---

**⚠️ IMPORTANTE**: Nunca commitear credenciales al repositorio. Usar siempre variables de entorno o gestores de secretos.