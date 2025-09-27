# Arquitectura Claude — Blueprint Blog WordPress

Esta carpeta agrupa la documentación y assets mínimos para operar el proyecto con Claude Code.

## Componentes
- `USO.md`: guía rápida para iniciar sesiones Claude con este proyecto.
- `subagentes/`: documentación y plantillas para definir subagentes (`.claude/agents/`).
- `briefings/`: plantillas de briefing para delegar tareas (ej. auditorías SEO, investigación ICP).
- `logs/`: registra resultados y decisiones de cada sesión (un archivo por fecha).
- `reference/`: apuntes, prompts y manuales que quieras conservar para el equipo.
- `TODO-CODEX.md`: lista de tareas que deben pasar a agentes Codex.

## Hooks y comandos
- Define tus subagentes en `.claude/agents/*.md` usando los ejemplos del README de `subagentes/`.
- Documenta funciones/herramientas personalizadas (hooks de API, CLI, MCP) en `reference/HOOKS_COMMANDS.md`.
- Registra cualquier comando peligroso/limitado para revisión humana.

## Integración con MCPs
- Claude puede invocar MCPs (WordPress REST, WP-CLI, PageSpeed, NeuronWriter, etc.).
- Documenta endpoints, credenciales (fuera del repo) y procedimientos en `reference/MCP_GUIDE.md`.
- Mantén una checklist para habilitar nuevos MCPs y enlázala en `docs/processes/rest_api_setup.md`.

## Rutina sugerida
1. Revisa el briefing activo y el último log.
2. Lanza el orquestador (`project-*-orchestrator`) para alinear tareas.
3. Activa subagentes específicos según la disciplina.
4. Documenta resultados en `logs/` y comunica hallazgos al orquestador Codex.
5. Actualiza backlog y tareas en `TODO-CODEX.md` o herramientas externas.

Mantén esta documentación genérica y agrega detalles propios del blog cuando lo instancies.
