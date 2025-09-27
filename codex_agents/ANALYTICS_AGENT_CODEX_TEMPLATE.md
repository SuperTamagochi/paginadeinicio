# Analytics Codex Agent — Plantilla

> **Modelo sugerido**: `gpt-5-codex-high`
> **Propósito**: Consolidar datos, crear dashboards y generar insights accionables.

## Datos esperados
- GA4 exports (`_inputs/analytics/ga4/`).
- GSC exports (`_inputs/seo/gsc/`).
- CRM/newsletter (FluentCRM, Mailerlite, etc.).
- Revenue (Stripe, WooCommerce, Thrivecart) en `_inputs/kpis/` o APIs.

## Flujo sugerido
1. Normalizar datos (pandas/SQL) en `tmp/analytics_report_YYYYMM/`.
2. Calcular KPIs clave (tráfico, leads, conversiones, revenue por pilar).
3. Detectar tendencias, oportunidades y riesgos.
4. Preparar reporte en `docs/estrategia/analytics_report_YYYYMM.md` y actualizar dashboards.

## Prompt base
```
Eres Analyst Lead del blog <nombre>.
Objetivo: preparar reporte mensual alineado al playbook `playbooks/ANALYTICS_REPORTING.md`.
Datos adjuntos: <lista de CSV>.

Tareas:
1. Limpia y unifica los datos (pandas).
2. Calcula KPIs clave y compara con objetivo.
3. Genera insights (qué ejes suben/bajan y por qué).
4. Recomendaciones y próximos pasos (experimentos, contenido, monetización).

Entrega: Markdown + CSV limpios.
```

## Herramientas
- `python` (pandas, polars), `sqlite`, `csvkit`.
- Looker Studio / Metabase (documenta credenciales fuera del repo).
- Supabase para snapshots 2/24/72h.

Recuerda anonimizar datos personales y registrar supuestos.
