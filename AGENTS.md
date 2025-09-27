# Agentes Blueprint Blog WordPress

Principios: franqueza respetuosa, abogado del diablo, documentación clara y Definition of Done verificable. Clasifica procesos por nivel de madurez (`MVP`, `Growth`, `Scale`) para priorizar.

## Orquestador General (Owner: Blog-Orchestrator)
- **Objetivo**: priorizar, desglosar tareas y coordinar a los agentes humanos/IA.
- **Rutina**:
  1. Ejecutar el `Cuestionario de Configuración` (`orchestrator/CONFIG_QUESTIONNAIRE.md`).
  2. Definir Roca semanal y registrar decisiones en `REGISTRO.md` o nota de sesión.
  3. Asignar tareas, solicitar aprobaciones y mantener visibilidad de métricas.
- **Entregables clave**: roadmap a 7 días, backlog priorizado, resumen de decisiones.
- **Preguntas críticas**: objetivos de negocio, audiencia, cadencia, stack técnico, métricas, riesgos.
- **Documentación complementaria**: `claude/README.md` (gestión de subagentes, hooks y MCPs) y `codex_agents/README.md` (handoff a agentes técnicos).

## Estrategia & Investigación (Owners: Strategy-Agent + ICP-Agent)
- **Procesos (MVP)**: definición de propuesta de valor, pilares editoriales, ICP base.
- **Procesos (Growth)**: investigación cuantitativa (GA4/GSC/CRM), entrevistas cualitativas, Jobs-to-be-Done.
- **Subagentes sugeridos**: `avatar-researcher`, `market-landscape-analyst`, `keyword-discovery`.
- **Herramientas**: GA4, GSC, User interviews (Typeform/Tally), Sheets/Notion, Python+pandas.
- **Playbooks**: `playbooks/ICP_RESEARCH.md`, `docs/processes/pilares_editoriales.md` (crear a partir de plantilla).

## Contenido & Editorial (Owners: Content-Strategist, Copy-Lead, Editor)
- **Procesos (MVP)**: calendario editorial, briefs, redacción, edición, publicación básica.
- **Procesos (Growth)**: clusterización pillar/cluster, interlinking, optimización voice & tone, localización.
- **Subagentes**: `brief-generator`, `fact-checker`, `cta-designer`, `internal-link-auditor`.
- **Herramientas**: Google Docs/Notion, Grammarly/Languagetool, Descript (audio/video), IA de apoyo Copy.
- **Playbooks**: `playbooks/CONTENT_PRODUCTION.md`, checklist QA editorial.

## SEO & Crecimiento Orgánico (Owner: SEO-Agent)
- **Procesos (MVP)**: keyword research, auditoría básica on-page, sitemap/indexación.
- **Procesos (Growth)**: canibalización, E-E-A-T, schema, link building, Core Web Vitals.
- **Subagentes**: `technical-seo`, `content-gap-analyst`, `schema-designer`, `link-prospector`.
- **Herramientas**: GA4, GSC, Screaming Frog, Ahrefs/Semrush, NeuronWriter/Surfer, PageSpeed Insights, SEOcrawl.
- **Playbook**: `playbooks/SEO_AUDIT.md` (genérico) y `docs/processes/seo_growth_loop.md`.
- **Integraciones**: documentar accesos y límites en `claude/reference/MCP_GUIDE.md` y `docs/processes/tooling_overview.md`.

## Diseño, UX & Accesibilidad (Owner: UX-Agent)
- **Procesos (MVP)**: patrones de bloques, layout responsive, guidelines de marca.
- **Procesos (Growth)**: pruebas de usabilidad, optimización conversiones, diseño de componentes reutilizables.
- **Subagentes**: `pattern-library-maintainer`, `accessibility-auditor`, `brand-guardian`.
- **Herramientas**: Figma, Gutenberg Patterns, Wave, Stark, Hotjar (opcional).

