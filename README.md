# 🚀 TmuxXpert - Configuración de Tmux Optimizada para Neovim VimX

Una configuración de Tmux rápida, útil y hermosa diseñada específicamente para trabajar perfectamente con tu configuración de Neovim VimX.

## ✨ Características Principales

### 🎯 Optimizado para Neovim VimX
- **Prefix no conflictivo**: `Ctrl+Space` en lugar de `Ctrl+b`
- **Keybinds inteligentes**: Alt-based navigation que no interfiere con Neovim
- **Integración perfecta**: Session persistence compatible con Neovim
- **Copy/paste mejorado**: Integración con clipboard del sistema

### 🎨 19 Temas Hermosos
- **Tokyo Night** - Elegante tema oscuro con acentos azules
- **Catppuccin** - Suave tema con sabor a mocha
- **Dracula** - Tema vibrante púrpura y rosa
- **Gruvbox** - Clásico tema de alto contraste
- **Nord** - Limpio tema inspirado en el Ártico
- **Material** - Inspirado en Google Material Design
- **One Dark** - Tema oscuro inspirado en Atom
- **Solarized** - Tema oscuro amigable para los ojos
- **Monokai** - Tema vibrante y colorido
- **Rose Pine** - Tema natural de pino y lila
- **Kanagawa** - Inspirado en la tradición japonesa
- **Everforest** - Tema cálido inspirado en la naturaleza
- **Doom One** - Inspirado en Doom Emacs
- **Carbonfox** - Tema oscuro inspirado en Carbon
- **Oxocarbon** - Sistema de diseño IBM Carbon
- **Melange** - Tema oscuro cálido y acogedor
- **Modus Vivendi** - Tema de alto contraste accesible
- **Vim One** - Tema One Dark mejorado
- **Papercolor** - Tema claro inspirado en Material Design

### 🔌 Plugins Esenciales
- **TPM** - Gestor de plugins de Tmux
- **Resurrect** - Guardar/restaurar sesiones automáticamente
- **Continuum** - Auto-guardado cada 15 minutos
- **Yank** - Copy/paste mejorado
- **Fingers** - Detección de URLs y archivos
- **URL View** - Vista rápida de URLs
- **Sessionist** - Gestión avanzada de sesiones
- **Copycat** - Búsqueda mejorada
- **Battery** - Estado de batería en status bar
- **CPU** - Información de CPU en status bar

### ⚡ Performance Optimizado
- **Inicio rápido**: Configuración optimizada para velocidad
- **Lazy loading**: Plugins cargan solo cuando se necesitan
- **Escape time 0**: Respuesta instantánea
- **Scrollback aumentado**: 50,000 líneas de historial

