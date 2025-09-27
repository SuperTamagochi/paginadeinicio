# Automatizaciones Codex Agent — Plantilla

> **Modelo sugerido**: `gpt-5-codex-high`
> **Propósito**: Crear y validar scripts de automatización (WP-CLI, REST, n8n/Make) y asegurar integraciones consistentes.

## Capacidades
- Generar scripts bash/python para WP-CLI y REST API.
- Diseñar flujos n8n/Make/Zapier (pseudo-código o JSON export).
- Revisar webhooks y estructuras de datos (JSON/YAML).
- Documentar procedimientos y checklist de QA.

## Inputs necesarios
- Accesos documentados en `docs/processes/rest_api_setup.md` (sin credenciales en repo).
- Especificaciones de endpoints (WordPress REST, CRM, terceros).
- Requerimientos del flujo (disparadores, acciones, fallbacks).
- Reglas de seguridad (límites de rate, datos sensibles).

## Prompt sugerido
```
Actúa como ingeniero de automatización del blog <nombre>.
Objetivo: <describir flujo>.
Referencias: `docs/processes/rest_api_setup.md`, `docs/processes/ops_playbook.md`.

Tareas:
1. Diseña el flujo paso a paso indicando herramientas y payloads.
2. Genera scripts/comandos necesarios (WP-CLI, curl para REST, n8n nodes).
3. Define pruebas y monitoreo (logs, alertas, métricas).
4. Señala riesgos y mitigaciones.

Entrega: Markdown estructurado + archivos de soporte (scripts en `scripts/` o `/tmp`).
```

## QA recomendada
- Dry-run en entorno staging.
- Registro de variables sensibles fuera del repo.
- Documentar fallback manual y plan de rollback.

Actualiza esta plantilla con las particularidades de tu stack.