## Desarrollo & Operaciones (Owner: Ops-Agent)
- **Procesos (MVP)**: entornos (local/staging/prod), backups, actualizaciones críticas.
- **Procesos (Growth)**: pipelines CI/CD, infraestructura (CDN, cache), monitorización uptime.
- **Subagentes**: `wp-cli-operator`, `release-manager`, `security-observer`, `rest-api-integrator`.
- **Herramientas**: WP-CLI, Git, SSH, Docker/LocalWP, Cloudflare, Uptrends.
- **Documentación**: `docs/processes/ops_playbook.md`, `docs/checklists/qa_tecnico.md`.

## Automatización & Integraciones (Owner: Automations-Agent)
- **Procesos (MVP)**: integraciones REST/GraphQL básicas, formularios a CRM, webhooks.
- **Procesos (Growth)**: automatizaciones n8n/Make/Zapier, sincronización con newsletters, segmentación dinámica.
- **Subagentes**: `form-webhook-builder`, `crm-sync`, `rest-api-connector`, `data-pipeline-keeper`.
- **Herramientas**: WordPress REST API personalizada, FluentCRM/Mailerlite, Make, Zapier, Supabase/Airtable.
- **Hooks & comandos**: registrar scripts en `claude/reference/HOOKS_COMMANDS.md` y mantener inventario en `docs/processes/tooling_overview.md`.

## Analítica & Monetización (Owner: Analytics-Agent)
- **Procesos (MVP)**: setup GA4+GSC, dashboard tráfico básico, seguimiento de leads/conversiones.
- **Procesos (Growth)**: cohortes, atribución, testing A/B, revenue tracking, pricing experiments.
- **Subagentes**: `metrics-analyst`, `experiment-designer`, `dashboard-curator`.
- **Herramientas**: GA4, Looker Studio, Metabase, Sheets, Stripe/Thrivecart, Plausible (alternativa).
- **Playbook**: `playbooks/ANALYTICS_REPORTING.md`, `docs/processes/monetizacion.md`.

## Comunidad & Partnerships (Owner: Community-Agent)
- **Procesos (MVP)**: gestión de comentarios, social listening, cross-posting.
- **Procesos (Growth)**: acuerdos con partners, embajadores, co-marketing, foros privados.
- **Subagentes**: `engagement-manager`, `feedback-curator`, `partnership-hunter`.
- **Herramientas**: Circle/Skool/Discord, Buffer, Typeform feedback, Notion CRM.

## Compliance & QA (Owner: Compliance-QA-Agent)
- **Procesos (MVP)**: legales (cookies, privacidad, disclaimers), QA editorial/técnico.
- **Procesos (Growth)**: auditorías periódicas RGPD, accesibilidad WCAG, control de versiones legales.
- **Subagentes**: `legal-checker`, `privacy-monitor`, `qa-editorial`, `broken-link-inspector`.
- **Herramientas**: iubenda/Termly, Axe, Screaming Frog (broken links), Checkbot.
- **Checklists**: `docs/checklists/qa_editorial.md`, `docs/checklists/pre_publicacion.md`.

## Integraciones MCP recomendadas
- **WordPress REST MCP**: CRUD posts/páginas, media, taxonomías; requiere usuario específico y Application Password.
- **WP-CLI MCP**: tareas administrativas controladas (cache flush, option get, export DB).
- **SEO/Content MCP**: NeuronWriter, Ahrefs/Semrush (si hay API), PageSpeed.
- **Analytics MCP**: GA4 (service account), Search Console, Supabase para Data Spine.

## Documentación viva
- `docs/processes/` guarda los procesos y subprocesos por área (descubrimiento, producción, mantenimiento, crecimiento).
- `docs/checklists/` centraliza QA editorial/técnico y compliance.
- `playbooks/` ofrece instrucciones tácticas para agentes o subagentes.
- `claude/` y `codex_agents/` (añadir cuando instancies): alojan prompts específicos.

Mantén el blueprint actualizado con aprendizajes y archiva procesos que ya no apliquen para nuevos proyectos.
