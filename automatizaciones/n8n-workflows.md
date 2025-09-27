# N8N Workflows - Blog Cine y Series

Configuraciones específicas para workflows N8N que automatizarán la investigación, creación y distribución de contenido.

## 🎬 Workflow 1: Series Research Automation

### Propósito
Automatizar la investigación inicial de series para posts "Sin Paja"

### Trigger
- **Tipo**: Webhook
- **URL**: `https://tu-n8n-server.com/webhook/series-research`
- **Método**: POST
- **Data esperada**: `{"series_name": "Expediente X", "imdb_id": "tt0106179"}`

### Nodos del Workflow

#### 1. Webhook Input
```json
{
  "series_name": "{{ $json.series_name }}",
  "imdb_id": "{{ $json.imdb_id }}",
  "timestamp": "{{ new Date().toISOString() }}"
}
```

#### 2. IMDB Data Scraper
- **Tipo**: HTTP Request
- **URL**: `https://www.imdb.com/title/{{ $json.imdb_id }}/episodes`
- **Headers**: User-Agent spoofing para evitar blocks
- **Rate Limiting**: 2 segundos entre requests

#### 3. HTML Parser
- **Extract Elements**:
  - Episode titles: `.titleColumn h4 a`
  - Ratings: `.ratingColumn strong`
  - Descriptions: `.item_description`
  - Air dates: `.airdate`

#### 4. Data Transformer
```javascript
// Función para procesar episodios
function processEpisodes(items) {
  return items.map(episode => ({
    season: episode.season,
    episode: episode.number,
    title: episode.title,
    rating: parseFloat(episode.rating) || 0,
    description: episode.description,
    air_date: episode.air_date,
    is_essential: episode.rating > 8.0 || episode.description.includes('mythology')
  }));
}
```

#### 5. Claude API Integration
- **Endpoint**: Claude API
- **Prompt Template**:
```
Analiza estos episodios de {{ $json.series_name }}:

{{ $json.episodes }}

Clasifica cada episodio como:
- ESENCIAL: Mitología principal, desarrollo personajes, game-changers
- OPCIONAL: Buenos pero prescindibles
- RELLENO: Puro procedural sin valor narrativo

Criterios específicos para {{ $json.series_name }}:
- Enfoque en arcos narrativos principales
- Momentos icónicos de la serie
- Desarrollo de relaciones entre personajes principales
- Episodios que conectan temporadas

Output en formato JSON con estructura:
{
  "season_X": {
    "essential": [lista episodios],
    "optional": [lista episodios],
    "filler": [lista episodios]
  }
}
```

#### 6. Output Formatter
- **Genera**: Markdown estructurado para post
- **Incluye**: Template con episodios categorizados
- **Storage**: Guarda en directorio `/contenido/research/`

### Testing del Workflow
```bash
curl -X POST https://tu-n8n-server.com/webhook/series-research \
  -H "Content-Type: application/json" \
  -d '{"series_name": "CSI Las Vegas", "imdb_id": "tt0247082"}'
```

---

## 📊 Workflow 2: Weekly Analytics Report

### Propósito
Generar reporte semanal automatizado de performance del blog

### Trigger
- **Tipo**: Cron Schedule
- **Tiempo**: Lunes 9:00 AM
- **Timezone**: Europe/Madrid

### Nodos del Workflow

#### 1. GA4 Data Fetch
- **API**: Google Analytics 4 Reporting API
- **Metrics**:
  - Sessions
  - Pageviews
  - Bounce rate
  - Average session duration
- **Dimensions**: Page, Source/Medium
- **Date Range**: Last 7 days vs previous 7 days

#### 2. GSC Data Fetch
- **API**: Google Search Console API
- **Metrics**:
  - Clicks
  - Impressions
  - CTR
  - Average position
- **Dimensions**: Query, Page
- **Date Range**: Last 7 days

#### 3. WordPress Posts Performance
- **API**: WordPress REST API
- **Endpoint**: `/wp-json/wp/v2/posts`
- **Filter**: Posts from last 30 days
- **Cross-reference**: Con datos GA4 para performance

#### 4. Data Analysis (Claude)
```
Analiza estos datos de performance semanal:

GA4 Data: {{ $json.ga4_data }}
GSC Data: {{ $json.gsc_data }}
Recent Posts: {{ $json.wp_posts }}

Identifica:
1. Top 3 posts por tráfico
2. Posts con mejor CTR en búsquedas
3. Keywords con mayor crecimiento
4. Oportunidades de optimización
5. Posts que necesitan actualización

Genera reporte en markdown con insights accionables.
```

#### 5. Report Generator
- **Output**: Markdown report
- **Storage**: `/docs/logbook/weekly-YYYY-MM-DD.md`
- **Notification**: Email/Slack con resumen

---

## 🔄 Workflow 3: Content Publishing Pipeline

### Propósito
Automatizar el proceso completo de publicación de posts

