"""
Evidence Auto-Labeler Tool
Automatically applies PCI DSS metadata tags to uploaded evidence.
"""

import os
import json

def label_evidence(file_name):
    # Dummy logic for illustration
    return {
        "requirement": "3.4.1",
        "control_family": "Encryption",
        "tags": ["confidentiality", "crypto", "CHD"]
    }

def main():
    evidence_dir = "evidence_samples/"
    labeled_output = []

    for fname in os.listdir(evidence_dir):
        metadata = label_evidence(fname)
        labeled_output.append({
            "file": fname,
            "metadata": metadata
        })

    with open("labeled_evidence_output.json", "w") as out:
        json.dump(labeled_output, out, indent=2)

if __name__ == "__main__":
    main()
