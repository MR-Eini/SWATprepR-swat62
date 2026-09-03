# SWATprepR: old and updated versions

These version tags expose the source before the SWAT+ 62 update and the tested updated source in this same repository. They do not replace or rewrite the original Git history.

| Snapshot | Package version | Git tag |
| --- | --- | --- |
| Old source baseline | 1.0.13 | [before-swat62-update](https://github.com/MR-Eini/SWATprepR-swat62/tree/before-swat62-update) |
| Updated development version | 1.0.14 | [swat62-v1.0.14](https://github.com/MR-Eini/SWATprepR-swat62/tree/swat62-v1.0.14) |

The old tag points to commit [`5b25cd682226de1b9a989cd4c7dc2fec5ab343dd`](https://github.com/MR-Eini/SWATprepR-swat62/commit/5b25cd682226de1b9a989cd4c7dc2fec5ab343dd), the exact upstream source commit used before these edits. It is a source baseline for this update, not a claim that every bundled package dates from three years ago.

## Review the differences on GitHub

1. Open the [old-to-updated comparison](https://github.com/MR-Eini/SWATprepR-swat62/compare/before-swat62-update...swat62-v1.0.14?w=1).
2. Scroll to the changed files. GitHub marks removed lines red and added lines green.
3. Open individual files or commits to inspect each change. Where available, select the split view to see old and new code side by side.

The comparison above hides whitespace-only changes, which is especially useful for files with different Windows line endings. The [complete comparison](https://github.com/MR-Eini/SWATprepR-swat62/compare/before-swat62-update...swat62-v1.0.14) includes every change. The [commit history](https://github.com/MR-Eini/SWATprepR-swat62/commits/main) shows the incremental updates.

Both tags are fixed snapshots. Future versions should receive new version tags; `main` remains the current working branch. These are maintained development versions, not releases issued by the original authors.

## Main changes

- Close Windows input handles before rewriting files and retain new table fields.
- Update atmospheric-deposition and point-source file.cio entries by section name.
- Write revision-aware weather, codes, and object-count tables without fixed column totals.

## Tested scope

The updated packages ran the supplied migrated reference model with the Windows Intel SWAT+ revision 62 executable. The supplied verification, discharge calibration/validation, sensitivity, crop and water-yield workflows produced outputs. The final source test run covered all seven package test directories and passed 78 expectations. These results do not establish compatibility for every model, executable or optional process; scientific calibration acceptance has not been achieved.

See [COMPATIBILITY.md](COMPATIBILITY.md) and [the workflow results](compatibility/workflow-summary.json) for the tests and limitations. Model input migration and updating the old project-generation layer are separate from these package source comparisons.
