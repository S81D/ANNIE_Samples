# Generation 1: MC

The simulation chain is **BNB flux (gsimple) → GENIE → anniedirt → WCSim → MC ntuples (ToolAnalysis)**.
New productions use [ANNIE_MC_Production](https://github.com/S81D/ANNIE_MC_Production).

Central productions live under
`/pnfs/annie/persistent/simulations/<software>/G1810a0211a/<production>/<volume>/`, where `<software>` is
`genie3`, `g4dirt` (anniedirt) or `wcsim`, and WCSim adds a `pmt/` or `lappd/` level.

## Software { #software }

| Stage | Repository | Version |
|---|---|---|
| GENIE | [ANNIEsoft/GENIE-v3](https://github.com/ANNIEsoft/GENIE-v3) | GENIE v3.0.6, tune G18_10a_02_11a |
| anniedirt | [ANNIEsoft/anniedirt](https://github.com/ANNIEsoft/anniedirt/tree/genie_3_0_6) | branch `genie_3_0_6` (container image `anniesoft/g4dirt:latest`) |
| WCSim | [ANNIEsoft/WCSim](https://github.com/ANNIEsoft/WCSim) | [v2.0.0-ANNIE](https://github.com/ANNIEsoft/WCSim/releases/tag/v2.0.0-ANNIE), [v2.1.0-ANNIE](https://github.com/ANNIEsoft/WCSim/releases/tag/v2.1.0-ANNIE) |
| WCSim, NC tuning | [S81D/WCSim](https://github.com/S81D/WCSim) | not yet merged into ANNIEsoft/WCSim |

anniedirt carries the GENIE final-state particles through the rock and hall until they reach the tank
water or another detector volume (MRD, FMV). Only those events go on to WCSim: for world samples that is
about 650 of the 20,000 events in each GENIE file, for tank samples nearly all of them.

## PMT configuration and tunings { #tunings }

From FY22 until the PMT repairs in December 2025, the WB and Watchman PMTs were tilted. In WCSim this is
modelled as a 53° tilt from the panel normal plus a 13.9 cm upward shift along the tank height.

**The MC has only been tuned for the tilted configuration, so the tilted geometry is the central value.**
Before the tilt was found, the MC assumed untilted PMTs. Because the tilt in the simulation is only
approximate, that untilted geometry is kept as a detector variation.

!!! warning "Data after the PMT repairs"
    Data from January 2026 onward (midway through FY26) has the repaired PMTs. The MC has **not** been
    tuned for it.

| Tuning | WCSim settings | Code |
|---|---|---|
| **CC tuning** | QE ratio 1.025 set in WCSim; parametric PMT model | [ANNIEsoft/WCSim](https://github.com/ANNIEsoft/WCSim) [v2.0.0-ANNIE](https://github.com/ANNIEsoft/WCSim/releases/tag/v2.0.0-ANNIE), [v2.1.0-ANNIE](https://github.com/ANNIEsoft/WCSim/releases/tag/v2.1.0-ANNIE) |
| **NC tuning** | PMT waveform simulation; PMT collection efficiency; QE ratio 1.50 | [S81D/WCSim](https://github.com/S81D/WCSim) (not yet merged into ANNIEsoft/WCSim) |

Unless a sample says otherwise, WCSim uses the Geant4 physics list **FTFP_BERT_HP** with the **ANNRI**
neutron-capture model.

The tuning to through-going muons and Michel electrons is described in *MC Tuning and Validation*
(S. Doran, [DocDB 5962](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5962)).
ANNIE's WCSim has diverged from upstream WCSim: its tags start at v2.0.0-ANNIE, and earlier tags in the
repository are upstream's.

## Central value (CC tuning) { #central-value }

GENIE v3.0.6 with tune G18_10a_02_11a ([ANNIEsoft/GENIE-v3](https://github.com/ANNIEsoft/GENIE-v3)) and
anniedirt, both from the `standardv1.0` production, then WCSim v2.1.0-ANNIE with the tilted and shifted
PMTs and the CC tuning. Each GENIE file has 20,000 events drawn from 50 randomly chosen flux files, which
gives smooth true-energy spectra. The older `standard` production drew each file from a single flux file
and is [deprecated](../deprecated.md#mc-standard).

!!! tip "POT normalisation"
    GENIE stores the POT of each file as the weight of its `gtree` tree (`gtree->GetWeight()` in the ghep
    file; see [pot_from_ghep.py](https://github.com/S81D/ANNIE_MC_Production/blob/main/helpers/pot_from_ghep.py)).
    Normalise by summing it over the GENIE files behind the WCSim files you use. The per-event numbers below
    are for estimates only.

!!! note "WCSim version"
    The WCSim directory is called `standardv2.0.0_tilt_shift`, but it was made with WCSim
    **v2.1.0-ANNIE**. It also holds test samples for Yue Feng's LAPPD modifications.

### Central value: tank { #cv-tank }

<span class="badge recommended">Recommended</span>

Neutrino interactions in the tank.

| Stage | Software | Path |
|---|---|---|
| Flux | BNB gsimple, version TBD | `/pnfs/annie/persistent/users/jminock/flux` |
| GENIE | GENIE v3.0.6, G18_10a_02_11a | `/pnfs/annie/persistent/simulations/genie3/G1810a0211a/standardv1.0/tank` |
| anniedirt | anniedirt `genie_3_0_6` | `/pnfs/annie/persistent/simulations/g4dirt/G1810a0211a/standardv1.0/tank` |
| WCSim, PMT | WCSim v2.1.0-ANNIE, tilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0_tilt_shift/tank/pmt` |
| WCSim, LAPPD | WCSim v2.1.0-ANNIE, tilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0_tilt_shift/tank/lappd` |
| MC ntuples | — | not yet available |

**POT:** about 7.7e18 per GENIE file of 20,000 events, so about 3.9e14 per event · **Produced by:** James Minock ·
**Contact:** Andy Mastbaum or Steven Doran

### Central value: world { #cv-world }

<span class="badge recommended">Recommended</span>

Neutrino interactions anywhere in the world volume.

| Stage | Software | Path |
|---|---|---|
| Flux | BNB gsimple, version TBD | `/pnfs/annie/persistent/users/jminock/flux` |
| GENIE | GENIE v3.0.6, G18_10a_02_11a | `/pnfs/annie/persistent/simulations/genie3/G1810a0211a/standardv1.0/world` |
| anniedirt | anniedirt `genie_3_0_6` | `/pnfs/annie/persistent/simulations/g4dirt/G1810a0211a/standardv1.0/world` |
| WCSim, PMT | WCSim v2.1.0-ANNIE, tilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0_tilt_shift/world/pmt` |
| WCSim, LAPPD | WCSim v2.1.0-ANNIE, tilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0_tilt_shift/world/lappd` |
| MC ntuples | — | not yet available |

**POT:** about 5.5e16 per file (5000 files ≈ 2.8e20). Each WCSim file holds the events of one GENIE file
that reach the detector, about 650, so about 8.4e13 POT per WCSim event · **Produced by:** James Minock ·
**Contact:** Andy Mastbaum or Steven Doran

## Detector variations (CC tuning) { #detector-variations }

### Untilted PMTs { #untilted }

<span class="badge available">Available</span>

The central-value GENIE and anniedirt files with the PMTs in their untilted positions (WCSim
v2.0.0-ANNIE, CC tuning).

| Stage | Software | Path |
|---|---|---|
| GENIE, anniedirt | as the [central value](#central-value) | `/pnfs/annie/persistent/simulations/genie3/G1810a0211a/standardv1.0`, `/pnfs/annie/persistent/simulations/g4dirt/G1810a0211a/standardv1.0` |
| WCSim, tank, PMT | WCSim v2.0.0-ANNIE, untilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0/tank/pmt` |
| WCSim, tank, LAPPD | WCSim v2.0.0-ANNIE, untilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0/tank/lappd` |
| WCSim, world, PMT | WCSim v2.0.0-ANNIE, untilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0/world/pmt` |
| WCSim, world, LAPPD | WCSim v2.0.0-ANNIE, untilted PMTs, CC tuning | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0/world/lappd` |

**POT:** as the central value · **Produced by:** James Minock · **Contact:** Andy Mastbaum or Steven Doran

## NC-tuned samples { #nc-samples }

Samples made for the NCQE analysis with the NC tuning: world volume, tilted and shifted PMTs, PMT files
only, unless stated otherwise. **Contact:** Steven Doran.

### NC tuning: GENIE-Base { #nc-tuning }

<span class="badge analysis">Analysis-specific</span>

A separate GENIE and anniedirt production with the same GENIE build and configuration as the central
value: statistically independent, but otherwise nearly identical. Simulated in WCSim with both the NC
and the CC tuning.

| Stage | Software | Path |
|---|---|---|
| GENIE (ghep, gst, POT) | GENIE v3.0.6, G18_10a_02_11a | `/pnfs/annie/persistent/users/doran/GENIE-Base/genie` |
| anniedirt | anniedirt `genie_3_0_6` | `/pnfs/annie/persistent/users/doran/GENIE-Base/anniedirt/annie` |
| WCSim, PMT, **NC tuning** | [S81D/WCSim](https://github.com/S81D/WCSim), tilted PMTs | `/pnfs/annie/persistent/users/doran/GENIE-Base/wcsim/pmts` |
| WCSim, PMT, CC tuning | WCSim v2.1.0-ANNIE (as the central value), tilted PMTs | `/pnfs/annie/persistent/users/doran/GENIE-Base/wcsim/CC_tuning` |

**POT:** about 4.4e20 in 4000 files

### Detector variations (NC tuning) { #nc-variations }

<span class="badge analysis">Analysis-specific</span>

WCSim with the NC tuning, each changing one thing. The input is the central-value world GENIE and
anniedirt files ([`standardv1.0/world`](#cv-world)), **not** GENIE-Base:
`/pnfs/annie/persistent/simulations/genie3/G1810a0211a/standardv1.0/world` and
`/pnfs/annie/persistent/simulations/g4dirt/G1810a0211a/standardv1.0/world`.

| Variation | What changes | Path |
|---|---|---|
| Untilted PMTs | PMTs in their untilted positions | `/pnfs/annie/persistent/users/doran/WCSim_genie_untilted_samples` |
| Physics list: QGSP_BIC_HP | Geant4 physics list (instead of FTFP_BERT_HP with ANNRI) | `/pnfs/annie/persistent/users/doran/WCSim_genie_physics_list_variations/QGSP_BIC_HP` |
| Physics list: QGSP_INCLXX_HP | Geant4 physics list (instead of FTFP_BERT_HP with ANNRI) | `/pnfs/annie/persistent/users/doran/WCSim_genie_physics_list_variations/QGSP_INCLXX_HP` |
| QE scale | NC tuning shifted by its assigned uncertainty: tuned to Michel electrons instead, with the same waveform simulation and tuning machinery | `/pnfs/annie/persistent/users/doran/WCSim_genie_VARY_QE_SCALE_samples/rce_0.95` |

## Alternative models (fake data) { #alternative-models }

### GENIE with the empirical ¹⁶O model { #genie-o16 }

<span class="badge analysis">Analysis-specific</span>

GENIE with the updated oxygen model used in the NCQE analysis
([S81D/GENIE-v3-O16](https://github.com/S81D/GENIE-v3-O16)), in the world volume, then anniedirt and
WCSim with the NC tuning and tilted PMTs, PMT files only.

| Stage | Software | Path |
|---|---|---|
| GENIE (ghep, gst, POT) | S81D/GENIE-v3-O16 | `/pnfs/annie/persistent/users/doran/GENIE-016-empirical-model/genie` |
| anniedirt | anniedirt `genie_3_0_6` | `/pnfs/annie/persistent/users/doran/GENIE-016-empirical-model/anniedirt/annie` |
| WCSim, PMT, NC tuning | [S81D/WCSim](https://github.com/S81D/WCSim), tilted PMTs | `/pnfs/annie/persistent/users/doran/GENIE-016-empirical-model/wcsim/pmts` |

**POT:** about 4.4e20 in 4000 files · **Contact:** Steven Doran

## Special samples { #special }

### MC tuning samples (NC tuning) { #mc-tuning-samples }

<span class="badge analysis">Analysis-specific</span>

WCSim samples (tilted PMTs, NC tuning) that match the
[MC tuning data](calibration.md#mc-tuning-data). Tuning code:
[S81D/MC_tuning](https://github.com/S81D/MC_tuning).

| Sample | Path |
|---|---|
| AmBe source: ports 1, 3, 4 and 5, each at z = −100, −50, 0, 50, 100 cm (one directory per position, e.g. `port1_z0_QE_1.50_WB_ETEL_LUX_1.0_HM_WM_1.25`) | `/pnfs/annie/persistent/users/doran/WCSim_AmBe_samples/PMT_tilt/QE_1.50_HM_1.25` |
| Michel electrons | `/pnfs/annie/persistent/users/doran/WCSim_dirt_samples/PMT_tilt/QE_1.50_HM_1.25` |
| Michel electrons, more statistics | `/pnfs/annie/persistent/users/doran/WCSim_dirt_samples/PMT_tilt/QE_1.50_HM_1.25_2` |

**Contact:** Steven Doran

### Skyshine neutrons { #skyshine }

<span class="badge analysis">Analysis-specific</span>

Neutron-gun WCSim samples of skyshine neutrons (NC tuning), from Steven Doran's thesis
([DocDB 6712](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6712)). The directories `1/`,
`2/` and `3/` have the same configuration; together they give more statistics.

| Stage | Software | Path |
|---|---|---|
| WCSim, PMT | S81D/WCSim, NC tuning | `/pnfs/annie/persistent/users/doran/simulated_skyshine` |

**Contact:** Steven Doran

## MC ntuples { #mc-ntuples }

None listed yet. Official MC ntuples will come from
[ANNIE_MC_Production](https://github.com/S81D/ANNIE_MC_Production).
