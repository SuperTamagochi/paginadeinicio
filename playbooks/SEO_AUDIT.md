# Playbook Auditoría SEO (Genérico)

## Objetivo
Evaluar el estado actual del blog WordPress y priorizar acciones 80/20 que impulsen tráfico cualificado y conversiones.

## Entradas básicas (MVP)
- Google Search Console (consultas y páginas 28/90 días).
- Google Analytics 4 (engagement por URL, conversiones).
- Sitemap y estructura de contenidos actual.
- Inventario de contenidos por pilar.

## Entradas Growth/Scale
- Crawls técnicos (Screaming Frog, Sitebulb, SEOcrawl).
- Herramientas de keyword research (Ahrefs, Semrush, Ubersuggest, Keyword Chef).
- Datos de Core Web Vitals (PageSpeed, CrUX, WebPageTest).
- Backlinks y menciones (Ahrefs, Majestic).
- Revisión E-E-A-T (autores, referencias, autoridad). 

## Flujo sugerido
1. **Preparación**
   - Validar acceso a GSC/GA4 y últimos exports.
   - Crear carpeta temporal `tmp/seo_audit_YYYYMMDD/`.
   - Revisar pilares editoriales y objetivos de negocio.
2. **Estado técnico**
   - Indexación/cobertura, sitemap, canonicals.
   - Rendimiento (LCP, INP, CLS) top URLs.
   - Seguridad (HTTPS, mixed content, 404/redirects).
   - Plugins/tema: revisar versiones y compatibilidad.
3. **Contenido**
   - Clasificar URLs (pilar, satélite, apoyo, legacy).
   - Detectar canibalizaciones (mesmas keywords) y thin content.
   - Identificar quick wins (impresiones altas, CTR bajo).
   - Analizar intención de búsqueda vs contenido entregado.
4. **Autoridad**
   - Perfil de enlaces, enlaces internos, anchor text.
   - Oportunidades de partnerships/guest posts.
   - Señales E-E-A-T (autores, credenciales, política editorial).
5. **Backlog & Roadmap**
   - Matriz impacto/esfuerzo.
   - Acciones agrupadas por sprint (Técnico, Contenido, Autoridad).
   - Dependencias y owners.
6. **Reporte**
   - Resumen ejecutivo (máx. 1 página + tablas anexas).
   - Lista priorizada (top 5 quick wins / top 5 proyectos).
   - Métricas baseline (sesiones, CTR, conversion rate, revenue).

## Deliverables
- `docs/estrategia/seo_backlog.md` (crea/actualiza al instanciar).
- Tablas CSV/MD con canibalizaciones, quick wins, acciones técnicas.
- Registro en `claude/logs/` y logbook de sesión.

## Herramientas recomendadas
- Screaming Frog / Sitebulb / SEOcrawl.
- Ahrefs / Semrush / Ubersuggest.
- NeuronWriter / Surfer (optimización semántica).
- PageSpeed Insights API, Chrome UX Report.
- Google Trends, AnswerThePublic, AlsoAsked.

## Frecuencia sugerida
- Auditoría completa: trimestral (Growth), semestral (MVP).
- Revisiones ligeras: mensuales (top URLs, métricas clave).

Documenta siempre fuentes y fecha de los datos usados.
