# ANNIE Data and MC Samples

Where to find ANNIE's production data and simulation samples, which ones to use, and how to ask for
new ones.

!!! tip "New to ANNIE data?"
    Start with [Getting started](getting-started.md) and the technote *Preparing Data for Analysis*
    ([DocDB 6699](https://annie-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=6699)).

## Recommended samples

| If you need | Use | Status |
|---|---|---|
| Beam data to develop an analysis | [Gen 1 2% unblinded subset](gen1/data.md#two-percent) | <span class="badge recommended">Recommended</span> |
| Beam data for a final analysis | [Gen 1 ProcessedData](gen1/data.md#processeddata) and [BeamClusterTrees](gen1/data.md#beamclustertrees) (blinded) | <span class="badge recommended">Recommended</span> |
| Neutrino interactions in the tank | [Gen 1 MC central value: tank](gen1/mc.md#cv-tank) | <span class="badge recommended">Recommended</span> |
| Neutrino interactions in the whole geometry | [Gen 1 MC central value: world](gen1/mc.md#cv-world) | <span class="badge recommended">Recommended</span> |
| MC with untilted PMTs (detector variation) | [Untilted PMTs](gen1/mc.md#untilted) | <span class="badge available">Available</span> |
| The newest processing | [Gen 2 data](gen2/data.md) | <span class="badge production">In production</span> |

## How this site is organised

- Samples are grouped by **generation**: one consistent processing of the data, plus the MC meant to be
  compared with it.
    - **Generation 1:** FY22–FY25 data event-built with EBV2. This is the data in the current
      publications and theses.
    - **Generation 2:** reprocessing with ToolAnalysis V1.6.0, starting with FY25.
- Every sample has a **status** label. The labels are explained in
  [Getting started](getting-started.md#status-labels).
- Samples are given as **dCache paths**. SAM definitions will be added later.
- Superseded samples are on the [Deprecated](deprecated.md) page, with the reason for each.

## Requesting a sample

Requests are GitHub issues made from a form:
[open a request](https://github.com/ANNIEsoft/ANNIE_Samples/issues/new/choose). The forms and what happens
next are described on [Requesting a sample](requests.md).

## Contacts { #contacts }

| Who | For |
|---|---|
| Steven Doran ([doran@fnal.gov](mailto:doran@fnal.gov)) | This site; Gen 1 data; the central MC (with Andy); NC-tuned MC |
| Andy Mastbaum ([mastbaum@physics.rutgers.edu](mailto:mastbaum@physics.rutgers.edu)) | Analysis coordinator; the central MC (with Steven) |
| Jingbo Wang ([jingbo.wang@sdsmt.edu](mailto:jingbo.wang@sdsmt.edu)) | Analysis coordinator |
| Anuj Gupta ([anujg23@iitk.ac.in](mailto:anujg23@iitk.ac.in)) | Gen 2 data |

The central MC was produced by James Minock, who is no longer available: please ask Andy or Steven.
To fix something on the site, use the pencil icon at the top of any page, or
[report a problem with a sample](https://github.com/ANNIEsoft/ANNIE_Samples/issues/new/choose).
