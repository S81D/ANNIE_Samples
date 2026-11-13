# Deprecated samples

Superseded samples, kept so past results can be reproduced. Don't start new work with them.

## Data { #data }

None yet.

## MC { #mc }

### `standard` GENIE, anniedirt and WCSim { #mc-standard }

<span class="badge deprecated">Deprecated</span>

**Why:** each file of 20,000 GENIE events used a single flux file, so the same beam neutrinos were
sampled many times and the true-energy spectra have spikes. Replaced by the `standardv1.0` GENIE and
anniedirt files used by the current [central value](gen1/mc.md#central-value). The old request sheet
also marked these WCSim files "incorrect QE".

| Stage | Path | Contents |
|---|---|---|
| GENIE | `/pnfs/annie/persistent/simulations/genie3/G1810a0211a/standard` | `hall`, `michel`, `tank` (with `ntuples`), `upstream`, `world` |
| anniedirt | `/pnfs/annie/persistent/simulations/g4dirt/G1810a0211a/standard` | `hall`, `michel`, `tank`, `upstream`, `world` |
| WCSim | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standard` | `hall`, `michel`, `michel2`, `tank` (with `pmt2`, `lappd2`, `pmt_train`, `lappd_train`), `upstream`, `world` |

### WCSim `standardv2.0.0_tilt` { #wcsim-tilt }

<span class="badge deprecated">Deprecated</span>

**Why:** the PMTs are tilted 53° but not shifted, which is no longer the best approximation of the
detector. Replaced by the tilted-and-shifted [central value](gen1/mc.md#central-value). Also holds test
samples for the tilt and for Yue Feng's LAPPD modifications.

| Stage | Path | Contents |
|---|---|---|
| WCSim | `/pnfs/annie/persistent/simulations/wcsim/G1810a0211a/standardv2.0.0_tilt` | `tank`, `world` (each `pmt`, `lappd`) |
