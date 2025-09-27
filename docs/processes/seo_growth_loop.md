# SEO Growth Loop

## Objetivo
Establecer un ciclo continuo de investigación, ejecución y medición SEO que soporte el crecimiento orgánico del blog.

## Ciclo principal
1. **Descubrir oportunidades** (Mensual)
   - Revisar GA4/GSC por queries emergentes y páginas con potencial.
   - Ejecutar crawls técnicos (Screaming Frog, Sitebulb, SEOcrawl).
   - Analizar competidores y SERP features.

2. **Priorizar backlog** (Quincenal)
   - Matriz Impacto vs Esfuerzo (Pilar/Satélite/Cluster).
   - Etiquetar acciones: Crear, Actualizar, Consolidar, Redirigir, Técnicas.
   - Validar dependencias (Contenido, Ops, Automations).

3. **Ejecutar optimizaciones** (Sprint semanal/quincenal)
   - Briefs de contenido, actualizaciones on-page, mejoras técnicas, link building.
   - Coordinar con Content y Ops para publicación.

4. **Medir & Documentar** (Mensual)
   - KPI core: sesiones orgánicas, CTR, posiciones promedio, conversiones.
   - Reporte ejecutivo (tabla + insights + próximos pasos) en `docs/estrategia/`.
   - Actualizar `claude/logs/` y backlog con aprendizajes.

## Roles implicados
- **SEO Lead**: dirige el loop, coordina agentes.
- **Keyword Analyst**: extrae insights de datos.
- **Technical SEO**: mejora rendimiento, indexabilidad, schema.
- **Link Strategist**: detecta oportunidades de enlaces internos/externos.
- **Content Partner**: implementa recomendaciones en artículos.

## Herramientas por fase
- Descubrir: GA4, GSC, Ahrefs/Semrush, SEOcrawl, Google Trends, AnswerThePublic.
- Priorizar: Notion/Sheets, frameworks RICE/ICE, Trello/Jira.
- Ejecutar: WordPress REST, WP-CLI, NeuronWriter, PageSpeed Insights, Screaming Frog.
- Medir: Looker Studio, Data Studio templates, Supabase/Metabase.

## Entregables
- `playbooks/SEO_AUDIT.md` actualizado según madurez.
- Backlog priorizado (MD o tablero).
- Reporte mensual SEO (`docs/estrategia/seo_report_YYYYMM.md`).
- Lista de dependencias y riesgos.

## Escalabilidad (Scale)
- Automatizar extracción de datos (APIs, cron jobs).
- Integrar alertas (ej. caída CTR, cobertura).
- Implementar pruebas controladas (A/B titles, contenido dinámico).
- Formación continua equipo en updates de algoritmo.
