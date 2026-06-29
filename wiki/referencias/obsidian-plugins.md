---
title: Obsidian Plugins — Guía de instalación y configuración
type: reference
created: 2026-06-28
updated: 2026-06-28
confidence: high
sources: []
related:
  - "[[sources/karpathy-wiki-method-obsidian-claude-code]]"
  - "[[sistema/stack]]"
tags:
  - obsidian
  - plugins
  - configuracion
---

# Obsidian Plugins — Guía de instalación y configuración

Plugins recomendados para el vault MAKO. Instalación: Obsidian → Settings → Community plugins → Browse.

---

## 1. Dataview (PRIORITARIO)

**Instalar**: buscar "Dataview" → Install → Enable

Permite hacer queries SQL-like sobre el frontmatter de todas las notas.

### Queries útiles para MAKO

**Notas con confidence low (requieren revisión):**
```dataview
TABLE updated, confidence
FROM "wiki"
WHERE confidence = "low"
SORT updated ASC
```

**Notas sin campo `created` (frontmatter incompleto):**
```dataview
TABLE type, updated
FROM "wiki"
WHERE !created
SORT file.mtime DESC
```

**Workflows activos vs inactivos:**
```dataview
TABLE updated
FROM "wiki/workflows"
SORT updated DESC
```

**Todas las fuentes ingestadas:**
```dataview
TABLE created, tags
FROM "wiki/sources"
SORT created DESC
```

**Notas modificadas esta semana:**
```dataview
TABLE type, updated
FROM "wiki"
WHERE date(updated) >= date(today) - dur(7 days)
SORT updated DESC
```

### Configuración recomendada
En Settings → Dataview:
- ✅ Enable JavaScript Queries
- ✅ Enable Inline Queries
- Render null as: `-`

---

## 2. Templater

**Instalar**: buscar "Templater" → Install → Enable

Permite crear notas nuevas con frontmatter completo automático.

### Configuración
Settings → Templater:
- Template folder location: `templates`
- ✅ Trigger Templater on new file creation
- ✅ Enable system commands (para fecha automática)

### Uso con el comando /new
Cuando Claude Code ejecuta `/new [tipo] [nombre]`, usa `templates/nota-base.md` como base.
Para crear notas desde Obsidian manualmente: Cmd/Ctrl+P → "Templater: Create new note from template"

---

## 3. Git (para commits automáticos)

**Instalar**: buscar "Obsidian Git" → Install → Enable

Permite hacer commits desde dentro de Obsidian sin abrir la terminal.

### Configuración recomendada
Settings → Obsidian Git:
- Vault backup interval: `0` (no auto-commit — commits manuales con Claude)
- Pull on startup: ✅
- Show status bar: ✅
- ✅ Source control view (panel lateral)

### Uso
- Ctrl+P → "Git: Commit all changes" para commitear desde Obsidian
- El panel lateral muestra archivos modificados / staged
- IMPORTANTE: los commits de Claude Code ya están siendo trackeados via terminal

---

## 4. Minimal Theme (opcional pero recomendado)

**Instalar**: Settings → Appearance → Themes → Manage → buscar "Minimal"

El mejor tema para vaults de trabajo técnico. Limpio, sin distracciones, buen contraste en tablas y code blocks.

### Configuración con Minimal Theme Settings plugin
- Instalarlo también: "Minimal Theme Settings"
- Color scheme: Default (o Dark si trabajás de noche)
- ✅ Trim filename in header
- Tables: Normalize

---

## 5. Checklist de instalación

```
□ Dataview — instalado y habilitado
□ Dataview JavaScript Queries — activado
□ Templater — instalado y habilitado
□ Template folder → templates/
□ Obsidian Git — instalado y habilitado
□ Minimal Theme — instalado (opcional)
□ Minimal Theme Settings — instalado si usás Minimal
```

---

## Plugins que NO instalar

- **Kanban**: no aplica al vault MAKO (no es un gestor de tareas)
- **Daily Notes**: usamos `wiki/sesiones/` en su lugar
- **Zotero integration**: no aplica
- **Sync**: usar OneDrive (ya configurado) + Git, no Obsidian Sync ($10/mes)
