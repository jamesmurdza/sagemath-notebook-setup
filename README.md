# Project

## SageMath Jupyter Notebook

This repo is set up to run a SageMath-enabled Jupyter Notebook server, with
notebooks saved to `notebooks/` so they're version-controlled alongside the code.

### First-time setup (installs SageMath + Jupyter via apt)

```bash
./setup.sh
```

### Start the notebook server

```bash
./start-notebook.sh
```

This serves notebooks from `./notebooks` on port 8888 (override with
`JUPYTER_PORT=xxxx ./start-notebook.sh`). No auth token/password is set —
only use this in a trusted/sandboxed environment. When creating a new
notebook, pick the **SageMath** kernel to get Sage's math functions.

Logs are written to `/tmp/logs/jupyter.log`.
