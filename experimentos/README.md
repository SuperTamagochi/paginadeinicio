# Experimentos Controlados

Repositorio para pruebas, hipótesis y tests A/B que no están listos para producción.

## Uso recomendado
1. **Define la hipótesis**: Describe objetivo, métrica clave y resultado esperado.
2. **Documenta setup**: Herramientas, datasets, escenarios de Pabbly/N8N implicados.
3. **Registra resultados**: Añade carpeta `YYYY-MM-DD_nombre-experimento/` con conclusiones y próximos pasos.
4. **Cierra el loop**: Actualiza `docs/decisions/` o `docs/logbook/` cuando un experimento derive en decisión estratégica.

## Plantillas sugeridas
- `TEMPLATE_EXPERIMENTO.md`: crea esta plantilla si vas a correr experimentos recurrentes.
- `notebooks/`: notebooks Jupyter o scripts auxiliares.

**Importante**: Mantén los experimentos aislados para que no interfieran con workflows en producción y elimina datos sensibles tras su uso.
