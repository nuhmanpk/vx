# vx

A tiny command that creates and activates a Python virtual environment with zero setup.

`vx` handles the boring parts so you can start coding immediately.

## Features

* Installs `uv` automatically if it's not available
* Creates a `.venv` if it doesn't exist
* Activates the virtual environment
* Displays useful environment information
* Installs project dependencies on first run
* Works with both Zsh and Bash

## Why?

Starting a new Python project usually looks like this:

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

With `vx`, it's just:

```sh
vx
```

## Installation

```sh
curl -fsSL https://raw.githubusercontent.com/nuhmanpk/vx/main/install.sh | bash
```

Restart your terminal or run:

```sh
source ~/.zshrc
```

Verify installation:

```sh
type vx
```

Expected:

```text
vx is a shell function
```

## Usage

```sh
vx
```

Example:

```text
→ creating virtual environment

✓ activated .venv
✓ python: /project/.venv/bin/python
✓ version: Python 3.13.5
✓ cwd: /project
```

## What happens?

When you run:

```sh
vx
```

`vx` will:

1. Install `uv` if necessary
2. Create `.venv` if it doesn't exist
3. Activate the environment
4. Display environment information
5. Install dependencies on first run

Supported project files:

```text
requirements.txt
pyproject.toml
```

## Requirements

* macOS or Linux
* curl
* zsh or bash
* Python 3.8+

## License

MIT

Built by Nuhman PK.
