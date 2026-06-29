---
title: Método Wiki Karpathy — Obsidian + Claude Code
type: source
created: 2026-06-28
updated: 2026-06-28
confidence: high
sources:
  - raw/referencias/video-eJBtLV0QgT8.md
related:
  - "[[sistema/stack]]"
  - "[[sistema/reglas]]"
  - "[[referencias/obsidian-plugins]]"
tags:
  - obsidian
  - claude-code
  - knowledge-management
  - karpathy
---

# Método Wiki Karpathy — Obsidian + Claude Code

**Fuente**: Video YouTube "Cómo organizar tus archivos mejor que el 99% de las personas | Claude Code + Obsidian" (eJBtLV0QgT8)
**Fecha ingest**: 2026-06-28

## Concepto central

El vault de Obsidian funciona como un compilador de conocimiento. Claude Code lo opera como si fuera código fuente. La separación es:
- `raw/` = código fuente inmutable (input humano)
- `wiki/` = binario generado por IA (output estructurado)
- `CLAUDE.md` = compilador de instrucciones

## Las 3 operaciones core

### 1. Ingest
Leer fuente en `raw/` → crear summary en `wiki/sources/` → actualizar páginas de conceptos → actualizar `index.md` → loguear en `log.md`.
Un solo ingest puede afectar 10-15 páginas simultáneamente (knowledge compounding).
Límite: máximo 3 fuentes por sesión para mantener calidad de conexiones.

### 2. Query
Leer `index.md` → identificar páginas relevantes → sintetizar respuesta con wikilinks → opcionalmente guardar como nueva nota.
La ventaja sobre RAG: las cross-references están pre-construidas, no ad-hoc.

### 3. Lint
Auditoría semanal: notas huérfanas, contradicciones, claims desactualizados, frontmatter incompleto, wikilinks rotos.
Output siempre a `outputs/lint-YYYY-MM-DD.md`.

## Estructura recomendada (Karpathy)

```
vault/
├── raw/          ← inmutable, input humano
├── wiki/
│   ├── index.md  ← catálogo maestro
│   ├── log.md    ← append-only
│   ├── sources/  ← un resumen por fuente externa
│   ├── concepts/ ← conceptos del dominio
│   └── entities/ ← entidades (personas, productos, etc.)
├── outputs/      ← lint y reportes
└── CLAUDE.md     ← instrucciones para el agente
```

## Frontmatter YAML obligatorio
```yaml
title, type, sources, related, created, updated, confidence
```
`sources` = trazabilidad hasta el raw/ que originó la nota.
`confidence` = high (verificado) | medium (diseñado) | low (hipótesis)

## LLM Wiki vs RAG

| Aspecto | LLM Wiki (nuestro sistema) | RAG |
|---------|---------------------------|-----|
| Estado | Stateful, acumulativo | Stateless por query |
| Infraestructura | Carpeta markdown | Vector DB + embeddings |
| Cross-references | Pre-construidas | Ad-hoc |
| Trazabilidad | Hasta raw/ | Chunks |
| Mantenimiento | LLM actualiza páginas | Rebuild embeddings |

## Plugins Obsidian recomendados
- **Dataview** — queries sobre metadatos (confidence, type, updated)
- **Templater** — notas nuevas con frontmatter completo automático
- **Git** — commits automáticos desde Obsidian

## Errores comunes a evitar
- Saturación: >3 fuentes por sesión → conexiones de baja calidad
- Sin versionado: git commit tras cada ingest
- CLAUDE.md genérico: ser específico en naming, frontmatter y estructura
- Ignorar lint: ejecutarlo semanalmente mínimo
- No refrescar Obsidian: Ctrl+R después de cambios masivos de Claude

## Estado de implementación en MAKO-VAULT

| Componente | Estado |
|------------|--------|
| CLAUDE.md con /resume, /save, /lint, /ingest, /new | ✅ Completo |
| raw/ inmutable | ✅ Existe |
| wiki/ con subcarpetas | ✅ Completo |
| wiki/sources/ | ✅ Creado (esta sesión) |
| templates/nota-base.md | ✅ Creado (esta sesión) |
| outputs/ para lint | ✅ Existe |
| Git con remote | ✅ Activo |
| Frontmatter completo (sources, created) | ✅ Definido en CLAUDE.md |
| Plugins Obsidian (Dataview, Templater, Git) | ⏳ Instalación manual pendiente |
