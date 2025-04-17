#!/bin/bash

# GitHub setup
USERNAME="scottnorton-io"
REPO="PCIcology-Assessment-Starter-Kit"
PROJECT_NAME="PCIcology Roadmap v3.1.0"

echo "Creating GitHub Issues and assigning them to project board columns..."

# Step 1: Get the project ID
PROJECT_ID=$(gh api graphql -f query='
  query {
    user(login: "scottnorton-io") {
      projectsV2(first: 10) {
        nodes {
          id
          title
        }
      }
    }
  }' | jq -r '.data.user.projectsV2.nodes[] | select(.title=="PCIcology Roadmap v3.1.0") | .id')

# Step 2: Define issues and their details
declare -A ISSUES
ISSUES["Implement Open Evidence API schema"]="Use evidence-schema.json to define and validate external evidence formats from platforms like Vanta or Fieldguide."
ISSUES["Build Evidence Auto-Labeler (Python)"]="Develop the script in tools/evidence-auto-labeler/labeler.py to classify and tag uploaded files automatically."
ISSUES["Develop SAQ-A Template Kit"]="Deliver editable SAQ-A assessment packages with mapped templates and folder hierarchy."
ISSUES["Develop SAQ-D Template Kit"]="Deliver editable SAQ-D assessment packages with mapped templates and folder hierarchy."
ISSUES["Create Notion Workspace Kit"]="Use notion-template-kit/ to create a usable Notion assessment starter."
ISSUES["Design Starter CLI Tool"]="Enable teams to scaffold new PCI assessments with a command-line interface."

# Step 3: Create issues and link them to project
for TITLE in "${!ISSUES[@]}"; do
  BODY="${ISSUES[$TITLE]}"
  ISSUE_URL=$(gh issue create --repo "$USERNAME/$REPO" --title "$TITLE" --body "$BODY" --label "v3.1.0,roadmap,enhancement" --json url | jq -r '.url')
  echo "Created Issue: $TITLE"
  echo "Linking issue to project..."

  ISSUE_ID=$(gh api "$ISSUE_URL" --jq '.node_id')

  # Add issue to project
  gh api graphql -f query='
    mutation($projectId:ID!, $contentId:ID!) {
      addProjectV2ItemById(input: {projectId: $projectId, contentId: $contentId}) {
        item {
          id
        }
      }
    }' -f projectId="$PROJECT_ID" -f contentId="$ISSUE_ID"
done

echo "All roadmap issues created and added to project!"
