---
title: "PyThaiNLP/pythainlp: Thai natural language processing in Python"
source: "https://github.com/PyThaiNLP/pythainlp"
author:
published:
created: 2026-05-26
description: "Thai natural language processing in Python. Contribute to PyThaiNLP/pythainlp development by creating an account on GitHub."
tags:
  - "clippings"
---
## PyThaiNLP: Thai Natural Language Processing in Python

[![Project Logo](https://github.com/PyThaiNLP/pythainlp/raw/main/docs/images/logo.png)](https://github.com/PyThaiNLP/pythainlp/blob/main/docs/images/logo.png)

[pythainlp.org](https://pythainlp.org/) | [Tutorials](https://pythainlp.org/tutorials) | [License info](https://pythainlp.org/dev-docs/notes/license.html) | [Model cards](https://github.com/PyThaiNLP/pythainlp/wiki/Model-Cards) | [Adopters](https://github.com/PyThaiNLP/pythainlp/blob/dev/INTHEWILD.md) | *[เอกสารภาษาไทย](https://github.com/PyThaiNLP/pythainlp/blob/dev/README_TH.md)*

Designed to be a Thai-focused counterpart to [NLTK](https://www.nltk.org/), **PyThaiNLP** provides standard tools for linguistic analysis under an Apache-2.0 license, with its data and models covered by CC0-1.0 and CC-BY-4.0.

```
pip install pythainlp
```

| Version | Python version | Changes | Documentation |
| --- | --- | --- | --- |
| [5.3.4](https://github.com/PyThaiNLP/pythainlp/releases) | 3.9+ | [Log](https://github.com/PyThaiNLP/pythainlp/blob/dev/CHANGELOG.md#533---2026-03-26) | [pythainlp.org/docs](https://pythainlp.org/docs) |
| [`dev`](https://github.com/PyThaiNLP/pythainlp/tree/dev) | 3.9+ | [Log](https://github.com/PyThaiNLP/pythainlp/compare/v5.3.4...HEAD) | [pythainlp.org/dev-docs](https://pythainlp.org/dev-docs/) |

## Features

- **Linguistic units:** Sentence, word, and subword segmentation (`sent_tokenize`, `word_tokenize`, `subword_tokenize`).
- **Tagging:** Part-of-speech tagging (`pos_tag`).
- **Transliteration:** Romanization (`transliterate`) and IPA conversion.
- **Correction:** Spelling suggestion and correction (`spell`, `correct`).
- **Utilities:** Soundex, collation, number-to-text (`bahttext`), datetime formatting (`thai_strftime`), and keyboard layout correction.
- **Data:** Built-in Thai character sets, word lists, and stop words.
- **CLI:** Command-line interface via `thainlp`.
	```
	thainlp data catalog  # List datasets
	thainlp help          # Show usage
	```

## Installation options

To install with specific extras (e.g., `translate`, `wordnet`, `full`):

```
pip install "pythainlp[extra1,extra2,...]"
```

Possible `extras` included:

- `compact` — install a stable and small subset of dependencies (recommended)
- `translate` — machine translation support
- `wordnet` — WordNet support
- `full` — install all optional dependencies (may introduce conflicts)

The documentation website maintains the [full list of extras](https://pythainlp.org/dev-docs/notes/installation.html). To see the specific libraries included in each extra, please inspect the `[project.optional-dependencies]` section of [`pyproject.toml`](https://github.com/PyThaiNLP/pythainlp/blob/dev/pyproject.toml).

## Environment variables

| Variable | Description | Status |
| --- | --- | --- |
| `PYTHAINLP_DATA` | Path to the data directory (default: `~/pythainlp-data`). | Current |
| `PYTHAINLP_DATA_DIR` | Legacy alias for `PYTHAINLP_DATA`. Emits a `DeprecationWarning`. Setting both raises `ValueError`. | Deprecated; use `PYTHAINLP_DATA` |
| `PYTHAINLP_OFFLINE` | Set to `1` to disable automatic corpus downloads. Explicit `download()` calls still work. | Current |
| `PYTHAINLP_READ_ONLY` | Set to `1` to enable read-only mode, which prevents implicit background writes to PyThaiNLP's internal data directory (corpus downloads, catalog updates, directory creation). Explicit user-initiated saves to user-specified paths are unaffected. | Current |
| `PYTHAINLP_READ_MODE` | Legacy alias for `PYTHAINLP_READ_ONLY`. Emits a `DeprecationWarning`. Setting both raises `ValueError`. | Deprecated; use `PYTHAINLP_READ_ONLY` |

### Data directory

PyThaiNLP downloads data (see the data catalog `db.json` at [pythainlp-corpus](https://github.com/PyThaiNLP/pythainlp-corpus)) to `~/pythainlp-data` by default. Set the `PYTHAINLP_DATA` environment variable to override this location. (`PYTHAINLP_DATA_DIR` is still accepted but deprecated.)

When using PyThaiNLP in distributed computing environments (e.g., Apache Spark), set the `PYTHAINLP_DATA` environment variable inside the function that will be distributed to worker nodes. See details in [the documentation](https://pythainlp.org/dev-docs/notes/installation.html).

### Offline mode

Set `PYTHAINLP_OFFLINE=1` to disable **automatic** corpus downloads. When this variable is set and a corpus is not already cached locally, a `FileNotFoundError` is raised instead of attempting a network download. Explicit calls to `pythainlp.corpus.download()` are unaffected. Use `pythainlp.is_offline_mode()` to check the current state programmatically.

```
import pythainlp
print(pythainlp.is_offline_mode())  # True if PYTHAINLP_OFFLINE=1
```

### Read-only mode

Set `PYTHAINLP_READ_ONLY=1` to prevent implicit background writes to PyThaiNLP's internal data directory. This blocks corpus downloads, catalog updates, and automatic data directory creation — writes that happen as side effects the user may not be aware of.

> **Note:** Read-only mode is more restrictive than offline mode. `PYTHAINLP_OFFLINE=1` blocks only *automatic* downloads triggered by `get_corpus_path()`; explicit `pythainlp.corpus.download()` calls still work. `PYTHAINLP_READ_ONLY=1` also blocks explicit `download()` calls, because any download requires writing to the data directory. Use `PYTHAINLP_READ_ONLY` when the data directory is on a read-only file system (e.g., a read-only Docker volume or a shared cluster mount).

Operations where the user explicitly specifies an output path are unaffected (e.g., `model.save("path")`, `tagger.train(..., save_loc="path")`, `thainlp misspell --output myfile.txt`).

Use `pythainlp.is_read_only_mode()` to check the current state programmatically.

```
import pythainlp
print(pythainlp.is_read_only_mode())  # True if PYTHAINLP_READ_ONLY=1
```

## Testing

We test core functionalities on all officially supported Python versions.

See [tests/README.md](https://github.com/PyThaiNLP/pythainlp/blob/main/tests/README.md) for test matrix and other details.

## Contribute to PyThaiNLP

Please fork and create a pull request. See [CONTRIBUTING.md](https://github.com/PyThaiNLP/pythainlp/blob/dev/CONTRIBUTING.md) for guidelines and algorithm references.

## Citations

If you use `PyThaiNLP` library in your project, please cite the software as follows:

> Phatthiyaphaibun, Wannaphong, Korakot Chaovavanich, Charin Polpanumas, Arthit Suriyawongkul, Lalita Lowphansirikul, and Pattarawat Chormai. “PyThaiNLP: Thai Natural Language Processing in Python”. Zenodo, 2 June 2024. [https://doi.org/10.5281/zenodo.3519354](https://doi.org/10.5281/zenodo.3519354).

with this BibTeX entry:

```
@software{pythainlp,
    title = "{P}y{T}hai{NLP}: {T}hai Natural Language Processing in {P}ython",
     = "Phatthiyaphaibun, Wannaphong  and
      Chaovavanich, Korakot  and
      Polpanumas, Charin  and
      Suriyawongkul, Arthit  and
      Lowphansirikul, Lalita  and
      Chormai, Pattarawat",
    doi = {10.5281/zenodo.3519354},
    license = {Apache-2.0},
    month = jun,
    url = {https://github.com/PyThaiNLP/pythainlp/},
    version = {v5.0.4},
    year = {2024},
}
```

To cite our [NLP-OSS 2023](https://nlposs.github.io/2023/) academic paper, please cite the paper as follows:

> Wannaphong Phatthiyaphaibun, Korakot Chaovavanich, Charin Polpanumas, Arthit Suriyawongkul, Lalita Lowphansirikul, Pattarawat Chormai, Peerat Limkonchotiwat, Thanathip Suntorntip, and Can Udomcharoenchaikit. 2023. [PyThaiNLP: Thai Natural Language Processing in Python.](https://aclanthology.org/2023.nlposs-1.4) In Proceedings of the 3rd Workshop for Natural Language Processing Open Source Software (NLP-OSS 2023), pages 25–36, Singapore, Singapore. Empirical Methods in Natural Language Processing.

with this BibTeX entry:

```
@inproceedings{phatthiyaphaibun-etal-2023-pythainlp,
    title = "{P}y{T}hai{NLP}: {T}hai Natural Language Processing in {P}ython",
     = "Phatthiyaphaibun, Wannaphong  and
      Chaovavanich, Korakot  and
      Polpanumas, Charin  and
      Suriyawongkul, Arthit  and
      Lowphansirikul, Lalita  and
      Chormai, Pattarawat  and
      Limkonchotiwat, Peerat  and
      Suntorntip, Thanathip  and
      Udomcharoenchaikit, Can",
    editor = "Tan, Liling  and
      Milajevs, Dmitrijs  and
      Chauhan, Geeticka  and
      Gwinnup, Jeremy  and
      Rippeth, Elijah",
    booktitle = "Proceedings of the 3rd Workshop for Natural Language Processing Open Source Software (NLP-OSS 2023)",
    month = dec,
    year = "2023",
    address = "Singapore, Singapore",
    publisher = "Empirical Methods in Natural Language Processing",
    url = "https://aclanthology.org/2023.nlposs-1.4",
    pages = "25--36",
    abstract = "We present PyThaiNLP, a free and open-source natural language processing (NLP) library for Thai language implemented in Python. It provides a wide range of software, models, and datasets for Thai language. We first provide a brief historical context of tools for Thai language prior to the development of PyThaiNLP. We then outline the functionalities it provided as well as datasets and pre-trained language models. We later summarize its development milestones and discuss our experience during its development. We conclude by demonstrating how industrial and research communities utilize PyThaiNLP in their work. The library is freely available at https://github.com/pythainlp/pythainlp.",
}
```

## Sponsors

See [SPONSORS.md](https://github.com/PyThaiNLP/pythainlp/blob/dev/SPONSORS.md)

## Acknowledgements

PyThaiNLP was founded by Wannaphong Phatthiyaphaibun in 2016. His contributions from 2021 were made during a PhD studentship supported by [Vidyasirimedhi Institute of Science and Technology (VISTEC)](https://www.vistec.ac.th/).

The contributions of Arthit Suriyawongkul to PyThaiNLP from November 2017 until August 2019 were funded by [Wisesight](https://wisesight.com/). His contributions from November 2019 until October 2024 were made during a PhD studentship supported by [Taighde Éireann – Research Ireland](https://www.researchireland.ie/) under Grant Number 18/CRT/6224 ([Research Ireland Centre for Research Training in Digitally-Enhanced Reality (d-real)](https://d-real.ie/)).

The contributions of Pattarawat Chormai to PyThaiNLP from 2018 until 2019 were made during a research internship at the [Natural Language Processing Lab, Department of Linguistics, Faculty of Arts, Chulalongkorn University](https://attapol.github.io/lab.html).

The contributions of Korakot Chaovavanich and Lalita Lowphansirikul to PyThaiNLP from 2019 until 2022 were funded by the [VISTEC-depa Thailand AI Research Institute](https://airesearch.in.th/).

The Mac Mini M1 used for macOS testing was donated by [MacStadium](https://www.macstadium.com/). This hardware was essential for the project's testing suite from October 2022 to October 2023, filling a critical gap before GitHub Actions introduced native support for Apple Silicon runners.

We have only one official repository at [https://github.com/PyThaiNLP/pythainlp](https://github.com/PyThaiNLP/pythainlp) and another mirror at [https://gitlab.com/pythainlp/pythainlp](https://gitlab.com/pythainlp/pythainlp).

Beware of malware if you use code from places other than these two.

Made with ❤️ | PyThaiNLP Team 💻 | "We build Thai NLP" 🇹🇭