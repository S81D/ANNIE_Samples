#!/usr/bin/env bash
# Create (or update) the issue labels used by the request forms. Run once after creating the
# GitHub repository, from any machine where the GitHub CLI is logged in:
#
#   bash tools/create_labels.sh S81D/ANNIE_Samples
#
# The forms in .github/ISSUE_TEMPLATE refer to these names exactly; rename both together.

set -euo pipefail
repo="${1:-S81D/ANNIE_Samples}"

label() {
  gh label create "$1" --repo "$repo" --color "$2" --description "$3" --force
}

# What kind of sample
label "request"                "0E8A16" "A request for a new sample"
label "MC"                     "8250DF" "Simulation sample"
label "FakeData"               "F9A825" "Alternative-model or reweighted sample used as fake data"
label "Data"                   "1F6FEB" "Data sample: calibration, special processing, reprocessing"
label "sample-problem"         "D73A4A" "Something is wrong with a sample listed on the site"

# Where a request stands
label "status: new"            "EDEDED" "Not reviewed yet"
label "status: approved"       "C2E0C6" "Approved, waiting to be produced"
label "status: in production"  "FBCA04" "Being produced"
label "status: done"           "0E8A16" "Produced and added to the site"
label "status: declined"       "B60205" "Not going ahead (reason in the issue)"
