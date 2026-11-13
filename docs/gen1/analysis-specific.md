# Generation 1: Analysis-specific data

Data made for one analysis. Check with the contact before relying on it.

!!! danger "Blinded data"
    These samples are extracted from the full Generation 1 beam data, which is **blinded**. Please contact
    the analysis coordinators, Jingbo Wang and Andy Mastbaum, before accessing them, and follow the
    [blinding scheme](../getting-started.md#blinding).

## NCQE BeamCluster data { #ncqe }

<span class="badge analysis">Analysis-specific</span>

BeamCluster ntuples and filtered ("extracted") ntuples used in the NCQE cross-section analysis
([S81D/NCQE_XS_analysis](https://github.com/S81D/NCQE_XS_analysis)). The filtering follows the good-beam
and off-beam selections of
[DocDB 6699](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6699).

| Stage | Software | Path |
|---|---|---|
| BeamCluster ntuples | TBD | `/pnfs/annie/persistent/users/doran/datasets/NCQE_BEAMCLUSTER_DATA` |
| Filtered beam data | extraction script in NCQE_XS_analysis | `/pnfs/annie/persistent/users/doran/datasets/NCQE_BEAMCLUSTER_DATA/EXTRACTED_FULL_BEAM_DATA` |
| Filtered off-beam data | extraction script in NCQE_XS_analysis | `/pnfs/annie/persistent/users/doran/datasets/NCQE_BEAMCLUSTER_DATA/EXTRACTED_FULL_OFFBEAM_DATA` |

!!! warning "Off-beam data"
    The MRD and FMV are not recorded in off-beam triggers.

**POT and triggers by run (FY22–FY23):**
[`POT_trigger_FY22_23_summary.csv`](https://github.com/S81D/NCQE_XS_analysis/blob/main/lib/POT_trigger_FY22_23_summary.csv),
389 runs, about 2.6e20 POT (TOR860, good beam) and 6.1e7 triggers.
**Contact:** Steven Doran
