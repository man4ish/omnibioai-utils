# omnibioai-utils

Developer utilities, automation scripts, and ecosystem management tools for the OmniBioAI platform. Covers stack lifecycle management, build automation, CI/CD control, coverage reporting, GitHub project setup, and ecosystem health monitoring.

---

## Scripts

### Stack Management

| Script | Description |
|--------|-------------|
| `omnibioai-up.sh` | Starts the full OmniBioAI stack in a tmux session |
| `omnibioai-down.sh` | Tears down the tmux session and stops all services |
| `start_all.sh` | Starts all OmniBioAI services sequentially |
| `start_stack_tmux.sh` | Launches the full stack in named tmux windows with port management |
| `start-all-uis.sh` | Starts all React frontend UIs and backend APIs |
| `stop-all-uis.sh` | Stops all running React UI dev servers |
| `smoke_test_stack.sh` | Runs HTTP health checks against all core service endpoints |

### Build Automation

| Script | Description |
|--------|-------------|
| `build-all-new.sh` | Builds and pushes all service images to GHCR (`ghcr.io/man4ish`) |
| `build_all_tools.sh` | Builds all bioinformatics tool images and pushes to ECR and GHCR |
| `build_cython.sh` | Compiles all high-priority Cython files across repos before Docker builds |

### Ecosystem Management

| Script | Description |
|--------|-------------|
| `ecosystem_status.sh` | Reports git branch and clean/dirty status across all 32 repos |
| `clock_count.sh` | Counts lines of code across the full ecosystem using `cloc` |
| `run_coverage.sh` | Aggregates pytest coverage reports across all repos into `out/coverage/` |
| `disable_cicd.sh` | Moves `.github/workflows` to `workflows_disabled` across all repos |
| `update_descriptions.sh` | Updates GitHub repo descriptions for all OmniBioAI repos via API |
| `update_topics.sh` | Sets GitHub topics for all OmniBioAI repos via `gh api` |

### Project Setup

| Script / File | Description |
|---------------|-------------|
| `setup_beta_project.py` | Creates GitHub Project "OmniBioAI Beta Launch" with Board + Roadmap views, custom fields (Priority, Category, Repo, Due Date), and issues across all repos linked to the project |
| `build-results.txt` | Latest build results log |

---

## Usage

### Check ecosystem status
```bash
bash ecosystem_status.sh
# or from machine root:
bash utils/ecosystem_status.sh
```

### Start the full stack
```bash
bash omnibioai-up.sh
```

### Smoke test all services
```bash
bash smoke_test_stack.sh
```

### Build and push all images to GHCR
```bash
bash build-all-new.sh
```

### Run coverage across all repos
```bash
bash run_coverage.sh
# Output: ~/Desktop/machine/out/coverage/
```

### Update all GitHub repo descriptions and topics
```bash
export GITHUB_TOKEN=<your_pat>
bash update_descriptions.sh
bash update_topics.sh
```

### Set up GitHub Beta Launch project
```bash
export GITHUB_TOKEN=<your_pat>
python setup_beta_project.py --dry-run   # preview
python setup_beta_project.py             # execute
```

### Disable CI/CD across all repos
```bash
bash disable_cicd.sh
```

---

## Requirements

```bash
# Shell utilities
sudo apt-get install tmux cloc

# Python (for setup_beta_project.py)
pip install PyGithub requests

# GitHub CLI (for update_topics.sh, update_descriptions.sh)
gh auth login
```

---

## Related Repositories

- [`omnibioai-ecosystem`](../omnibioai-ecosystem) — Docker Compose stack wired by these scripts
- [`omnibioai-control-center`](../omnibioai-control-center) — live health dashboard complementing `smoke_test_stack.sh`
- [`omnibioai-test-data`](../omnibioai-test-data) — test suite run via these build and stack scripts
