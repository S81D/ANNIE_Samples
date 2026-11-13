# Getting started

## Before you analyse data

The reference is the technote **Preparing Data for Analysis** (S. Doran,
[DocDB 6699](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6699)). In short:

1. **Start from an existing processed sample.** Re-process raw data only if your analysis needs a
   different event building or reconstruction.
2. **Follow the [blinding scheme](#blinding).** Develop on MC first. The
   [2% unblinded subset](gen1/data.md#two-percent) is the first look at data in the signal region.
3. **Select good-beam triggers:** the undelayed beam trigger, horn current, toroid range and agreement,
   and a paired PMT timestamp. Where needed, also require bunch rotation off, a good BRF fit, and the
   extended-readout mode you want. The cut values are in the technote.
4. **Compute POT from the triggers you selected**, with one toroid (TOR860 is the usual choice). The
   [run-period POT](run-periods.md#pot) is for planning only.
5. **MC and data use different timing references.** Do not copy an absolute `hitT` cut from MC to data.
6. **Off-beam triggers have no MRD or FMV data.** If your selection needs them, use the pre-beam window to
   estimate beam-uncorrelated backgrounds.

## Blinding { #blinding }

ANNIE analyses look at data in stages. The scheme written for the first νμ CC analysis (J. Minock and
A. Mastbaum, *Blindness Scheme for ANNIE CC Analysis*,
[DocDB 6259](https://annie-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=6259&filename=annie_cc_blindness.pdf&version=1))
is the model:

1. **MC only.** Develop the whole analysis on the [GENIE central value](gen1/mc.md#central-value): signal
   definition, selection, observables and binning, POT normalisation, systematics, unfolding.
2. **Data sidebands.** Check the analysis on control regions outside the signal region, filtered from
   the full data.
3. **2% of the data.** The first look at the signal region, using the
   [2% unblinded subset](gen1/data.md#two-percent). This is the last chance to change the analysis.
4. **10% of the data.** A final check before full unblinding.
5. **Full data.**

The results of each stage are shown to the collaboration before moving to the next. Analyses with
neutrons, other final states or other detector configurations may need their own version of the scheme.

**Analysis coordinators:** Jingbo Wang ([jingbo.wang@sdsmt.edu](mailto:jingbo.wang@sdsmt.edu)) and
Andy Mastbaum ([mastbaum@physics.rutgers.edu](mailto:mastbaum@physics.rutgers.edu)). Contact them before
accessing blinded data.

## Glossary

ProcessedData
:   Event-built data: ToolAnalysis BoostStores with the PMT, MRD, LAPPD, trigger and beam information
    of each event, one directory of part files per run. Beam information (POT per trigger) is stored with
    each event.

BeamClusterTrees (BeamCluster ntuples)
:   ROOT ntuples made from ProcessedData by the BeamClusterAnalysis toolchain (ANNIEEvent tree `Event`):
    event, trigger, beam, PMT-cluster and MRD information.

EBV2
:   Event building version 2 (Yue Feng,
    [DocDB 6043](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6043)).

Generation (Gen 1, Gen 2)
:   One consistent processing of the data, and the MC meant to be compared with it.

ghep, gst
:   GENIE output: the full event record (ghep) and the flat summary tree (gst).

anniedirt (g4dirt)
:   Geant4 propagation of the GENIE final state through the rock and hall to the detector.

WCSim `pmt` and `lappd` files
:   WCSim writes the PMT and LAPPD responses to separate files.

CC tuning, NC tuning
:   The two WCSim detector-response tunings. See [Gen 1 MC](gen1/mc.md#tunings).

SANDI
:   A water-based liquid scintillator (WbLS) target in the tank, deployed in SANDI I (Mar–May 2023; see
    [JINST 19 P05070](https://iopscience.iop.org/article/10.1088/1748-0221/19/05/P05070)) and SANDI II
    (Nov 2024–Feb 2025). Do not use those runs unless you are doing a WbLS analysis.

TOR860, TOR875
:   The two BNB toroids that measure protons on target (POT). They agree to within a few percent.

## Status labels { #status-labels }

| Label | Meaning |
|---|---|
| <span class="badge recommended">Recommended</span> | The default choice for its purpose. |
| <span class="badge available">Available</span> | Valid and documented, but not the default. |
| <span class="badge analysis">Analysis-specific</span> | Made for one analysis, often in a personal area. Check with the contact before relying on it. |
| <span class="badge production">In production</span> | Being produced. Paths and contents may change. |
| <span class="badge planned">Planned</span> | Not produced yet. |
| <span class="badge dq">DQ only</span> | Data-quality processing. Not for final analyses. |
| <span class="badge deprecated">Deprecated</span> | Superseded and kept for reproducibility. Listed on [Deprecated](deprecated.md). |