## 🚀 Instalación Rápida

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/TmuXpert.git
cd TmuXpert
```

### 2. Ejecutar el script de instalación
```bash
chmod +x install-tmux.sh
./install-tmux.sh
```

### 3. Instalar plugins (desde dentro de tmux)
```bash
tmux
# Luego presionar: Ctrl+Space, luego I
```

## 🎮 Keybinds Principales

### 🎯 Prefix y Navegación
| Acción | Keybind |
|--------|---------|
| **Prefix** | `Ctrl+Space` |
| **Nueva ventana** | `prefix + c` |
| **Matar ventana** | `prefix + X` |
| **Cambiar a ventana** | `Alt + número` (1-9, 0 para 10) |

### 📱 Gestión de Paneles
| Acción | Keybind |
|--------|---------|
| **Split horizontal** | `prefix + \|` |
| **Split vertical** | `prefix + -` |
| **Matar panel** | `prefix + x` |
| **Toggle zoom** | `prefix + z` |
| **Cambiar panel** | `Alt + flechas` |
| **Redimensionar panel** | `Alt + Shift + flechas` |

### 💾 Sesiones
| Acción | Keybind |
|--------|---------|
| **Guardar sesión** | `prefix + S` |
| **Restaurar sesión** | `prefix + R` |
| **Matar sesión** | `prefix + Ctrl+f` |
| **Cambiar sesión** | `prefix + Ctrl+s` |

### 🔍 Búsqueda y Copia
| Acción | Keybind |
|--------|---------|
| **Modo copia** | `prefix + [` |
| **Buscar hacia atrás** | `prefix + /` |
| **Buscar hacia adelante** | `prefix + ?` |
| **Copiar selección** | `Enter` (en modo copia) |

### 🎨 Plugins
| Acción | Keybind |
|--------|---------|
| **Fingers (URLs/archivos)** | `prefix + F` |
| **URL view** | `prefix + u` |
| **Cambiar tema** | `~/.tmux/theme-switcher.sh` |

### ⚙️ Otros
| Acción | Keybind |
|--------|---------|
| **Recargar config** | `prefix + r` |
| **Sincronizar paneles** | `prefix + y` |

## 🎨 Gestión de Temas

### Cambiar Tema Interactivamente
```bash
~/.tmux/theme-switcher.sh
```

### Cambiar Tema Específico
```bash
~/.tmux/theme-switcher.sh tokyo-night
~/.tmux/theme-switcher.sh dracula
~/.tmux/theme-switcher.sh catppuccin
```

### Listar Temas Disponibles
```bash
~/.tmux/theme-switcher.sh list
```

### Tema Aleatorio
```bash
~/.tmux/theme-switcher.sh random
```

### Ver Tema Actual
```bash
~/.tmux/theme-switcher.sh current
```

## 📊 Status Bar

La barra de estado muestra información útil:

### Lado Izquierdo
- **Nombre de sesión**
- **Versión del kernel**
- **Ruta actual**

### Lado Derecho
- **Carga del sistema**
- **Estado de batería**
- **Hora y fecha**

## 🔧 Personalización

### Agregar Plugins
Edita `~/.tmux.conf` y agrega en la sección de plugins:

```bash
set -g @plugin 'tu-plugin/nombre'
```

### Modificar Keybinds
Edita `~/.tmux.conf` en la sección de keybindings:

```bash
bind -n M-tu-tecla tu-accion
```

### Cambiar Colores
Usa el theme switcher o edita directamente en `~/.tmux.conf`:

```bash
set -g status-style "bg=colour235,fg=colour136"
```

## 🐛 Solución de Problemas

### Plugins No Se Cargan
```bash
# Desde dentro de tmux
prefix + I  # Instalar plugins
prefix + r  # Recargar configuración
```

### Verificar Instalación
```bash
tmux -V
ls ~/.tmux/plugins/
```

### Logs de Plugins
```bash
# Desde dentro de tmux
prefix + I  # Ver logs de instalación
```

### Problemas de Copy/Paste
```bash
# Verificar xclip
which xclip

# En macOS usar pbcopy
# En Windows puede ser limitado
```

### Temas No Cambian
```bash
# Verificar script
chmod +x ~/.tmux/theme-switcher.sh

# Aplicar manualmente
tmux set -g status-style "bg=colour235,fg=colour136"
```

## 🚀 Inicio Rápido

### Script de Inicio
```bash
~/.tmux/start.sh
```

### Comandos Útiles
```bash
# Ver referencia rápida
cat ~/.tmux/quick-ref.md

# Ver estado de batería
~/.tmux/battery.sh

# Cambiar tema
~/.tmux/theme-switcher.sh
```

## 📁 Estructura de Archivos

```
~/.tmux/
├── plugins/           # Plugins de TPM
├── resurrect/         # Sesiones guardadas
├── logs/             # Logs del sistema
├── battery.sh        # Script de batería
├── theme-switcher.sh # Gestor de temas
├── start.sh          # Script de inicio
└── quick-ref.md      # Referencia rápida

~/.tmux.conf          # Configuración principal
```

## 🎯 Integración con Neovim VimX

Esta configuración está diseñada para trabajar perfectamente con tu Neovim VimX:

### Compatibilidad
- **Prefix no conflictivo**: `Ctrl+Space` no interfiere con Neovim
- **Navegación Alt-based**: No afecta los keybinds de Neovim
- **Session persistence**: Funciona con sesiones de Neovim
- **Copy/paste**: Integración perfecta con clipboard

### Workflow Recomendado
1. **Iniciar Tmux**: `tmux` o `~/.tmux/start.sh`
2. **Abrir Neovim**: `nvim` en un panel
3. **Navegar**: Usar `Alt+flechas` para cambiar paneles
4. **Cambiar ventanas**: Usar `Alt+número` para ventanas
5. **Cambiar tema**: `~/.tmux/theme-switcher.sh`

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el repositorio
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.

## 🙏 Créditos

- **LazyVim** - Base para la configuración de Neovim
- **TPM** - Gestor de plugins de Tmux
- **Comunidad Tmux** - Plugins y temas

## 🔗 Enlaces Útiles

- [Neovim VimX](https://github.com/Maurux01/VimX) - Tu configuración de Neovim
- [TPM](https://github.com/tmux-plugins/tpm) - Gestor de plugins
- [Tmux Manual](https://man.openbsd.org/tmux.1) - Documentación oficial

---

**¡Disfruta tu nueva configuración de Tmux optimizada para Neovim VimX! 🚀**