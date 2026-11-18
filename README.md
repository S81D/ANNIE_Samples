# ANNIE Data and MC Samples

Source of the site at <https://anniesoft.github.io/ANNIE_Samples/>: ANNIE's production data and simulation
samples, where to find them, and how to request new ones.

- `docs/`: the pages (Markdown). The navigation is set in `mkdocs.yml`.
- `.github/ISSUE_TEMPLATE/`: the request forms.
- `.github/workflows/docs.yml`: checks pull requests and publishes `main` to GitHub Pages.
- `tools/inventory.sh`: lists file counts, sizes and run ranges for every path on the site (run on a gpvm).
- `tools/create_labels.sh`: creates the issue labels the forms use.

Preview locally:

```bash
python3 -m pip install --user -r requirements.txt
mkdocs serve
```

To add or change a sample, see `docs/contributing.md`.
