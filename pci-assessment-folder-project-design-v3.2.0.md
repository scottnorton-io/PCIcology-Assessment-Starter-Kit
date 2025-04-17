# 📐 Project Design Document: PCIcology Assessment Starter Kit

## 🔖 Project Title
**PCIcology Assessment Starter Kit (v3.2.0)**

---

## 🎯 Purpose

This version continues evolving the Starter Kit into a compliance automation framework. It enables both structure and enforcement through GitHub Actions, schema validation, and automation-first best practices.

---

## 🚀 What’s New in v3.2.0

- ✅ GitHub Action CI for JSON evidence validation (`validate-evidence.yml`)
- ✅ JSON schema support for Open Evidence API (`evidence-schema.json`)
- ✅ New test suite with valid/invalid evidence examples
- ✅ GitHub Action to auto-label issues/PRs by PCI requirement

---

## 🧪 Test Suite

Evidence examples added to `evidence_samples/`:

- `valid-sample.json` — fully compliant structure
- `invalid-sample.json` — missing required fields (e.g., `timestamp`, `id`)

These help validate schema enforcement during pull requests.

---

## 🤖 Automation Pipeline

GitHub Actions now perform:

- Evidence validation on push
- (New) Auto-labeling PRs/issues using keywords mapped to PCI requirements

---

## 🧠 Design Principles

- Versioned structure
- Audit-ready automation
- Modular and extensible JSON schemas
- Evidence traceability and enforcement

---

## 📁 Roadmap Additions for v3.3.0

- Evidence file signing / checksum verification
- Mapping tool to convert schema into required ROC narrative
- Integration with compliance platforms (Vanta, Fieldguide)

---

## 🚀 Release and Package Cadence

| Cycle | GitHub Release | GitHub Package |
|-------|----------------|----------------|
| Major (`vX.0.0`) | ✅ Yes – full public announcement and GitHub Release | Optional |
| Minor (`vX.Y.0`) | ✅ Yes – tag and GitHub Release | Optional |
| Patch (`vX.Y.Z`) | Optional – tag only | ❌ Not required unless binary/tooling provided |
| Toolkit CLI or Scripts | Optional | ✅ GitHub Package (if distributed as pip/npm tool) |
