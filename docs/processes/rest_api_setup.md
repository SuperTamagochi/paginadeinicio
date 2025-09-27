# Configuración REST API WordPress

## Objetivo
Habilitar un acceso seguro a la REST API del blog para automatizar publicaciones, actualizaciones y consultas desde agentes o scripts.

## Pasos recomendados
1. **Crear usuario dedicado**
   - Rol mínimo necesario (`Editor` o rol custom con capacidades `edit_posts`, `publish_posts`, `upload_files`).
   - Nombre sugerido: `api-agent` o similar.
   - Forzar contraseña robusta + 2FA para acceso web normal.

2. **Generar Application Password** (WordPress ≥ 5.6)
   - Navegar a `Perfil > Application Passwords`.
   - Crear credencial con nombre descriptivo (ej. `codex-integration`).
   - Guardar el token en gestor de secretos (1Password/Bitwarden). No subir al repositorio.

3. **Probar endpoints base**
   ```bash
   curl -u usuario:apppassword https://tu-dominio.com/wp-json/wp/v2/posts?per_page=1
   ```
   - Validar respuesta 200 y estructura JSON.

4. **Definir endpoints personalizados (opcional)**
   - Añadir rutas vía plugin o theme child (`register_rest_route`).
   - Documentar método, parámetros y esquema de respuesta.
   - Implementar `permissions_callback` para reforzar seguridad.

5. **Seguridad**
   - Forzar HTTPS, limitar orígenes (CORS) si se exponen endpoints custom.
   - Registrar uso y errores (log dedicado o herramienta externa).
   - Rotar Application Passwords cada 90 días.
   - Auditar logs ante actividades sospechosas.

6. **Integración con agentes**
   - Configurar MCP/CLI/Script con variables de entorno (`WP_API_BASE`, `WP_API_USER`, `WP_API_APP_PWD`).
   - Guardar configuración en `.env.local` o gestor seguro, nunca en repositorio.
   - Definir límites de uso (posts por minuto, tamaño payload) para evitar bloqueos.

## Endpoints comunes
- `GET /wp/v2/posts` — listar artículos.
- `POST /wp/v2/posts` — crear borrador/publicar.
- `POST /wp/v2/media` — subir archivos.
- `POST /wp/v2/categories` / `tags` — gestionar taxonomías.
- `GET /wp-json/rankmath/v1/` o `yoast/v1/` — metadatos (si plugins compatibles).

## Checklist de documentación
- [ ] Registrar usuario y rol en `docs/processes/contexto_inicial.md` (sin contraseñas).
- [ ] Guardar detalles de endpoints personalizados en esta carpeta (`rest_endpoints.md`).
- [ ] Añadir pruebas curl/httpie y respuestas esperadas.
- [ ] Definir plan de contingencia si falla la API (procedimiento manual).

Mantén estos pasos actualizados según la política de seguridad de tu organización.
