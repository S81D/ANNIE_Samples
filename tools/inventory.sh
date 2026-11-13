#!/usr/bin/env bash
# Inventory of the dCache paths listed on the site. Read-only. Run on an ANNIE gpvm, where /pnfs is mounted:
#
#   bash tools/inventory.sh > inventory_$(date +%Y%m%d).tsv
#
# With no arguments it scans every path below; pass paths as arguments to scan only those.
# Large data trees (ProcessedData) can take tens of minutes, so run it inside screen or tmux.
#
# Output, per scanned path:
#   1. the directory tree to depth 3, with run-numbered directories left out (to check directory names);
#   2. one line per directory that holds files, tab-separated:
#        directory  n_files  size_GB  newest_file_date  runs  example_file
#      Run-numbered directories (e.g. .../processed_EBV2/4123) are merged into ".../<run>", and the
#      "runs" column gives how many there are and their range.

set -u

DEFAULT_PATHS=(
  # Data
  /pnfs/annie/persistent/processed/processingData_EBV2/processed_EBV2
  /pnfs/annie/persistent/processed/processingData_EBV2/BeamClusterTrees
  /pnfs/annie/persistent/processed/ANNIE_2_percent_unblinded_data
  /pnfs/annie/persistent/processed/processed_EBV2
  /pnfs/annie/persistent/processed/BeamFetcherV2
  /pnfs/annie/persistent/processed/ANNIE_Production/FY25
  /pnfs/annie/persistent/users/doran/datasets/NCQE_BEAMCLUSTER_DATA
  /pnfs/annie/persistent/users/doran/datasets/tuning_data
  /pnfs/annie/persistent/users/doran/datasets/laser_data
  # MC
  /pnfs/annie/persistent/users/jminock/flux
  /pnfs/annie/persistent/simulations/genie3/G1810a0211a
  /pnfs/annie/persistent/simulations/g4dirt/G1810a0211a
  /pnfs/annie/persistent/simulations/wcsim/G1810a0211a
  /pnfs/annie/persistent/users/doran/GENIE-Base
  /pnfs/annie/persistent/users/doran/GENIE-016-empirical-model
  /pnfs/annie/persistent/users/doran/WCSim_genie_untilted_samples
  /pnfs/annie/persistent/users/doran/WCSim_genie_physics_list_variations
  /pnfs/annie/persistent/users/doran/WCSim_genie_VARY_QE_SCALE_samples
  /pnfs/annie/persistent/users/doran/WCSim_AmBe_samples
  /pnfs/annie/persistent/users/doran/WCSim_dirt_samples
  /pnfs/annie/persistent/users/doran/simulated_skyshine
)

if [ "$#" -gt 0 ]; then
  PATHS=("$@")
else
  PATHS=("${DEFAULT_PATHS[@]}")
fi

echo "# inventory written $(date '+%Y-%m-%d %H:%M') on $(hostname) by ${USER:-unknown}"

for top in "${PATHS[@]}"; do
  echo
  echo "=== $top"
  if [ ! -d "$top" ]; then
    echo "MISSING"
    continue
  fi

  echo "--- directories (depth <= 3, run-numbered ones left out)"
  find "$top" -maxdepth 3 -type d ! -regex '.*/[0-9]+' | sort

  echo "--- files per directory"
  printf 'directory\tn_files\tsize_GB\tnewest\truns\texample\n'
  # %h = directory, %s = size in bytes, %T@ = modification time (epoch seconds), %f = file name
  find "$top" -type f -printf '%h\t%s\t%T@\t%f\n' | awk -F'\t' '
    {
      dir = $1; run = ""
      # merge run-numbered directories: /.../processed_EBV2/4123 -> /.../processed_EBV2/<run>
      if (match(dir, /\/[0-9]+$/)) {
        run = substr(dir, RSTART + 1) + 0
        dir = substr(dir, 1, RSTART - 1) "/<run>"
      }
      n[dir]++
      bytes[dir] += $2
      if ($3 > newest[dir]) newest[dir] = $3
      if (!(dir in example)) example[dir] = $4
      if (run != "") {
        if (!((dir, run) in seen)) { seen[dir, run] = 1; nruns[dir]++ }
        if (!(dir in rmin) || run < rmin[dir]) rmin[dir] = run
        if (run > rmax[dir]) rmax[dir] = run
      }
    }
    END {
      for (d in n) {
        runs = (d in rmin) ? nruns[d] " runs " rmin[d] "-" rmax[d] : ""
        printf "%s\t%d\t%.2f\t%s\t%s\t%s\n", d, n[d], bytes[d] / 1e9, strftime("%Y-%m-%d", newest[d]), runs, example[d]
      }
    }' | sort
done
