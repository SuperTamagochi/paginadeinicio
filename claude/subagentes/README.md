# Subagentes — Blueprint Blog WordPress

Define tus subagentes en `.claude/agents/` siguiendo esta convención:

```
blog-<slug>-<disciplina>-<especialidad>.md
```

## Roles sugeridos
- `project-*-orchestrator`: coordina el proyecto completo.
- `seo-analyzer`: auditorías y backlog SEO.
- `content-strategist`: briefs, storytelling, cadencia editorial.
- `technical-implementer`: integraciones REST/WP-CLI y despliegues.
- `automation-designer`: formularios, CRM, webhooks.
- `analytics-observer`: dashboards, métricas y experimentos.
- `compliance-guardian`: legales, accesibilidad y QA cruzado.

## Plantilla base YAML
```yaml
name: blog-<slug>-seo-analyzer
role: "Especialista SEO del blog <nombre>"
goals:
  - "Auditar rendimiento orgánico y detectar quick wins"
  - "Documentar backlog SEO priorizado"
tools:
  - name: "WordPress REST MCP"
  - name: "SEOcrawl API"
knowledge:
  - "docs/processes/seo_growth_loop.md"
  - "playbooks/SEO_AUDIT.md"
```

## Hooks personalizados
Si necesitas funciones específicas (por ejemplo, consultar una API propia), documenta la interfaz en `reference/HOOKS_COMMANDS.md` y referencia ese archivo desde el subagente.

## Buenas prácticas
- Usa prompts breves pero con contexto (objetivos, constraints, Definition of Done).
- Declara las fuentes y datos disponibles.
- Mantén el inventario de subagentes en `AGENTS.md` para que el equipo humano los conozca.
