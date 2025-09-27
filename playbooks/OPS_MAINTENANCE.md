# Playbook Operaciones & Mantenimiento

## Objetivo
Mantener el blog estable, seguro y con alto rendimiento, minimizando incidentes.

## Roles
- Ops Lead (responsable principal).
- Dev/Automation support (scripts, pipelines).
- QA técnico (validación previa/post cambios).

## Checklist recurrente
### Diario
- Revisar uptime/alertas.
- Comprobar logs de errores críticos.

### Semanal
- Actualizar plugins/temas/core tras pruebas en staging.
- Revisar formularios y automatizaciones clave.
- Verificar integridad de backups.

### Mensual
- Auditoría seguridad (usuarios, roles, contraseñas, firewall).
- Limpieza base de datos (revisiones, transients) y media huérfana.
- Test Core Web Vitals top URLs.

### Trimestral
- Prueba de restauración desde backup.
- Auditoría de plugins (necesidad, redundancia, impacto rendimiento).
- Revisar costos de hosting/CDN y optimizar.

## Procedimientos críticos
- **Incidente crítico**: aislar, restaurar backup, documentar post-mortem en `docs/logbook`.
- **Deploy mayor**: checklist pre/post, ventana de mantenimiento, comunicación a equipo.
- **Crear usuario API**: rol mínimo necesario, application password, registro en gestor secretos.

## Automatización
- Scripts WP-CLI (`scripts/wp/`) para tareas repetitivas.
- Monitorización (Better Uptime, UptimeRobot, StatusCake).
- Alertas Slack/Email (n8n/Make) para incidentes.

## KPIs
- Uptime, MTTR, número de incidentes por trimestre.
- Performance (LCP, INP) promedio.
- Tiempo medio de despliegue.

Documenta siempre cambios y aprendizajes.
