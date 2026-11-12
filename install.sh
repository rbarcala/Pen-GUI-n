#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/xournalpp/plugins/Pen-GUI-n"

MODE="symlink"

for arg in "$@"; do
    case "$arg" in
        --copy|-c)
            MODE="copy"
            ;;
        --symlink|-s)
            MODE="symlink"
            ;;
        --uninstall|-u)
            echo "Desinstalando plugin de Xournal++..."
            rm -rf "$TARGET_DIR"
            echo "Plugin desinstalado exitosamente de $TARGET_DIR"
            exit 0
            ;;
        --help|-h)
            echo "Uso: ./install.sh [OPCIONES]"
            echo "Opciones:"
            echo "  -s, --symlink    Instalar mediante enlace simbólico (por defecto, cambios en vivo)"
            echo "  -c, --copy       Instalar copiando los archivos"
            echo "  -u, --uninstall  Desinstalar el plugin"
            echo "  -h, --help       Mostrar esta ayuda"
            exit 0
            ;;
        *)
            echo "Opción desconocida: $arg"
            echo "Ejecuta ./install.sh --help para ver las opciones."
            exit 1
            ;;
    esac
done

mkdir -p "$(dirname "$TARGET_DIR")"

# Si ya existe y no apunta al directorio actual
if [ -e "$TARGET_DIR" ] || [ -L "$TARGET_DIR" ]; then
    if [ "$MODE" = "symlink" ] && [ -L "$TARGET_DIR" ] && [ "$(readlink -f "$TARGET_DIR")" = "$SCRIPT_DIR" ]; then
        echo "El plugin ya está instalado y enlazado a $SCRIPT_DIR."
        exit 0
    fi

    echo "Respaldando instalación previa en ${TARGET_DIR}.backup..."
    rm -rf "${TARGET_DIR}.backup"
    mv "$TARGET_DIR" "${TARGET_DIR}.backup"
fi

if [ "$MODE" = "symlink" ]; then
    echo "Creando enlace simbólico hacia $TARGET_DIR..."
    ln -s "$SCRIPT_DIR" "$TARGET_DIR"
    echo "¡Instalación completada! El plugin está enlazado a tu carpeta de desarrollo."
    echo "Cualquier cambio futuro en este proyecto se reflejará automáticamente en Xournal++."
else
    echo "Copiando archivos a $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
    cp -r "$SCRIPT_DIR"/main.lua "$SCRIPT_DIR"/plugin.ini "$TARGET_DIR"/
    echo "¡Instalación completada! Archivos copiados a $TARGET_DIR."
fi