### Trigger
- **Tipo**: File Watcher
- **Directorio**: `/contenido/ready-to-publish/`
- **File Type**: `.md` files

### Nodos del Workflow

#### 1. File Reader
- **Input**: Markdown file with frontmatter
- **Parse**: Extract metadata (title, series, keywords, etc.)

#### 2. Content Processor
```javascript
function processMarkdown(content) {
  // Extract frontmatter
  const frontmatter = extractFrontmatter(content);

  // Process Amazon affiliate links
  const processedContent = addAffiliateLinks(content);

  // Generate excerpt
  const excerpt = generateExcerpt(processedContent, 160);

  return {
    title: frontmatter.title,
    content: processedContent,
    excerpt: excerpt,
    categories: frontmatter.categories,
    tags: frontmatter.tags,
    featured_image: frontmatter.featured_image
  };
}
```

#### 3. SEO Optimization (Claude)
```
Optimiza este post para SEO:

Título: {{ $json.title }}
Contenido: {{ $json.content }}
Keyword principal: {{ $json.main_keyword }}

Genera:
1. Meta description optimizada (150-160 chars)
2. Título SEO alternativo si necesario
3. Sugerencias de enlaces internos
4. Schema markup recommendations
5. Social media descriptions

Serie específica: {{ $json.series_name }}
Enfoque: Guías "sin paja" para ver series rápido
```

#### 4. Featured Image Generation
- **API**: DALL-E o Midjourney API
- **Prompt**: "TV series guide cover image for {{ $json.series_name }}, minimalist design, no text, cinematic style"
- **Upload**: To WordPress media library

#### 5. WordPress Publisher
- **API**: WordPress REST API
- **Endpoint**: `/wp-json/wp/v2/posts`
- **Method**: POST
- **Data**: Processed content + metadata

#### 6. Social Media Scheduler
- **Platforms**: Twitter, Facebook (if desired)
- **Content**: Auto-generated social posts
- **Timing**: 2 hours after publication

---

## 🔍 Workflow 4: Competitor Monitoring

### Propósito
Monitorear competencia en nicho cine/series

### Trigger
- **Tipo**: Cron Schedule
- **Tiempo**: Diario 10:00 AM

### Nodos del Workflow

#### 1. RSS Feed Monitors
- **Feeds**:
  - `https://competitor1.com/feed`
  - `https://competitor2.com/feed`
  - `https://tvguide.com/rss`

#### 2. Content Analyzer
```javascript
function analyzeCompetitorContent(posts) {
  return posts.map(post => ({
    title: post.title,
    url: post.url,
    published: post.date,
    topics: extractTopics(post.content),
    series_mentioned: extractSeries(post.content),
    content_type: classifyContentType(post.content)
  }));
}
```

#### 3. Opportunity Detector (Claude)
```
Analiza este contenido de competidores:

{{ $json.competitor_posts }}

Identifica:
1. Series cubiertas por competencia que nosotros no tenemos
2. Ángulos diferentes para series que ya cubrimos
3. Tendencias emergentes en contenido TV/cine
4. Gaps de contenido que podemos aprovechar
5. Keywords que están usando con éxito

Genera lista de oportunidades de contenido para "Series sin Paja"
```

#### 4. Report Generator
- **Output**: Weekly competitor analysis
- **Storage**: `/analisis/competitor-analysis-YYYY-MM-DD.md`

---

## ⚙️ Configuration Files

### Environment Variables
```bash
# .env file for N8N
WORDPRESS_API_URL=https://tu-blog.com/wp-json/wp/v2
WORDPRESS_USERNAME=api-user
WORDPRESS_PASSWORD=application-password
GOOGLE_ANALYTICS_SERVICE_ACCOUNT=path/to/service-account.json
GOOGLE_SEARCH_CONSOLE_CREDENTIALS=path/to/gsc-credentials.json
CLAUDE_API_KEY=your-claude-api-key
AMAZON_AFFILIATE_TAG=tu-affiliate-tag
```

### Webhook Security
```javascript
// Verification function for webhooks
function verifyWebhook(signature, payload, secret) {
  const hash = crypto
    .createHmac('sha256', secret)
    .update(payload)
    .digest('hex');

  return signature === `sha256=${hash}`;
}
```

---

## 🚀 Implementation Order

### Week 1: Basic Setup
1. Install N8N on server
2. Configure basic workflows
3. Test API connections
4. Setup error monitoring

### Week 2: Content Workflows
1. Series research automation
2. Publishing pipeline
3. SEO optimization integration
4. Test with sample content

### Week 3: Analytics & Monitoring
1. Weekly reports automation
2. Competitor monitoring
3. Performance alerts
4. Dashboard integration

### Week 4: Optimization
1. Error handling improvements
2. Rate limiting refinements
3. Performance optimization
4. Full system testing

---

*Todos los workflows respetan rate limits y términos de servicio de las APIs utilizadas.*