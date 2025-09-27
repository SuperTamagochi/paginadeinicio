# Operaciones & Mantenimiento

## Objetivo
Asegurar estabilidad, seguridad y rendimiento del blog WordPress en producción.

## Cadencia recomendada
- **Diario**: monitorizar uptime, revisar alertas críticas.
- **Semanal**: backups off-site, actualización de plugins/temas (previo testing), purga de cache.
- **Mensual**: auditoría seguridad, revisión Core Web Vitals, limpieza de base de datos.
- **Trimestral**: pruebas de recuperación ante desastres, revisión arquitectura y costos.

## Flujo de despliegues
1. Recibir requerimiento (orquestador/SEO/Content).
2. Implementar en entorno local/staging.
3. QA técnico (`docs/checklists/qa_tecnico.md`).
4. Aprobación orquestador/owner.
5. Deploy a producción (automatizado/manual documentado).
6. Monitorizar 24h posteriores.

## Mantenimiento técnico
- **Backups**: automatizados + snapshot manual antes de cambios mayores.
- **Actualizaciones**: usar herramientas como `wp plugin update --dry-run` y revisar changelog.
- **Rendimiento**: medir TTFB, LCP, CLS, INP tras cambios; usar PageSpeed, WebPageTest.
- **Seguridad**: WAF (Cloudflare/Sucuri), contraseñas rotadas, usuarios mínimos, 2FA.
- **Logs**: conservar registros de errores y accesos para análisis posterior.

## Gestión de accesos
- Crear usuario dedicado para agentes (rol Editor o personalizado + Application Password).
- Documentar accesos en gestor seguro (1Password, Bitwarden).
- Revocar accesos obsoletos de forma trimestral.

## Integraciones REST / WP-CLI
- Documentar endpoints personalizados en `docs/processes/rest_api_setup.md`.
- Definir comandos WP-CLI permitidos y bloqueados.
- Mantener script de salud (`scripts/healthcheck.sh`) fuera del repo si contiene secretos.

## KPIs Ops
- Uptime objetivo ≥ 99.5% (MVP) / 99.9% (Growth).
- Tiempos clave: TTFB < 800 ms, LCP < 2.5 s, INP < 200 ms.
- Mean Time to Recovery (MTTR) < 1h.
- Incidentes críticos documentados al 100%.

## Riesgos comunes
- Actualizaciones incompatibles → mitiga con staging + backups.
- Falta de monitorización → configurar alertas (Pingdom/Better Uptime/Healthcheck).
- Sobrecarga de plugins → auditoría trimestral, eliminar redundantes.
- Dependencias sin owner → asignar responsable y fecha de revisión.
