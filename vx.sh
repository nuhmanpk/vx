vx() {
    local VENV_DIR=".venv"
    local CREATED=false

    if ! command -v uv >/dev/null 2>&1; then
        echo "→ uv not found"
        echo "→ installing uv"

        curl -LsSf https://astral.sh/uv/install.sh | sh

        export PATH="$HOME/.local/bin:$PATH"

        if ! command -v uv >/dev/null 2>&1; then
            echo "✗ failed to install uv"
            return 1
        fi

        echo "✓ uv installed"
    fi

    if [ ! -d "$VENV_DIR" ]; then
        echo "→ creating virtual environment"
        uv venv "$VENV_DIR"
        CREATED=true
    else
        echo "→ existing virtual environment found"
    fi

    source "$VENV_DIR/bin/activate"

    echo ""
    echo "✓ activated $VENV_DIR"
    echo "✓ python: $(which python)"
    echo "✓ version: $(python --version 2>&1)"
    echo "✓ cwd: $(pwd)"

    if [ "$CREATED" = true ]; then
        if [ -f requirements.txt ]; then
            echo ""
            echo "→ installing requirements.txt"
            uv pip install -r requirements.txt
        elif [ -f pyproject.toml ]; then
            echo ""
            echo "→ installing project"
            uv pip install -e .
        fi
    fi
}
