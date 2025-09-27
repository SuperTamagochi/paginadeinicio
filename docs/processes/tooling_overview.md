# Inventario de Herramientas y MCPs

Usa este documento para mapear las herramientas disponibles en tu proyecto y su nivel de integración.

## Tabla resumen

| Área | Herramienta | Uso principal | Integración (Manual / Script / MCP) | Owner | Notas |
| --- | --- | --- | --- | --- | --- |
| SEO | NeuronWriter | Brief semántico, scoring | MCP / API | | Necesita `NEURON_API_KEY` |
| Automatización | WordPress REST | CRUD posts/páginas | MCP | | Ver `docs/processes/rest_api_setup.md` |
| Automatización | WP-CLI | Operaciones administrativas | MCP / SSH | | Limitar a comandos seguros |
| Analítica | GA4 | Métricas comportamiento | API / Export manual | | Service Account opcional |
| Analítica | GSC | Queries, CTR, posiciones | API / Export | | |
| Monetización | Stripe / Thrivecart | Revenue tracking | API / Export | | |

## Hooks & scripts
- Documenta scripts en `scripts/` y enlaza en `claude/reference/HOOKS_COMMANDS.md`.
- Define owners y frecuencia de mantenimiento.

## Checkpoints
- [ ] Credenciales guardadas en gestor seguro.
- [ ] Documentación actualizada tras cada integración nueva.
- [ ] Pruebas automáticas o manuales definidas.
- [ ] Plan de contingencia para cada herramienta crítica.
