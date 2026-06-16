#!/usr/bin/env bash
# ============================================================
# Update GitHub repo descriptions for all OmniBioAI repos
# Run as: bash update_descriptions.sh
# ============================================================
set -euo pipefail

OWNER="man4ish"

echo "=================================================="
echo " OmniBioAI — updating repo descriptions"
echo " Owner: $OWNER"
echo "=================================================="
echo ""

desc() {
  local repo="$1"
  local description="$2"
  echo "→ $repo"
  gh repo edit "$OWNER/$repo" --description "$description" \
    && echo "  ✓ done" \
    || echo "  ✗ FAILED"
  echo ""
}

# ── Frontend & UI ─────────────────────────────────────────
desc omnibioai-design-tokens \
  "Unified design token system for OmniBioAI — 47 CSS custom properties (colors, typography, spacing, radius, shadows) shared across all frontend surfaces. Zero hardcoded values; swap themes by overriding tokens. Ships as CSS, JS, and TypeScript with no build step."

desc omnibioai-ui \
  "Shared React component library for OmniBioAI — Button, Badge, Card, Input, StatusDot, and Spinner built on @man4ish/design-tokens. TypeScript-first, tree-shakeable ES+CJS build via Vite, published to GitHub Packages. Zero hardcoded colors; all styling delegated to the token layer."

desc omnibioai-landing \
  "Official public landing page for OmniBioAI Studio — static HTML/CSS/JS site covering platform features, multi-omics pipeline coverage, system requirements, download links for all platforms (macOS DMG, Linux AppImage, Windows EXE), and a beta access request form. No build step required."

desc omnibioai-studio \
  "Electron + React + Vite desktop app for OmniBioAI — provides a visual workflow builder, plugin launcher, and unified control plane for local, HPC, and cloud bioinformatics execution. Connects to the Django backend via IPC and REST, integrates Docker runtime and local LLM inference via Ollama."

desc omnibioai-launcher \
  "Standalone React app that opens OmniBioAI registry objects directly in JupyterLab, VS Code, or RStudio — automatically injects object ID, API base URL, and auth token as environment context so researchers can start analyzing immediately without manual setup."

# ── Core Platform ─────────────────────────────────────────
desc omnibioai \
  "Core Django backend for OmniBioAI Studio — 150+ bioinformatics plugin apps (genomics, single-cell, metabolomics, drug discovery, AI/ML), visual workflow builder, agent orchestration via LangGraph, object registry, provenance tracking, and audit logging. Plugin system uses a runner/executor pattern with typed I/O contracts."

desc omnibioai-workbench \
  "Modular AI-powered bioinformatics workbench providing the plugin execution environment for OmniBioAI — plugin-based architecture for extensible genomic analysis, LLM-driven biological reasoning, RAG-based literature integration, and reproducible pipeline orchestration across local and HPC environments."

desc omnibioai-toolserver \
  "FastAPI-based ToolServer for OmniBioAI — provides validated, asynchronous execution APIs for bioinformatics tools. Accepts tool invocation requests, validates inputs against declared schemas, executes tools in isolation, and returns structured results. Acts as the execution boundary between the platform and individual tools."

desc omnibioai-tool-runtime \
  "Minimal cloud-agnostic container execution runtime for the OmniBioAI Tool Execution Service — enforces a strict input/output contract for tools running on AWS Batch, Azure Batch, and Kubernetes. Handles environment injection, output collection, and exit-code-based status reporting with no cloud-specific dependencies in tool images."

desc omnibioai-tool-images \
  "ARM64-compatible Docker and Singularity images for bioinformatics and ML tools — FastQC, STAR, BWA, GATK, DESeq2, PyTorch, and more. Built for NVIDIA DGX Spark (aarch64) and deployable via Slurm. Declarative YAML-driven image definitions; part of the OmniBioAI reproducible tool execution stack."

desc omnibioai-ecosystem \
  "Top-level orchestration repo for the OmniBioAI platform — Docker Compose configuration wiring all 18+ microservices together, service dependency graph, environment bootstrapping, and platform-wide deployment scripts for local, on-prem, and cloud environments."

# ── Workflow & Execution ──────────────────────────────────
desc omnibioai-workflow-bundles \
  "Engine-agnostic versioned bioinformatics workflow bundles for OmniBioAI — covers WDL, Nextflow, Snakemake, and CWL across genomics, transcriptomics, epigenomics, and multi-omics domains. Each bundle has a validated manifest.json declaring inputs, outputs, and engine entrypoints. Registered bundles are immutable — changes require a new versioned bundle."

desc omnibioai-tes \
  "Tool Execution Service (TES) for OmniBioAI — orchestrates tool and workflow execution across local processes, HPC schedulers (Slurm), and cloud backends (AWS Batch, Kubernetes) via pluggable adapters. Handles job submission, status polling, log streaming, and result collection with a unified API regardless of execution backend."

# ── AI & ML ───────────────────────────────────────────────
desc omnibioai-rag \
  "RAG-powered bioinformatics assistant for OmniBioAI — uses Hugging Face embeddings and FAISS vector search for semantic retrieval over biomedical literature, combined with Ollama-hosted LLMs for gene-disease summarization, pathway interpretation, and hypothesis generation. Integrates with LangChain for retrieval pipeline orchestration."

