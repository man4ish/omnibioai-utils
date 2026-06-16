#!/usr/bin/env bash
# ============================================================
# Set GitHub topics for all OmniBioAI repos via GitHub API
# Works with any gh version — uses gh api directly
# Run as: bash set_topics.sh
# ============================================================
set -euo pipefail

OWNER="man4ish"

echo "=================================================="
echo " OmniBioAI — setting repo topics via GitHub API"
echo " Owner: $OWNER"
echo "=================================================="
echo ""

set_topics() {
  local repo="$1"
  shift
  local topics=("$@")

  # Build JSON array: {"names":["topic1","topic2",...]}
  local json
  json=$(printf '%s\n' "${topics[@]}" | jq -R . | jq -s '{names:.}')

  echo "→ $repo"
  gh api "repos/$OWNER/$repo/topics" \
    -X PUT \
    -H "Accept: application/vnd.github+json" \
    --input <(echo "$json") \
    --silent \
    && echo "  ✓ done" \
    || echo "  ✗ FAILED"
  echo ""
}

# ── Frontend & UI ─────────────────────────────────────────
set_topics omnibioai-design-tokens \
  css typescript design-tokens css-variables design-system \
  ui-design github-packages omnibioai bioinformatics

set_topics omnibioai-ui \
  react typescript css vite component-library design-system \
  design-tokens github-packages npm-package omnibioai bioinformatics

set_topics omnibioai-landing \
  html css javascript landing-page static-site \
  bioinformatics omnibioai

set_topics omnibioai-studio \
  electron react vite desktop-app docker llm hpc \
  bioinformatics omnibioai workflow-orchestration

set_topics omnibioai-launcher \
  react javascript jupyter-notebook rstudio visual-studio-code \
  bioinformatics omnibioai

# ── Platform & Backend ────────────────────────────────────
set_topics omnibioai-workbench \
  python docker bioinformatics plugins llm rag genomics omnibioai

set_topics omnibioai-toolserver \
  python fastapi restapi bioinformatics async-api tools omnibioai

set_topics omnibioai-tool-runtime \
  python kubernetes aws-batch azure docker tool-execution \
  cloud-agnostic omnibioai

set_topics omnibioai-tool-images \
  docker singularity arm64 hpc slurm bioinformatics gatk omnibioai

set_topics omnibioai-workflow-bundles \
  workflow nextflow snakemake wdl cwl bioinformatics \
  reproducibility omnibioai

set_topics omnibioai-tes \
  python fastapi cli hpc tool-execution agentic-ai omnibioai

set_topics omnibioai-ecosystem \
  python docker kubernetes hpc bioinformatics data-platform \
  restapi omnibioai

# ── AI & ML ───────────────────────────────────────────────
set_topics omnibioai-rag \
  python llm rag faiss huggingface-transformers ollama \
  langchain bioinformatics omnibioai

set_topics omnibioai-dev-hub \
  python rag llm embeddings vector-database semantic-search \
  ai-agents omnibioai

set_topics omnibioai-model-registry \
  python machine-learning mlops model-registry bioinformatics \
  model-versioning biomedical-ai omnibioai

set_topics omnibioai-dev-docker \
  docker cuda python huggingface ollama gpu-development \
  ai-development omnibioai

# ── SDK & Docs ────────────────────────────────────────────
set_topics omnibioai-sdk \
  python api bioinformatics genomics jupyterlab \
  scientific-computing sdk omnibioai

set_topics omnibioai-docs \
  documentation architecture bioinformatics omnibioai python

set_topics omnibioai-videos \
  html nginx docker documentation tutorial bioinformatics \
  genomics omnibioai

# ── Control plane & Observability ─────────────────────────
set_topics omnibioai-control-center \
  python fastapi dashboard devops microservices \
  platform-engineering control-plane omnibioai

# ── Security & Auth ───────────────────────────────────────
set_topics omnibioai-api-gateway \
  python jwt authentication zero-trust observability \
  policy-engine omnibioai

set_topics omnibioai-security-audit \
  python security-audit observability zero-trust audit-logging \
  redis-streams omnibioai

set_topics omnibioai-security-sdk \
  python zero-trust iam authentication security-sdk hpc omnibioai

set_topics omnibioai-auth \
  python fastapi jwt oauth2 rbac authentication mysql omnibioai

set_topics omnibioai-iam-client \
  python redis jwt authentication microservices bioinformatics \
  hpc omnibioai

set_topics omnibioai-hpc-policy-engin \
  python hpc slurm policy-engine zero-trust gpu-quota omnibioai

set_topics omnibioai-policy-engine \
  python rbac abac policy-engine zero-trust hpc-security omnibioai

# ── LIMS ──────────────────────────────────────────────────
set_topics omnibioai-lims \
  python django docker lims sample-tracking rest-api \
  bioinformatics omnibioai

echo "=================================================="
echo " All done. Verify at:"
echo " https://github.com/$OWNER?tab=repositories"
echo "=================================================="