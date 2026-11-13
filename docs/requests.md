# Requesting a sample

Requests are GitHub issues made from a form (you need a GitHub account).
[Open a request](https://github.com/S81D/ANNIE_Samples/issues/new/choose) and pick the form that fits:

| Form | Label | Use it for |
|---|---|---|
| MC sample request | `MC` | New simulation: GENIE, anniedirt, WCSim, MC ntuples, particle guns, cosmics |
| Fake-data request | `FakeData` | Samples from an alternative model or generator, or reweighted samples, used as fake data |
| Data sample request | `Data` | Special data processing: calibration samples, run selections, reprocessing, filtered ntuples |
| Report a problem with a sample | `sample-problem` | A wrong path, missing or broken files, or a wrong description on this site |

## Before you ask

- Check the [recommended samples](index.md#recommended-samples): an existing sample may already do.
- dCache space is shared by all of ANNIE. A full MC production (4000 runs, all stages) takes about
  0.4 TB. Ask for what you need.

## What happens next

1. A new request gets the label `status: new`.
2. The maintainers review it and set `status: approved` or `status: declined` (with the reason).
3. While it is being made: `status: in production`.
4. When it is ready, a pull request adds the sample to this site and closes the issue, so every sample
   links back to its request.
