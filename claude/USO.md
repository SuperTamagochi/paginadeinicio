# Guía de uso — Claude (Blueprint Blog WordPress)

1. Abre Claude Code en la raíz del proyecto instanciado.
2. Ejecuta `/agents` para confirmar que los subagentes del blog están disponibles (ver `.claude/agents/`).
3. Si no hay briefing activo, genera uno nuevo con la plantilla correspondiente en `claude/briefings/`.
4. Activa el orquestador (`project-<slug>-orchestrator`) para recopilar contexto y asignar tareas.
5. Selecciona subagentes especializados según la necesidad (SEO, contenido, automatización, analítica, monetización).
6. Registra cada sesión en `claude/logs/AAAAMMDD_tarea.md` (resumen, decisiones, bloqueos, próximos pasos).
7. Si una tarea requiere Codex u otro agente, documenta el handoff en `claude/TODO-CODEX.md` y notifica al orquestador.
8. Antes de cerrar, sincroniza pendientes con el logbook (`docs/logbook/`) y actualiza métricas si aplica.

> Recuerda aplicar abogado del diablo: cuestiona supuestos, identifica riesgos y propone mitigaciones.
