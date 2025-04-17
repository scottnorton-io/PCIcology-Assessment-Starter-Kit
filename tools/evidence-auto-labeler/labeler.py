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


import hashlib

def compute_file_hash(file_path):
    hash_fn = hashlib.sha256()
    with open(file_path, "rb") as f:
        while chunk := f.read(8192):
            hash_fn.update(chunk)
    return hash_fn.hexdigest()

def validate_attachment_hash(file_path, expected_hash):
    actual = compute_file_hash(file_path)
    return actual == expected_hash
