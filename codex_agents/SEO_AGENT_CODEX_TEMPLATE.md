# SEO Codex Agent — Plantilla

> **Modelo sugerido**: `gpt-5-codex-high`
> **Propósito**: Auditorías SEO, planificación de contenido y coordinación con herramientas externas.

## Capacidades clave
- Procesar grandes volúmenes de datos (GA4, GSC, crawls, CSV externos).
- Generar código Python/SQL para análisis ad-hoc.
- Integrarse con APIs (NeuronWriter, SEOcrawl, Ahrefs/Semrush) según credenciales disponibles.
- Redactar documentación estructurada (tablas Markdown, backlog priorizado, reportes ejecutivos).

## Preparación previa
1. **Datos** (comprueba rutas y actualiza con tu proyecto):
   - `_inputs/analytics/ga4/` → exports 28/90 días.
   - `_inputs/seo/gsc/` → consultas y páginas.
   - `tmp/seo_audit_YYYYMMDD/` → crawls y reportes externos.
2. **Herramientas**:
   - **NeuronWriter API** (opcional): define `NEURON_API_KEY` en entorno seguro.
   - **PageSpeed Insights**: `PSI_API_KEY` para métricas Core Web Vitals.
   - **Supabase / Data Warehouse**: para snapshots y almacenamiento.
3. **Documentación**: revisa
   - `docs/processes/seo_growth_loop.md`
   - `playbooks/SEO_AUDIT.md`
   - `docs/processes/pilares_editoriales.md`

## Ejecución en CLI Codex
```bash
codex --cd ~/ruta-proyecto --model gpt-5-codex-high --interactive
```

### Prompt base
```
Actúa como SEO Lead del blog <nombre>. Sigue el playbook `playbooks/SEO_AUDIT.md`.
ICP y pilares: ver `docs/processes/pilares_editoriales.md`.

Tareas:
1. Analiza los CSV adjuntos (GA4, GSC, crawls) y detecta quick wins 80/20.
2. Prioriza backlog SEO (crear, actualizar, consolidar, técnico) con impacto/efuerzo.
3. Propón briefs de contenido (pilares y satélites) y coordina con Content.
4. Señala riesgos técnicos y dependencias (Ops, Automatización, Analytics).

Entrega final: Markdown listo para `docs/estrategia/seo_backlog.md` + tablas anexas.
```

Adjunta archivos con `:attach` o indicando rutas relativas.

## Modos de trabajo
- **Audit Mode**: auditoría completa y backlog.
- **Content Gap Mode**: detectar keywords/temas huérfanos vs competencia.
- **Technical Mode**: checklist técnico con PageSpeed, Core Web Vitals y WP-CLI.
- **NeuronWriter Assist**: generar briefs y entidades semánticas para pilares.

## Entregables esperados
- `docs/estrategia/seo_backlog.md`
- Tablas (CSV/MD) en `tmp/seo_audit_YYYYMMDD/`
- Resumen en `claude/logs/` con insights clave y próximos pasos.

## Seguridad
- Nunca exponer API keys ni tokens en el repo.
- Usa gestores de secretos o `.env.local` para credenciales.
- Anonimiza datos personales antes de adjuntarlos al modelo.

Actualiza este documento con particularidades de tu proyecto (herramientas disponibles, frecuencias, owners).
