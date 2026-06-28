---
type: workflow
updated: 2026-06-28
status: activo
id: JtSONgOXo0C2XbRl
---

# MAKO-CONTROL-PANEL-v1.0

**Estado**: ✅ PUBLICADO
**ID n8n**: `JtSONgOXo0C2XbRl`
**URL del form**: `/form/mako-control-panel`

## Qué hace
Form público donde Dario configura el capital disponible antes de cada corrida. El Motor Diario lee estos valores al iniciar y filtra las recomendaciones según el capital declarado.

## Campos del formulario
- `capital_disponible` — capital en ARS disponible para invertir
- `precio_min_ars` — precio mínimo de productos a recomendar
- `precio_max_ars` — precio máximo
- `notas` — notas opcionales para esa corrida

## Output → tabla `parametros_corrida`
```sql
CREATE TABLE parametros_corrida (
  id bigserial PRIMARY KEY,
  capital_disponible numeric,
  precio_min_ars numeric,
  precio_max_ars numeric,
  notas text,
  created_at timestamptz DEFAULT now()
);
```

## Capital Awareness
- `capitalLimitUsd = floor((capitalArs / blueRate) * 0.6)`
- Ninguna recomendación puede superar ese límite (el 40% restante es para envíos, contingencias, margen)
- Defaults si no hay registro en la tabla: capital=$700K ARS, min=$1K, max=$50K
