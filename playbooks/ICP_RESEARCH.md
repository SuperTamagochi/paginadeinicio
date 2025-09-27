# Playbook Investigación Cliente Ideal (ICP)

## Objetivo
Definir y validar el perfil del cliente ideal del blog para alinear contenido, ofertas y automatizaciones.

## Fases
1. **Preparación**
   - Reunir briefing, métricas actuales y objetivos de negocio.
   - Inventariar fuentes de datos disponibles (Analytics, CRM, encuestas, entrevistas).
   - Crear carpeta de trabajo `tmp/icp_YYYYMMDD/`.
2. **Análisis cuantitativo**
   - GA4: tráfico por contenido, eventos de conversión, cohortes.
   - GSC: queries por intención y país.
   - CRM/newsletter: tags, segmentos, tasas de apertura/click, LTV.
   - Ventas/ingresos: productos más vendidos, margen.
3. **Análisis cualitativo**
   - Comentarios y soporte (tickets, emails, redes).
   - Entrevistas o encuestas (Jobs-to-be-Done, StoryBrand, 5 why's).
   - Análisis competencia/comunidades (foros, grupos, reviews).
4. **Segmentación & scoring**
   - Definir 2-3 arquetipos con atributos demográficos, objetivos, pains, objeciones, triggers.
   - Scoring simple (Pain, Urgency, Budget, Fit) escala 1-5.
5. **Selección de ICP**
   - Elegir avatar principal + secundarios.
   - Documentar promesa de valor, propuesta única, riesgos.
6. **Plan de validación**
   - Formular hipótesis (ej. “Avatar A convierte al 3% en lead magnet X”).
   - Diseñar experimentos (contenido, lead magnet, oferta, entrevista) con responsables y fechas.
   - Definir métricas de éxito y criterios de decisión.

## Entregables
- Documento principal (`docs/estrategia/icp_<proyecto>.md`).
- Matriz comparativa de avatares (tabla).
- Plan de validación con tareas y owners.
- Registro en logbook y backlog actualizado.

## Herramientas
- GA4, GSC, CRM/ESP.
- Airtable/Sheets/Notion.
- Herramientas de survey (Typeform, Tally).
- Python+pandas/jupyter para análisis avanzado.
- Figma/Miro para mapear journeys.

## Frecuencia
- Revisión ligera: trimestral.
- Revisión profunda: al lanzar nuevas ofertas o detectar cambios significativos.

Usa el rol de abogado del diablo: cuestiona supuestos, valida con datos y documenta riesgos.
