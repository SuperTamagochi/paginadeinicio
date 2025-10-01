# Página de Inicio - Blog de Cine y Series

Blog especializado en **ocio digital** con enfoque en **cine y series**. Sistema automatizado con agentes IA para generar contenido de calidad, optimizar SEO y gestionar operaciones con mínima intervención manual.

## 🎬 Concepto Principal: "Series sin Paja"
Guías curadas de episodios esenciales para ver series largas (Expediente X, CSI, House) **sin relleno**, manteniendo la narrativa principal y momentos clave.

## 🚀 Configuración Actual
- **Nicho**: Cine y series (con enfoque en contenido curado)
- **Objetivo**: Automatización máxima con agentes IA
- **Tiempo dedicación**: 4 horas/día (cuando sea necesario)
- **Monetización**: Afiliación Amazon + Ads (cuando crezca el tráfico)
- **Automatización**: N8N + Pabbly Connect (3000 tareas/mes Lifetime Deal)

## 🎯 Estrategia de Contenido
1. **Series sin Paja**: Guías de episodios esenciales
2. **Reviews técnicos**: Calidad cinematográfica y narrativa
3. **Listas curadas**: Por género, actor, director, temática
4. **Análisis profundos**: Sin spoilers pero con sustancia

## 🗂️ Contenido principal
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

### 🧭 Guía rápida por directorios
- `analisis/`: evaluaciones del sitio y del mercado.
- `analytics/`: datos crudos y resultados de dashboards (ver `analytics/README.md`).
- `automatizaciones/`: workflows de N8N y Pabbly Connect.
- `contenido/`: borradores listos para publicar y guías de estilo.
- `documentacion/`: repositorio histórico/legacy (ver README en carpeta).
- `experimentos/`: pruebas controladas y ensayos (ver README en carpeta).
- `inputs/`: datasets descargados (GA4, GSC, SEO tools).
- `organizacion/`, `sistema/`: playbooks de coordinación ejecutiva.
- `wordpress-theme/`: espacio reservado para overrides del tema.

## 🤖 Sistema de Automatización

### Agentes Principales
- **Content-Agent**: Research + escritura de guías "sin paja"
- **SEO-Agent**: Optimización keywords y posicionamiento
- **Analytics-Agent**: Reportes semanales automatizados
- **Affiliate-Agent**: Gestión enlaces Amazon + revenue optimization

### Workflows Pabbly Connect
- **Content Pipeline**: Google Form → Research → WordPress → Social Media
- **Analytics Reports**: GA4 + GSC → Weekly insights → Dashboard
- **Affiliate Optimization**: Daily check + link maintenance
- **Social Distribution**: Auto-posting optimizado por plataforma

### Herramientas Integradas
- **WordPress REST API**: Publicación automatizada
- **Google Analytics 4**: Métricas de performance
- **Google Search Console**: SEO insights
- **Amazon Associates**: Monetización por afiliación
- **IMDB Data**: Research automatizado de series

## 📈 Objetivos Medibles

### Mes 1-3: Foundation
- ✅ 1 post "Series sin Paja" por semana
- 🎯 500 visitas orgánicas/mes
- 🎯 3% CTR en Amazon affiliate links
- 🎯 80% automatización en content pipeline

### Mes 4-6: Growth
- 🎯 2-3 posts por semana (mix contenidos)
- 🎯 2,000 visitas orgánicas/mes
- 🎯 €50/mes en ingresos Amazon
- 🎯 Top 3 posiciones para "series sin paja [nombre serie]"

### Mes 7-12: Scale
- 🎯 5,000 visitas orgánicas/mes
- 🎯 €200/mes ingresos totales (Amazon + Ads)
- 🎯 50+ guías series completadas
- 🎯 Autosuficiencia: hosting + dominio cubiertos

## 🗂️ Próximos Pasos Inmediatos

1. **Sube datos analytics** a `/inputs/` para análisis inicial
2. **Configura Pabbly Connect** siguiendo `/automatizaciones/pabbly-connect-workflows.md`
3. **Crea primer post** usando borrador Expediente X como base
4. **Setup WordPress API** para automatización
5. **Configura tracking** GA4 + GSC + Amazon Associates

Mantén este proyecto libre de credenciales. Usa variables de entorno y gestores de secretos externos.
