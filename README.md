# Blueprint Blog WordPress

Este blueprint recopila la arquitectura mínima para lanzar y operar cualquier blog WordPress con agentes (Codex + Claude) y procesos estandarizados. Copia la carpeta, renómbrala con el nombre de tu proyecto y personaliza los archivos siguiendo el cuestionario del orquestador.

## Cómo usarlo
1. Copia `proyectos/blog-wordpress-blueprint/` y renombra la carpeta (ej. `proyectos/blog-finanzas`).
2. Actualiza el logbook de sesión y crea una spec propia antes de implementar cambios estructurales.
3. Ejecuta el cuestionario del orquestador para configurar objetivos, audiencias, stack y accesos.
4. Personaliza los playbooks y documentos de procesos; añade enlaces a tus herramientas y datos.
5. Configura la REST API del sitio WordPress destino y documenta credenciales fuera del repositorio.
6. Activa los agentes necesarios según la madurez de tu blog (MVP, Growth, Scale).

-## Contenido principal
- `AGENTS.md`: roles, subagentes y herramientas por disciplina.
- `orchestrator/CONFIG_QUESTIONNAIRE.md`: preguntas para la puesta en marcha.
- `REGISTRO.md`, `docs/PENDING.md`, `docs/logbook/`: seguimiento operativo.
- `docs/processes/`: blueprint de procesos y subprocesos.
- `docs/estrategia/`: plantillas de estrategia (ICP, backlog SEO, reportes, experimentos).
- `docs/checklists/`: QA editorial, técnico y monetización.
- `docs/decisions/`: registro de decisiones con índice.
- `playbooks/`: guías operativas (SEO, contenido, ICP, ops, analítica, monetización).
- `claude/`: documentación para subagentes, hooks, comandos y MCPs (NeuronWriter, WordPress REST, etc.).
- `codex_agents/`: plantillas para agentes Codex especializados.
- `tools/` (opcional): agrega tus integraciones o scripts específicos.

## Principios
- **Control**: inventarios actualizados, métricas claras, decisiones registradas.
- **Inteligencia**: insights accionables de datos, experimentos definidos antes de ejecutar.
- **Automatización**: delega en agentes y scripts lo repetible, mantén revisión humana en puntos críticos.

Mantén este blueprint libre de credenciales o datos personales. Usa `.env` locales o secretos en gestores externos.
