---
type: system
updated: 2026-06-27
confidence: high
related: ["[[sistema/pipeline]]", "[[sistema/reglas]]"]
---

# Stack técnico MAKO

## Infraestructura

| Componente | Servicio | Rol |
|-----------|---------|-----|
| Orquestador | n8n Cloud | Ejecuta workflows, conecta servicios |
| Base de datos | Supabase (PostgreSQL + pgvector) | Fuente de verdad absoluta |
| Scraping | Apify (Cloud) | 100% cloud-first — nunca local |
| Similitud semántica | pgvector en Supabase | Clustering de señales |
| Motor IA | Gemini 2.5 Flash | Genera el Diario — $0 |
| Embeddings | OpenAI text-embedding-3-small | Vectoriza señales |

## Credenciales n8n (IDs internos)
| ID | Servicio | Uso |
|----|---------|-----|
| BNNRJaDhsx7ZnKxl | OpenAI | Embeddings |
| PEv3ZDOnsevtL9C1 | Gemini (principal) | Motor Diario |
| blVII3r4po5KvdLN | Gemini (backup 1) | Motor Diario |
| qRluRlU4eJbnrvmE | Gemini (backup 2) | Motor Diario |

## Supabase
- URL: https://xbtgafvomvhgujxpjubr.supabase.co
- Project ref: xbtgafvomvhgujxpjubr
- Usar SIEMPRE: service_role JWT
- Anon key: OBSOLETA — no usar

## Apify
- Plan: STARTER $29 USD/mes
- Token workflows: `[ver referencias_tecnicas.md — no commitear]`
- Costo por corrida completa: ~$6.50

## n8n Cloud
- URL: https://makoecommerce.app.n8n.cloud
- Plan: 50 ejecuciones/mes
- ~12 ejecuciones por corrida completa

## Tabla signals — schema clave
| Columna | Tipo | Nota |
|---------|------|------|
| entity_id | text UNIQUE | SHA256(fuente + ':' + textoNorm) |
| fuente | text | identifica el módulo |
| texto_original | text | dato crudo |
| increase_percentage | integer | siempre entero, nunca string |
| raw_payload | jsonb | datos específicos por módulo |
| captured_at | text | ISO 8601 |

## Regla hardware
- CERO scraping local — prohibido correr Crawlee/Puppeteer en la notebook
- Todo actor Apify se lanza desde n8n vía API Token
- La notebook solo corre Claude Code + VS Code + MCP
