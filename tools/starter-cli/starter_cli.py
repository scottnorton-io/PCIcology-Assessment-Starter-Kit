"""
starter_cli.py – Scaffolds a new PCI assessment folder using PCIcology template structure.
"""

import argparse
import os
import shutil
from datetime import datetime

TEMPLATE_DIR = "00_Sales_and_Contracts"

def scaffold_project(project_name):
    timestamp = datetime.now().strftime("%Y%m%d")
    target_path = f"{project_name}_{timestamp}"
    os.makedirs(target_path, exist_ok=True)

    folders = [
        "00_Sales_and_Contracts",
        "01_Scoping_and_PreAssessment",
        "02_Evidence_Collection",
        "03_Assessment_Artifacts",
        "04_Reporting_and_Analysis",
        "05_Final_Deliverables",
        "06_Post_Assessment",
        "_Archive"
    ]

    for folder in folders:
        os.makedirs(os.path.join(target_path, folder), exist_ok=True)

    with open(os.path.join(target_path, "README.md"), "w") as f:
        f.write(f"# {project_name} – PCIcology Assessment Folder\n\nScaffolded on {timestamp}")

    print(f"✅ Scaffolding complete: {target_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create a new PCI assessment engagement structure.")
    parser.add_argument("project_name", help="Name of the client or project")
    args = parser.parse_args()
    scaffold_project(args.project_name)
