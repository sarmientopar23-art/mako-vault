---
title: 15 Trucos de Tokens — Claude Code
type: reference
created: 2026-06-28
updated: 2026-06-28
confidence: high
sources: []
related:
  - "[[referencias/obsidian-plugins]]"
tags:
  - claude-code
  - tokens
  - performance
---

# 15 Trucos de Tokens — Claude Code

Fuente: video "Claude Code: Tokens ilimitados con estos 15 Trucos" (hDt-7qCiQ5A)
**Nota**: aplicados solo los que tienen impacto real en nuestro setup.

---

## Los que SÍ aplican a MAKO

### /compact proactivo cada ~40 mensajes
No esperar al crash. Antes de cerrar una subtarea:
```
/compact "focus on decisions and remaining TODOs"
```

### Ritual de fin de sesión
```
/compact "focus on decisions and remaining TODOs"
/save
```
La próxima sesión arranca limpia con /resume en vez de arrastrar 80K tokens.

### Agrupar preguntas en un mensaje
❌ 4 mensajes separados = 4× el costo de system prompt + MCPs
✅ Un mensaje con (1) (2) (3) (4)

### Separar exploración de implementación
Una sesión para entender cómo funciona (ruidosa).
Nueva sesión limpia para implementar.
No mezclarlas.

### @file en vez de pegar contenido
❌ Copiar 200 líneas de código en el chat
✅ `@wiki/workflows/mercadolibre.md`

### .claudeignore
Excluir archivos que Claude no necesita leer (`.obsidian/`, `outputs/`, `.git/`).
Ya configurado en la raíz del vault.

---

## Los que NO aplican a nuestro setup

| Truco | Por qué no aplica |
|-------|------------------|
| Cambiar modelo por tarea (Haiku/Sonnet/Opus) | Suscripción fija — no pagamos por token |
| Mover skills locales vs globales | Rompe sistema que funciona |
| Auditar MCPs | Todos los usamos activamente |
| /context para diagnóstico de costos | No pagamos por token |
| Suprimir explicaciones de Claude | No es un problema real en nuestro flujo |

---

## Regla de oro del video
> "El ahorro real es arquitectura, no trucos aislados."

Para MAKO: `/resume` lean al inicio + `/compact` proactivo + `/save` al cerrar = sesiones que nunca degradan.
