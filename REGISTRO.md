# Registro del Proyecto

Usa este documento como índice de decisiones, entregables y estado general.

## Contexto
- Proyecto: paginadeinicio.net — hub "Series sin Paja" + guías tech
- Owner responsable: Blog-Orchestrator (Tamagochi)
- Fecha de última actualización: 2025-09-30

## Resumen ejecutivo
- Objetivo actual: Consolidar el posicionamiento "Series sin paja" y lanzar la línea de guías tech monetizadas con afiliación VPN + Amazon.
- Métricas clave: tráfico orgánico ~1K/mes (estimado), ingresos €0-50/mes, 85 posts activos tras cleanup, meta 15-20 posts premium a corto plazo.
- Riesgos abiertos: automatizaciones aún en transición a Pabbly, falta de datos frescos de analytics (no hay histórico completo cargado), dependencia de WP REST con hosting restrictivo.

## Decisiones relevantes
| Fecha | Decisión | Impacto | Owner | Documentación |
| --- | --- | --- | --- | --- |
| 2025-09-29 | Pivot a "Series sin Paja + Tech Guides" | Define enfoque editorial y tono | Blog-Orchestrator | docs/ESTADO_ACTUAL_PROYECTO.md |
| 2025-09-29 | Priorizar monetización VPN sobre Amazon puro | Mejora margen esperado (x12) | Monetización-Agent | docs/ESTADO_ACTUAL_PROYECTO.md |
| 2025-09-30 | Consolidar blueprint con Pabbly Connect | Reduce fricción y actualiza stack | Automations-Agent | automatizaciones/pabbly-connect-workflows.md |

## Entregables principales
- [x] Informe de cleanup y acciones ejecutadas (`docs/ACCIONES_EJECUTADAS_SESION.md`)
- [x] Blueprint de automatizaciones (N8N + Pabbly) (`automatizaciones/README.md`)
- [ ] Plantilla de dashboard Looker Studio documentada en `analytics/`
- [ ] Librería de patrones de contenido actualizada (`contenido/series-sin-paja/`)

## Próximos hitos
- [ ] Completar eliminación/redirect del contenido de actualidad restante (Semana 40)
- [ ] Configurar programas ExpressVPN y NordVPN + documentar en `docs/processes/monetizacion.md`
- [ ] Publicar 3 guías "series sin paja" siguiendo el nuevo pipeline (Mes 10)
- [ ] Subir datasets GA4/GSC de los últimos 12 meses a `inputs/`

Actualiza este registro al inicio y cierre de cada sprint o cuando se tomen decisiones relevantes.