desc omnibioai-dev-hub \
  "Multi-repo AI intelligence hub for OmniBioAI — hybrid retrieval system combining vector search, knowledge graph traversal, and plugin-aware retrieval over the full codebase and biomedical corpus. Streaming LLM responses with a React visualization UI for code navigation, cross-repo dependency analysis, and biomedical Q&A."

desc omnibioai-model-registry \
  "Production-grade ML model registry for OmniBioAI — versioned storage, SHA-256 integrity verification, provenance tracking, and full lifecycle management (register, promote, deprecate, retire) for AI/ML models across local disk, cloud object storage, and HPC filesystems. Supports audit trails and model lineage queries."

desc omnibioai-dev-docker \
  "Full GPU-accelerated AI development environment for OmniBioAI — built on NVIDIA PyTorch 25.10 with CUDA, includes R, MySQL, JupyterLab, Hugging Face Transformers, and Ollama. Designed for bioinformatics ML workflows requiring both deep learning (PyTorch/CUDA) and statistical genomics (R/Bioconductor) in a single reproducible container."

# ── SDK & Docs ────────────────────────────────────────────
desc omnibioai-sdk \
  "Official Python SDK for OmniBioAI — typed client for the object registry API (list, filter, paginate, fetch by ID), notebook launch integration for JupyterLab and RStudio, and authentication helpers. Built with Hatchling, 95% test coverage enforced, supports OMNIBIOAI_BASE_URL and OMNIBIOAI_TOKEN environment-based configuration."

desc omnibioai-docs \
  "Comprehensive technical documentation for the OmniBioAI platform — covers system architecture, plugin execution model, agent orchestration design, TES backends, security model, observability stack, workflow registry, LIMS integration, and all major service APIs. Authoritative reference for platform contributors and integrators."

desc omnibioai-videos \
  "Video library and interactive Getting Started guide for OmniBioAI Studio — MP4s served via nginx with zero backend dependencies. Covers installation, first run, plugin usage, workflow building, and agent orchestration. Videos stored in Git LFS; container deployable with a single docker run command."

# ── Control Plane & Observability ─────────────────────────
desc omnibioai-control-center \
  "FastAPI-based control plane for OmniBioAI — provides HTTP/TCP/disk health monitoring across all platform services, live operational dashboards, and ecosystem-wide report generation (architecture diagrams, codebase stats, test coverage, system health summaries). Single pane of glass for platform operators."

# ── Security & Auth ───────────────────────────────────────
desc omnibioai-api-gateway \
  "Zero-trust API gateway for OmniBioAI — handles authentication (JWT verification), policy enforcement (RBAC/ABAC), request routing to downstream services, rate limiting, and secure service-to-service communication. All inbound traffic to the platform passes through this gateway; no service is directly addressable without authorization."

desc omnibioai-security-audit \
  "Distributed security audit and observability system for OmniBioAI — Redis Streams-based real-time event pipeline capturing authentication events, policy decisions, data access, and system actions across all platform services. Provides zero-trust traceability, tamper-evident audit logs, and scalable event replay for compliance and forensics."

desc omnibioai-security-sdk \
  "Unified zero-trust security SDK for the OmniBioAI ecosystem — provides IAM-based authentication, service-to-service (S2S) mutual auth, policy enforcement client, Redis-backed token caching, and structured audit log emission. Used by all OmniBioAI services to enforce consistent security posture without reimplementing auth logic."

desc omnibioai-auth \
  "Production-grade FastAPI authentication service for OmniBioAI — JWT-based login with access and refresh tokens, role-based access control (RBAC), MySQL-backed user and role management, OAuth2 password flow, and token revocation. Central identity provider for all platform services."

desc omnibioai-iam-client \
  "Async IAM client SDK for the OmniBioAI distributed HPC ecosystem — Redis-cached JWT validation with zero-latency token verification on hot paths, async-native design for high-throughput service meshes, and automatic token refresh. Used by all services that need to verify identity without calling the auth service on every request."

desc omnibioai-hpc-policy-engin \
  "Compute-aware HPC policy and resource governance engine for OmniBioAI — enforces GPU/CPU quota limits, Slurm-aware scheduling policies, cluster access control, and zero-trust execution decisions. Prevents resource monopolization on shared HPC infrastructure and ensures fair, auditable compute allocation across research teams."

desc omnibioai-policy-engine \
  "Centralized RBAC/ABAC policy evaluation engine for OmniBioAI — evaluates access control decisions for all platform services using attribute-based and role-based rules. HPC-aware policies cover data access, tool execution, workflow submission, and administrative operations. Real-time enforcement with audit trail on every policy decision."

# ── LIMS ──────────────────────────────────────────────────
desc omnibioai-lims \
  "Lightweight Django-based Laboratory Information Management System (LIMS) for OmniBioAI — manages biological samples, experimental metadata, project hierarchies, and sample tracking workflows. REST API-first design; integrates with the OmniBioAI object registry so sample provenance flows directly into downstream analysis pipelines."

echo "=================================================="
echo " All descriptions updated."
echo " Verify at: https://github.com/$OWNER?tab=repositories"
echo "=================================================="
