# Make Connect Workflows - Blog Cine y Series

Plan para aprovechar el plan "Connect" de Make (3000 operaciones/mes) como capa de automatización ligera junto a N8N y los agentes IA.

## 🧱 Arquitectura
- **N8N**: scraping, transformaciones pesadas, jobs que requieren lógica compleja.
- **Make**: orquestación low-code, distribución y sincronización de datos.
- **Agentes IA**: generan briefs, analizan datos, validan calidad.

### Convenciones
- **Folders**: `Series sin Paja`, `Reporting`, `Mantenimiento`.
- **Naming**: `SSP - <proceso>` para escenarios activos.
- **Variables**: usa `Variables > Secrets` para credenciales sensibles.

## 🔄 Escenario 1 · SSP - Content Pipeline (Webhook → WordPress)

| Módulo | Configuración clave | Operaciones estimadas |
| --- | --- | --- |
| Webhook (Custom) | URL: `hook.make.com/<uuid>` | 1 |
| Tools · JSON Parse | Convertir payload del agente | 1 |
| HTTP > OpenAI/Claude | Refinar copy final con prompt base | 1 |
| WordPress > Create/Update Post | Estado `draft`, categorías recibidas | 1 |
| Google Drive > Upload File (opcional) | Guardar backup del markdown | 1 |
| Gmail/Slack > Notification | Avisar al editor | 1 |

**Total**: 5-6 operaciones por post.

**Payload esperado**:
```json
{
  "title": "Expediente X sin relleno",
  "slug": "expediente-x-sin-relleno",
  "content": "...",
  "excerpt": "...",
  "series": "Expediente X",
  "categories": ["Series sin paja"],
  "tags": ["expediente x", "guia"]
}
```

**Notas**:
- Usa `Router` para bifurcar contenido Series/Tech.
- Añade módulo `WordPress > Upload media` si llega `featured_image_url`.
- En `WordPress Post` habilita `Draft` y `Sticky` según flags.

## 📊 Escenario 2 · Reporting Semanal

1. **Scheduler**: Mondays 09:00 Europe/Madrid.
2. **GA4** (via HTTP): Report `runReport` con métricas sesiones, usuarios, engagement.
3. **GSC** (HTTP): Métricas clicks, impresiones, CTR, posición.
4. **Tools > Iterator**: Normalizar resultados.
5. **Google Sheets**: Actualizar pestaña `Weekly_Overview` (`Update row` por rango).
6. **Data Store**: Guardar snapshot JSON (para comparativas).
7. **Slack**: Enviar resumen con delta vs semana previa.

**Control de cuota**: ~20 operaciones (semanal → 80/mes).

**Alertas**:
- Añade `Router` con condiciones (`CTR < 2%`, `Clicks -20%`).
- Notifica a canal `#alertas-ss` cuando ocurra.

## 🧲 Escenario 3 · Afiliados Amazon + VPN

| Paso | Acción | Detalle |
| --- | --- | --- |
| 1 | Scheduler diario | 08:30 Europe/Madrid |
| 2 | HTTP Amazon PA-API | Consulta precios ASIN relevantes |
| 3 | Tools > Set Variable | Calcular variación vs `Data Store` |
| 4 | Data Store | Guardar última tarifa |
| 5 | WordPress > Update Post Meta | Actualizar CTA / botones |
| 6 | Slack | Avisar si variación > ±10% |

Para programas VPN utiliza módulo HTTP con sus APIs (ExpressVPN, NordVPN). Centraliza credenciales en `Variables`.

## 📣 Escenario 4 · Distribución Social

- **Trigger**: `WordPress > Watch Posts` (status `publish`).
- **Formatter**: Crear copy para X/LinkedIn/Email.
- **Buffer/Hootsuite**: Programar publicación (usar `Router` por red).
- **Notion/Sheets**: Registrar URL y fecha.
- **Delay**: 2 h antes de publicar en redes secundarias.

Incluye módulo `Facebook Pages` sólo si se mantiene actividad; de lo contrario dejar desactivado para ahorrar operaciones.

## 🧼 Escenario 5 · Higiene de datos

- **Scheduler**: Domingos 22:00.
- **WordPress > List Posts**: Filtrar `draft` >30 días.
- **Tools > Array aggregator**: Generar reporte de pendientes.
- **Gmail/Slack**: Enviar resumen a editor.
- **Opcional**: `Make > Email > Create draft` en Gmail con recordatorio.

## ⚙️ Buenas prácticas

- Activa `Auto commit` y versionado de escenarios críticos.
- Configura `Error handler` → `Resume` + Slack DM para módulos HTTP.
- Mantén documentación viva en `/docs/processes/contenido_pipeline.md` y actualiza tras cada cambio.
- Exporta los escenarios `json` y súbelos a `/automatizaciones/exports/` tras cada iteración relevante.

## ✅ Checklist post-configuración
- [ ] Hooks documentados en `claude/reference/HOOKS_COMMANDS.md`.
- [ ] Variables sensibles dadas de alta en Make (`Settings > Connections`).
- [ ] QA de cada escenario con datos de prueba (`Run once`).
- [ ] Escenarios críticos con modo `Auto` habilitado.
- [ ] Métricas de uso (Operations) revisadas semanalmente para no exceder 3000.

## 🔁 Hand-off
- Si un escenario supera 150 operaciones/ejecución migrarlo a N8N.
- Registrar en `docs/logbook/` cualquier incidencia y resolución.
- Añadir cambios estratégicos al `REGISTRO.md` y `docs/decisions/`.

---
*Make Connect cubre las tareas repetitivas; N8N gestiona las partes que requieren lógica personalizada.*
