# Checklist QA Técnico

## Pre-producción
- [ ] Cambios probados en entorno local/staging.
- [ ] Backups recientes verificados.
- [ ] Changelog revisado para plugins/temas afectados.

## Publicación
- [ ] Previsualización sin errores (desktop/móvil).
- [ ] Imágenes optimizadas (peso < 200 KB cuando sea posible).
- [ ] Lazy load y atributos `alt` configurados.
- [ ] Schema validado (Rich Results Test).
- [ ] Metadatos (title, description, open graph, twitter) correctos.
- [ ] Slug y breadcrumbs revisados.
- [ ] Revisar enlaces (internos/externos) con plugin o Screaming Frog (`mode: list`).

## Post despliegue (24h)
- [ ] Monitorear Core Web Vitals (PageSpeed Insights o WebPageTest).
- [ ] Revisar Search Console → Cobertura/Experiencia.
- [ ] Confirmar que los eventos GA4 se disparan con UTMs correctas.
- [ ] Verificar que no hay alertas de seguridad/performance.

Documenta incidencias y soluciones en `docs/logbook` o `claude/logs`.
