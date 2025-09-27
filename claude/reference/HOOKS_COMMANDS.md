# Hooks y Comandos Personalizados

Usa este documento para documentar integraciones avanzadas que Claude pueda invocar.

## Formato sugerido por hook
- Nombre del hook/comando:
- Descripción:
- Ubicación del script o endpoint:
- Parámetros requeridos/opcionales:
- Ejemplo de uso (CLI o pseudo-código):
- Precauciones / límites de seguridad:
- Owner responsable:

## Ejemplo
- Nombre: `wp_sync_menu`
- Descripción: Sincroniza menú principal con lista de URLs aprobadas.
- Script: `scripts/wp/wp_sync_menu.sh`
- Parámetros: `--config config/menus/main.yml`
- Ejemplo: `bash scripts/wp/wp_sync_menu.sh --config config/menus/main.yml`
- Precauciones: requiere acceso SSH; ejecutar sólo en staging antes de producción.

Mantén este archivo actualizado para evitar uso indebido de comandos sensibles.
