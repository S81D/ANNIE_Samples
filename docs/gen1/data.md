# Generation 1: Data

Generation 1 is the FY22–FY25 beam data event-built with **EBV2** by Yue Feng and Steven Doran, using
[fengyvoid/ToolAnalysis v1.1](https://github.com/fengyvoid/ToolAnalysis/releases/tag/v1.1) run through
[autoANNIE](https://github.com/ANNIEsoft/autoANNIE). It is the data behind the CC-inclusive, CC0π,
MicroBooNE–ANNIE CC0π joint, NCQE and first LAPPD
([JINST 21 P02002](https://iopscience.iop.org/article/10.1088/1748-0221/21/02/P02002)) analyses, and the
theses of Steven Doran ([DocDB 6712](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6712)),
James Minock ([DocDB 6976](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6976)) and
Yue Feng ([DocDB 6705](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6705)).

It covers FY22, FY23 (including SANDI I), FY24 runs 4725–4809 (MRD stable), and FY25 (including
SANDI II): about 8.3e20 POT. See [Run periods and POT](../run-periods.md).

!!! danger "Blinded data"
    The full Generation 1 ProcessedData and BeamClusterTrees are **blinded**. Please contact the analysis
    coordinators, Jingbo Wang and Andy Mastbaum, before accessing them, and follow the
    [blinding scheme](../getting-started.md#blinding).

!!! warning "SANDI runs"
    SANDI I (runs 4208–4314; [JINST 19 P05070](https://iopscience.iop.org/article/10.1088/1748-0221/19/05/P05070))
    and SANDI II (runs 5081–5328) had a WbLS target in the tank. Do not use them unless you are doing a WbLS
    analysis.

## ProcessedData { #processeddata }

<span class="badge recommended">Recommended</span>

Fully event-built data, one directory of processed part files per run.

| Stage | Software | Path |
|---|---|---|
| ProcessedData | EBV2, [fengyvoid/ToolAnalysis v1.1](https://github.com/fengyvoid/ToolAnalysis/releases/tag/v1.1) | `/pnfs/annie/persistent/processed/processingData_EBV2/processed_EBV2/<run>/` |

**POT:** about 8.3e20 (stored per event in the BoostStore) · **Contact:** Steven Doran

## BeamClusterTrees { #beamclustertrees }

<span class="badge recommended">Recommended</span>

Analysis ntuples made from the ProcessedData above with the BeamClusterAnalysis toolchain.

| Stage | Software | Path |
|---|---|---|
| ProcessedData | EBV2, fengyvoid/ToolAnalysis v1.1 | `/pnfs/annie/persistent/processed/processingData_EBV2/processed_EBV2/<run>/` |
| BeamCluster ntuples | BeamClusterAnalysis toolchain, ToolAnalysis TBD | `/pnfs/annie/persistent/processed/processingData_EBV2/BeamClusterTrees` |

**Contact:** Steven Doran

## 2% unblinded subset { #two-percent }

<span class="badge recommended">Recommended for development</span>

Lets analyzers work on real data without risk of unblinding: to check MC–data compatibility of a
selection as it matures, and for calibration and tuning. It is stage 3 of the
[blinding scheme](../getting-started.md#blinding). **ProcessedData only.**

About 2% of the POT of each period, chosen at random by POT per run and keeping whole runs together.

| Stage | Software | Path |
|---|---|---|
| ProcessedData | EBV2, fengyvoid/ToolAnalysis v1.1 | `/pnfs/annie/persistent/processed/ANNIE_2_percent_unblinded_data/GEN1/<period>/<run>/` |

| Period directory | Dates | POT in subset | POT of full period | ≈ triggers in subset |
|---|---|---|---|---|
| `FY22/` | Jan–Jul 2022 | 4.08e18 | 2.04e20 | 1.0e6 |
| `FY23/SANDI_I/` | Mar–May 2023 | 1.02e18 | 0.51e20 | 2.4e5 |
| `FY23/FY23_REST/` | Dec 2022–Jul 2023 | 3.50e18 | 1.75e20 | 8.4e5 |
| `FY24/MRD_STABLE/` | Feb–May 2024 | 0.98e18 | 0.49e20 | 2.4e5 |
| `FY25/SANDI_II/` | Nov 2024–Feb 2025 | 1.75e18 | 0.88e20 | 4.2e5 |
| `FY25/FY25_REST/` | Feb–Jul 2025 | 5.30e18 | 2.65e20 | 1.3e6 |

The trigger counts are estimates from the FY22–FY23 rate (2.4e5 per 1e18 POT). POT is TOR860.

**Contact:** Steven Doran

## Data-quality processing { #dq }

<span class="badge dq">DQ only</span>

ProcessedData made for data-quality monitoring with various ToolAnalysis versions.
**Do not use it for final analyses**; use the [Gen 1 ProcessedData](#processeddata) instead.

| Stage | Software | Path |
|---|---|---|
| ProcessedData | various ToolAnalysis versions | `/pnfs/annie/persistent/processed/processed_EBV2` |

!!! warning "Similar paths"
    `processed/processed_EBV2` (this one, DQ) and `processed/processingData_EBV2/processed_EBV2`
    (Gen 1) are easy to mix up.
