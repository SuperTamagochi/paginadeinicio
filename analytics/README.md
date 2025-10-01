# Analytics Workspace

Espacio operativo para la automatización y análisis cuantitativo del blog.

## Estructura
- `inputs/`: volcados crudos importados desde GA4, GSC u otras herramientas. Mantén formato `YYYY-MM-DD_origen_tipo.ext`.
- `outputs/` (crea según necesidad): reportes transformados por agentes o dashboards exportados.
- `notebooks/` (opcional): scripts o cuadernos usados para análisis puntuales.

## Buenas prácticas
- No almacenes credenciales ni tokens; usa el gestor seguro documentado en `docs/processes/tooling_overview.md`.
- Después de subir datos nuevos registra el contexto en `docs/logbook/` y enlaza el archivo correspondiente.
- Depura archivos antiguos (>90 días) moviéndolos a un archivo comprimido o eliminándolos si ya están versionados.

## Próximos pasos sugeridos
- Crear plantilla de dashboard en Looker Studio y documentar aquí la URL.
- Sincronizar este repositorio con los escenarios de Pabbly/N8N que generan reportes automáticos.
- Añadir scripts de validación (por ejemplo, `python analytics/scripts/validate_ga4.py`) cuando se incorporen procesos recurrentes.
