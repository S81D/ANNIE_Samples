# Generation 1: Calibration and tuning data

Filtered data samples for detector calibration and for tuning the simulation.

## Laser data, 2023 { #laser-2023 }

<span class="badge available">Available</span>

Laser ntuples made with the BeamClusterAnalysis toolchain and used in the 2023 PMT timing calibration
([DocDB 5366](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5366),
[DocDB 5404](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=5404), and Steven Doran's
thesis). Analysis code: [S81D/ANNIE_PicoLaser](https://github.com/S81D/ANNIE_PicoLaser).

| Stage | Software | Path |
|---|---|---|
| Laser ntuples, runs 4691, 4692, 4694, 4695 (`<run>_laser.ntuple.root`) | BeamClusterAnalysis toolchain, ToolAnalysis TBD | `/pnfs/annie/persistent/users/doran/datasets/laser_data/v1` |
| Hits in the laser window, all charges (`laser_data_all_charges.root`) | filtered from the ntuples | `/pnfs/annie/persistent/users/doran/datasets/laser_data/v1` |
| Hits in the laser window, single PE only (`laser_data_singlePE.root`) | filtered from the ntuples | `/pnfs/annie/persistent/users/doran/datasets/laser_data/v1` |

The filtered files keep only hits (time and charge per hit) in the laser window: laser trigger 47 and
hit time 450 < t < 500 ns.

The gains-integration files were made after the hit finding was updated for the gains calibration
campaign. They were not used for the timing analysis, but have effectively the same hit timing.

**Contact:** Steven Doran

## MC tuning data { #mc-tuning-data }

<span class="badge available">Available</span>

Filtered data ntuples of cluster candidates, extracted from data BeamCluster ntuples with the selection
cuts in [S81D/MC_tuning](https://github.com/S81D/MC_tuning) and
[S81D/AmBe_neutron_candidates](https://github.com/S81D/AmBe_neutron_candidates). Used to
[tune the detector simulation](mc.md#tunings); the matching WCSim samples are under
[MC tuning samples](mc.md#mc-tuning-samples).

| File | Sample | Event building | Path |
|---|---|---|---|
| `Michels_v1.root` | Michel electrons | Gen 1 ([FreezeForEBV2_v1.0](https://github.com/fengyvoid/ToolAnalysis/tree/FreezeForEBV2_v1.0)) | `/pnfs/annie/persistent/users/doran/datasets/tuning_data` |
| `throughgoing_muons_v1.root` | Through-going muons | Gen 1 ([FreezeForEBV2_v1.0](https://github.com/fengyvoid/ToolAnalysis/tree/FreezeForEBV2_v1.0)) | `/pnfs/annie/persistent/users/doran/datasets/tuning_data` |
| `neutron_candidates_v5.root` | AmBe neutron candidates | older EBV2 branch with the PhaseIIADCCalibrator fix and the new hit finding (same hit charge as Gen 1) | `/pnfs/annie/persistent/users/doran/datasets/tuning_data` |

The Michel and through-going-muon samples come from the Gen 1
[ProcessedData](data.md#processeddata) and [BeamClusterTrees](data.md#beamclustertrees).

**Contact:** Steven Doran
