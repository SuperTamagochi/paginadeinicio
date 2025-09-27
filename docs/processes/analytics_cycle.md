# Analítica & Monetización

## Objetivo
Medir el impacto del contenido y conectar métricas de negocio (leads, ingresos, LTV) con el rendimiento del blog.

## Setup inicial (MVP)
- GA4: propiedad web + eventos clave (`page_view`, `scroll`, `cta_click`, `form_submit`).
- GSC: propiedad dominio + sitemap actualizado.
- Herramienta de visualización: Looker Studio o alternativa ligera.
- Plan de etiquetado UTM (doc compartido con marketing/automatizaciones).

## Madurez Growth
- Data warehouse ligero (Supabase/Airtable/Sheets) para snapshots 2/24/72h.
- Dashboards por pilar de contenido, funnel y cohortes.
- Integración con CRM para medir leads/ventas atribuidas.
- Alertas automáticas (ej. caída >20% en tráfico orgánico semana vs semana).

## Madurez Scale
- Modelos de atribución personalizados.
- Testing A/B (Google Optimize alternativa, VWO, Convert).
- Seguimiento de revenue recurrente, CAC, LTV.
- Integración con BI (Metabase/PowerBI).

## KPIs sugeridos
- Visitas orgánicas por pilar.
- CTR orgánico y posición promedio (GSC).
- Conversiones a lead/MQL/cliente por pieza.
- ROI de contenido (ingresos / coste producción + distribución).
- Engagement (scroll depth, tiempo en página, comentarios, shares).

## Proceso de reporting
1. Recolección de datos → scripts o exports manuales.
2. Limpieza y consolidación → pandas/Sheets.
3. Análisis → insights + recomendaciones.
4. Comunicación → reporte mensual en `docs/estrategia/analytics_report_YYYYMM.md`.
5. Retroalimentación → actualizar backlog y experimentos.

## Monetización
- Modelos comunes: afiliación, infoproductos, servicios, membresía, patrocinio.
- Checklist monetización (`docs/checklists/monetizacion.md`).
- Experimentos sugeridos: lead magnets, tripwire, upsells, bundles, contenido premium.

## Herramientas útiles
- GA4, GSC, Looker Studio, Supabase, Metabase, Stripe, Thrivecart, LemonSqueezy, Plausible, PostHog, Google Sheets, Airboxr, Polars/Python.

Documenta hipótesis y resultados en cada experimento para aprendizaje compuesto.
