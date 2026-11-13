# Run periods and POT

## Run periods

Beam data from FY22 onward can be event-built. Earlier data used a different DAQ configuration and
currently cannot be.

| Period | ANNIE run | Dates | DAQ runs | ≈ POT (TOR860) | In Gen 1 | Notes |
|---|---|---|---|---|---|---|
| FY22 | 3 (partial) | Jan–Jul 2022 | 3207–3844 | 2.04e20 | yes | single LAPPD |
| FY23 SANDI I | 4 | Mar–May 2023 | 4208–4314 | 0.51e20 | yes, own subset | **WbLS target** ([JINST 19 P05070](https://iopscience.iop.org/article/10.1088/1748-0221/19/05/P05070)): do not use unless doing WbLS |
| FY23 rest | 4 | Dec 2022–Jul 2023 | 4001–4207, 4315–4450 | 1.75e20 | yes | mostly single LAPPD |
| FY24 MRD stable | 5 | Feb–May 2024 | 4725–4809 | 0.49e20 | yes | multi-LAPPD |
| FY24 MRD rack 8 fault | 5 | May–Jul 2024 | 4810–4965 | 0.85e20 | **no** | limited MRD and FMV performance |
| FY25 SANDI II | 6 | Nov 2024–Feb 2025 | 5081–5328 | 0.88e20 | yes, own subset | **WbLS target**: do not use unless doing WbLS |
| FY25 rest | 6 | Feb–Jul 2025 | 5329–5668 | 2.65e20 | yes | multi-LAPPD |
| FY26 | 7 | — | — | — | no (Gen 2) | PMTs repaired in Dec 2025: "golden" data from Jan 2026 |
| FY27 | — | taking data now | — | — | no (Gen 2) | repaired PMTs |

Fiscal-year totals: FY22 2.04e20, FY23 2.26e20, FY24 1.34e20, FY25 3.53e20. Generation 1 holds about
8.3e20 POT, 6.9e20 of it without SANDI.

!!! info "PMT configuration"
    From FY22 until the PMT repairs in December 2025 the WB and Watchman PMTs were tilted, so all
    Generation 1 data has tilted PMTs, as does the [Gen 1 MC central value](gen1/mc.md#tunings). Data from
    January 2026 onward (midway through FY26) has the repaired PMTs, and the MC has not been tuned for it.

!!! warning "Extended readout, FY23"
    About 40 runs between 4191 and 4410 (in both SANDI I and the rest of FY23) have almost no extended
    readout (rate below 10⁻³). See
    [DocDB 5166](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5166).

The per-run list (fiscal year, TOR860 POT, SANDI, MRD rack 8 fault and extended-readout flags) is
attached to the Summer 2026 data-quality talk (S. Doran). Runs with fewer than three part files are left
out of it.

## POT { #pot }

The POT above is approximate: it comes from CTC-recorded beam triggers and is meant for planning.
**Report the POT of an analysis from the events you selected.** POT per trigger is stored with each event
in the ProcessedData BoostStore and in the BeamCluster ntuples (`beam_E_TOR860`, `beam_pot_875`).
Use one toroid throughout and say which. TOR860 is the usual choice (MicroBooNE and the ANNIE CC and NC
analyses).

| Resource | Where |
|---|---|
| POT tables by run, FY23 | [DocDB 5607](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5607) |
| POT tables by run, FY24 | [DocDB 5604](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5604) |
| POT tables by run, FY25 | [DocDB 6198](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6198) |
| Good-beam POT and trigger counts by run, FY22–FY23 (NCQE run selection) | [`POT_trigger_FY22_23_summary.csv`](https://github.com/S81D/NCQE_XS_analysis/blob/main/lib/POT_trigger_FY22_23_summary.csv) |
| Beam-device and POT files, one per run (`beamfetcher_<run>.root`) | `/pnfs/annie/persistent/processed/BeamFetcherV2` |

## How many events?

For a rough size estimate: FY22–FY23 recorded about **2.4e5 triggers per 1e18 POT** (all trigger types).
In the NCQE run selection, that is about 4.1e7 triggers in 1.8e20 POT for FY22, and 2.0e7 triggers in
0.82e20 POT for FY23. Other years may differ.
