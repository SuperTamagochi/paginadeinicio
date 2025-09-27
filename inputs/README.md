# Inputs - Datos para Análisis y Estrategia

Esta carpeta centraliza todos los datos externos que alimentan nuestros agentes y procesos de decisión.

## Estructura

### 📊 `/analytics/`
- Reportes de Google Analytics 4
- Datos de comportamiento de usuarios
- Métricas de conversión y engagement
- Análisis de audiencia y demografía

**Formatos aceptados**: CSV, PDF, JSON
**Frecuencia**: Semanal/Mensual

### 🔍 `/search-console/`
- Datos de Google Search Console
- Performance de búsquedas orgánicas
- Queries, CTR, posiciones promedio
- Datos de indexación y errores

**Formatos aceptados**: CSV, Excel
**Frecuencia**: Semanal

### 🛠️ `/seo-tools/`
- Reportes de SEO Crawl
- Datos de Ubersuggest (si aplica)
- Auditorías técnicas
- Análisis de competencia
- Datos de herramientas adicionales

**Formatos aceptados**: CSV, PDF, Excel
**Frecuencia**: Mensual o según necesidad

## Uso con Agentes

Los agentes utilizarán estos datos para:

1. **Strategy-Agent**: Definir ICP y nichos rentables
2. **SEO-Agent**: Identificar oportunidades de keywords
3. **Content-Agent**: Entender qué contenido funciona mejor
4. **Analytics-Agent**: Crear dashboards y reportes automatizados

## Instrucciones para Subir Datos

1. **Nombrado de archivos**: `YYYY-MM-DD_tipo_fuente.extensión`
   - Ejemplo: `2024-09-28_audience_ga4.csv`
   - Ejemplo: `2024-09-28_queries_gsc.csv`

2. **No incluir datos sensibles**: Sin tokens, APIs keys, o información personal

3. **Documentar contexto**: Añadir nota en `/docs/logbook/` explicando qué datos subes y por qué

## Próximos Pasos

Sube aquí tus reportes históricos de:
- [ ] GA4: Audience Overview (últimos 12 meses)
- [ ] GSC: Search Performance (últimos 12 meses)
- [ ] SEO Crawl: Último reporte técnico
- [ ] Cualquier dato adicional de herramientas SEO

Los agentes analizarán estos datos para personalizar la estrategia del blog hacia **cine y series**.