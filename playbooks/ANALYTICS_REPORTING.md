# Playbook Reporting & Analítica

## Objetivo
Entregar insights accionables a partir de los datos del blog para orientar decisiones editoriales, SEO y de monetización.

## Entradas mínimas
- GA4: sesiones, usuarios, eventos, conversiones.
- GSC: clics/impr. por URL y query.
- CRM/ESP: leads generados, tasas de apertura/click.
- Ventas/Revenue: si aplica (Stripe, WooCommerce, Thrivecart, LemonSqueezy).

## Cadencia sugerida
- **Semanal**: snapshot rápido (tráfico global, artículos top, incidencias).
- **Mensual**: informe completo con insights y roadmap.
- **Trimestral**: revisión estratégica (tendencias, nuevos experimentos).

## Flujo mensual
1. **Extracción de datos**
   - Automatizada (APIs/Supabase) o manual (CSV).
   - Guardar en `tmp/analytics_report_YYYYMM/`.
2. **Limpieza y consolidación**
   - Usar pandas/Sheets para normalizar.
   - Unificar fechas, UTM, categorías.
3. **Análisis**
   - Pilares: crecimiento orgánico, engagement, conversión, revenue.
   - Detectar outliers positivos/negativos.
   - Cruzar datos cualitativos (feedback) cuando exista.
4. **Narrativa**
   - Resumen ejecutivo (3-5 bullets).
   - Tabla de métricas clave.
   - Insights + recomendaciones + próximos pasos.
5. **Entrega & seguimiento**
   - Guardar reporte en `docs/estrategia/analytics_report_YYYYMM.md`.
   - Registrar decisiones en logbook y backlog.
   - Planificar experimentos y owners.

## Métricas recomendadas
- Tráfico orgánico vs objetivo.
- CTR y posición promedio por pilar.
- Conversiones (lead magnet, venta) por pieza.
- Tasa de rebote / engagement (scroll, tiempo).
- ROI contenido (ingreso - coste producción/distribución).

## Herramientas de apoyo
- Looker Studio/Metabase.
- Supabase/Airtable/Sheets para Data Spine.
- Meltano/Airbyte para ETL (Scale).
- Notion/Confluence para documentación.

Revisa la consistencia de datos y documenta supuestos. Usa etiquetas C.I.A. para clasificar hallazgos: CONTROL (datos/operaciones), INTELIGENCIA (insights), AUTOMATIZACIÓN (acciones repetibles).
