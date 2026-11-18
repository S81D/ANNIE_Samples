# Contributing

The site is written in Markdown in [ANNIEsoft/ANNIE_Samples](https://github.com/ANNIEsoft/ANNIE_Samples), built
with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), and published by GitHub Actions
on every push to `main`.

## Small fixes

Click the pencil icon at the top of a page, edit the file on GitHub, and propose the change as a pull
request.

## Adding a sample

Copy this block into the right page and fill it in. Give the heading an explicit `{ #id }` so links to it
keep working if the title changes.

```markdown
### Sample name { #sample-id }

<span class="badge recommended">Recommended</span>

One or two sentences: what the sample is and what it is for. Caveats, if any.

| Stage | Software | Path |
|---|---|---|
| GENIE | GENIE v3.0.6, G18_10a_02_11a | `/pnfs/annie/persistent/...` |
| WCSim, PMT | WCSim v2.0.0-ANNIE, CC tuning | `/pnfs/annie/persistent/...` |

**Events / POT:** ... · **Contact:** ... · **Request:** [#N](https://github.com/ANNIEsoft/ANNIE_Samples/issues/N)
```

Status badges (meanings in [Getting started](getting-started.md#status-labels)):

```html
<span class="badge recommended">Recommended</span>
<span class="badge available">Available</span>
<span class="badge analysis">Analysis-specific</span>
<span class="badge production">In production</span>
<span class="badge planned">Planned</span>
<span class="badge dq">DQ only</span>
<span class="badge deprecated">Deprecated</span>
```

When a sample is superseded, move its entry to [Deprecated](deprecated.md) and add a line saying why
and what replaces it.

## Previewing locally

```bash
python3 -m pip install --user -r requirements.txt
mkdocs serve
```

Then open <http://127.0.0.1:8000/ANNIE_Samples/> (the path matches the published site's URL).
`mkdocs build --strict` fails on broken links, as the pull-request check does.

## Maintainers

Steven Doran ([doran@fnal.gov](mailto:doran@fnal.gov), GitHub: S81D).
