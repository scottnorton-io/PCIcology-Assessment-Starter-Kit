#!/bin/bash

# Set your GitHub username and repo name
USERNAME="scottnorton-io"
REPO="PCIcology-Assessment-Starter-Kit"

# Initialize and push repo (assumes you already navigated to the unzipped v2.6.0 folder)
git init
git branch -M main
git remote add origin https://github.com/$USERNAME/$REPO.git
git add .
git commit -m "Initial push of PCIcology Assessment Starter Kit v2.6.0"
git push -u origin main

# Enable GitHub Pages from /docs
gh repo edit --add-topic pci-dss --add-topic compliance --add-topic audit --add-topic vanta --add-topic fieldguide --add-topic notion --add-topic starter-kit
gh repo edit --description "A complete PCI DSS assessment engagement structure and toolkit" --homepage "https://$USERNAME.github.io/$REPO"

gh api --method PUT /repos/$USERNAME/$REPO/pages --field source.branch='main' --field source.path='/docs'

# Create GitHub Issues for v3.0.0 roadmap
gh issue create --title "Open Evidence API integration" --body "Support ingestion of evidence from external platforms via JSON schema." --label "v3.0.0,feature"
gh issue create --title "SAQ-A and SAQ-D Template Kits" --body "Provide editable, mapped templates for SAQs." --label "v3.0.0,feature"
gh issue create --title "Live Notion Workspace Template" --body "Deliver a Notion-ready kit for workspace import." --label "v3.0.0,enhancement"
gh issue create --title "Evidence Auto-Labeler Script" --body "Create automation to label files with PCI metadata." --label "v3.0.0,tooling"
gh issue create --title "Starter CLI Tool" --body "Create a CLI to scaffold new client assessments from this repo." --label "v3.0.0,tooling"
