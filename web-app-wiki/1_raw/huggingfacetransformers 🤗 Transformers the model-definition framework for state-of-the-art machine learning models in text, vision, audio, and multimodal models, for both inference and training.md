---
title: "huggingface/transformers: 🤗 Transformers: the model-definition framework for state-of-the-art machine learning models in text, vision, audio, and multimodal models, for both inference and training."
source: "https://github.com/huggingface/transformers"
author:
published:
created: 2026-05-26
description: "🤗 Transformers: the model-definition framework for state-of-the-art machine learning models in text, vision, audio, and multimodal models, for both inference and training.  - huggingface/transformers: 🤗 Transformers: the model-definition framework for state-of-the-art machine learning models in text, vision, audio, and multimodal models, for both inference and training."
tags:
  - "clippings"
---
![Hugging Face Transformers Library](https://camo.githubusercontent.com/4fc6ef6afd63553efd6530c27b73d0c5d6a2377c76b8c0969fe6330acb867109/68747470733a2f2f68756767696e67666163652e636f2f64617461736574732f68756767696e67666163652f646f63756d656e746174696f6e2d696d616765732f7261772f6d61696e2f7472616e73666f726d6572732d6c6f676f2d6c696768742e737667)

#### English | 简体中文 | 繁體中文 | 한국어 | Español | 日本語 | हिन्दी | Русский | Português | తెలుగు | Français | Deutsch | Italiano | Tiếng Việt | العربية | اردو | বাংলা | فارسی |

### State-of-the-art pretrained models for inference and training

Transformers acts as the model-definition framework for state-of-the-art machine learning with text, computer vision, audio, video, and multimodal models, for both inference and training.

It centralizes the model definition so that this definition is agreed upon across the ecosystem. `transformers` is the pivot across frameworks: if a model definition is supported, it will be compatible with the majority of training frameworks (Axolotl, Unsloth, DeepSpeed, FSDP, PyTorch-Lightning,...), inference engines (vLLM, SGLang, TGI,...), and adjacent modeling libraries (llama.cpp, mlx,...) which leverage the model definition from `transformers`.

We pledge to help support new state-of-the-art models and democratize their usage by having their model definition be simple, customizable, and efficient.

There are over 1M+ Transformers [model checkpoints](https://huggingface.co/models?library=transformers&sort=trending) on the [Hugging Face Hub](https://huggingface.co/models) you can use.

Explore the [Hub](https://huggingface.co/) today to find a model and use Transformers to help you get started right away.

## Installation

Transformers works with Python 3.10+, and [PyTorch](https://pytorch.org/get-started/locally/) 2.4+.

Create and activate a virtual environment with [venv](https://docs.python.org/3/library/venv.html) or [uv](https://docs.astral.sh/uv/), a fast Rust-based Python package and project manager.

```
# venv
python -m venv .my-env
source .my-env/bin/activate
# uv
uv venv .my-env
source .my-env/bin/activate
```

Install Transformers in your virtual environment.

```
# pip
pip install "transformers[torch]"

# uv
uv pip install "transformers[torch]"
```

Install Transformers from source if you want the latest changes in the library or are interested in contributing. However, the *latest* version may not be stable. Feel free to open an [issue](https://github.com/huggingface/transformers/issues) if you encounter an error.

```
git clone https://github.com/huggingface/transformers.git
cd transformers

# pip
pip install '.[torch]'

# uv
uv pip install '.[torch]'
```

## Quickstart

Get started with Transformers right away with the [Pipeline](https://huggingface.co/docs/transformers/pipeline_tutorial) API. The `Pipeline` is a high-level inference class that supports text, audio, vision, and multimodal tasks. It handles preprocessing the input and returns the appropriate output.

Instantiate a pipeline and specify model to use for text generation. The model is downloaded and cached so you can easily reuse it again. Finally, pass some text to prompt the model.

```
from transformers import pipeline

pipeline = pipeline(task="text-generation", model="Qwen/Qwen2.5-1.5B")
pipeline("the secret to baking a really good cake is ")
[{'generated_text': 'the secret to baking a really good cake is 1) to use the right ingredients and 2) to follow the recipe exactly. the recipe for the cake is as follows: 1 cup of sugar, 1 cup of flour, 1 cup of milk, 1 cup of butter, 1 cup of eggs, 1 cup of chocolate chips. if you want to make 2 cakes, how much sugar do you need? To make 2 cakes, you will need 2 cups of sugar.'}]
```

To chat with a model, the usage pattern is the same. The only difference is you need to construct a chat history (the input to `Pipeline`) between you and the system.

> [!tip] Tip
> You can also chat with a model directly from the command line, as long as [`transformers serve` is running](https://huggingface.co/docs/transformers/main/en/serving).
> 
> ```
> transformers chat Qwen/Qwen2.5-0.5B-Instruct
> ```

```
import torch
from transformers import pipeline

chat = [
    {"role": "system", "content": "You are a sassy, wise-cracking robot as imagined by Hollywood circa 1986."},
    {"role": "user", "content": "Hey, can you tell me any fun things to do in New York?"}
]

pipeline = pipeline(task="text-generation", model="meta-llama/Meta-Llama-3-8B-Instruct", dtype=torch.bfloat16, device_map="auto")
response = pipeline(chat, max_new_tokens=512)
print(response[0]["generated_text"][-1]["content"])
```

Expand the examples below to see how `Pipeline` works for different modalities and tasks.

Automatic speech recognition
```
from transformers import pipeline

pipeline = pipeline(task="automatic-speech-recognition", model="openai/whisper-large-v3")
pipeline("https://huggingface.co/datasets/Narsil/asr_dummy/resolve/main/mlk.flac")
{'text': ' I have a dream that one day this nation will rise up and live out the true meaning of its creed.'}
```
Image classification
```
from transformers import pipeline

pipeline = pipeline(task="image-classification", model="facebook/dinov2-small-imagenet1k-1-layer")
pipeline("https://huggingface.co/datasets/Narsil/image_dummy/raw/main/parrots.png")
[{'label': 'macaw', 'score': 0.997848391532898},
 {'label': 'sulphur-crested cockatoo, Kakatoe galerita, Cacatua galerita',
  'score': 0.0016551691805943847},
 {'label': 'lorikeet', 'score': 0.00018523589824326336},
 {'label': 'African grey, African gray, Psittacus erithacus',
  'score': 7.85409429227002e-05},
 {'label': 'quail', 'score': 5.502637941390276e-05}]
```
Visual question answering
```
from transformers import pipeline

pipeline = pipeline(task="visual-question-answering", model="Salesforce/blip-vqa-base")
pipeline(
    image="https://huggingface.co/datasets/huggingface/documentation-images/resolve/main/transformers/tasks/idefics-few-shot.jpg",
    question="What is in the image?",
)
[{'answer': 'statue of liberty'}]
```

## Why should I use Transformers?

1. Easy-to-use state-of-the-art models:
	- High performance on natural language understanding & generation, computer vision, audio, video, and multimodal tasks.
		- Low barrier to entry for researchers, engineers, and developers.
		- Few user-facing abstractions with just three classes to learn.
		- A unified API for using all our pretrained models.
2. Lower compute costs, smaller carbon footprint:
	- Share trained models instead of training from scratch.
		- Reduce compute time and production costs.
		- Hundreds of model architectures with 1M+ pretrained checkpoints across all modalities.
3. Choose the right framework for every part of a model's lifetime:
	- Train state-of-the-art models in 3 lines of code.
		- Move a single model between PyTorch/JAX/TF2.0 frameworks at will.
		- Pick the right framework for training, evaluation, and production.
4. Easily customize a model or an example to your needs:
	- We provide examples for each architecture to reproduce the results published by its original authors.
		- Model internals are exposed as consistently as possible.
		- Model files can be used independently of the library for quick experiments.
[![Hugging Face Enterprise Hub](https://private-user-images.githubusercontent.com/3841370/376175414-247fb16d-d251-4583-96c4-d3d76dda4925.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzk4MDIwNDcsIm5iZiI6MTc3OTgwMTc0NywicGF0aCI6Ii8zODQxMzcwLzM3NjE3NTQxNC0yNDdmYjE2ZC1kMjUxLTQ1ODMtOTZjNC1kM2Q3NmRkYTQ5MjUucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI2MDUyNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNjA1MjZUMTMyMjI3WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ZjBhZWYwMjE4YTFkOTU4N2Q0MDNjYWQ1OWVmNjQ4YWE5YmY1N2Q3MDA1MDg1ZjFkNDVlMTZiZTlmYThmZGU2MCZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QmcmVzcG9uc2UtY29udGVudC10eXBlPWltYWdlJTJGcG5nIn0.UJiW51Zp_Rwz8WyQCi4js_T1YaRjsx6JfXY-zDicUWk)](https://huggingface.co/enterprise)  

## When shouldn't I use Transformers?

- This library is not a modular toolbox of building blocks for neural nets. The code in the model files is not refactored with additional abstractions on purpose, so that researchers can quickly iterate on each of the models without diving into additional abstractions/files.
- The training API is optimized to work with PyTorch models provided by Transformers. For generic machine learning loops, you should use another library like [Accelerate](https://huggingface.co/docs/accelerate).
- The [example scripts](https://github.com/huggingface/transformers/tree/main/examples) are only *examples*. They may not necessarily work out-of-the-box on your specific use case and you'll need to adapt the code for it to work.

## 100 projects using Transformers

Transformers is more than a toolkit to use pretrained models, it's a community of projects built around it and the Hugging Face Hub. We want Transformers to enable developers, researchers, students, professors, engineers, and anyone else to build their dream projects.

In order to celebrate Transformers 100,000 stars, we wanted to put the spotlight on the community with the [awesome-transformers](https://github.com/huggingface/transformers/blob/main/awesome-transformers.md) page which lists 100 incredible projects built with Transformers.

If you own or use a project that you believe should be part of the list, please open a PR to add it!

## Example models

You can test most of our models directly on their [Hub model pages](https://huggingface.co/models).

Expand each modality below to see a few example models for various use cases.

Audio
- Audio classification with [CLAP](https://huggingface.co/laion/clap-htsat-fused)
- Automatic speech recognition with [Parakeet](https://huggingface.co/nvidia/parakeet-ctc-1.1b#transcribing-using-transformers-%F0%9F%A4%97), [Whisper](https://huggingface.co/openai/whisper-large-v3-turbo), [GLM-ASR](https://huggingface.co/zai-org/GLM-ASR-Nano-2512) and [Moonshine-Streaming](https://huggingface.co/UsefulSensors/moonshine-streaming-medium)
- Keyword spotting with [Wav2Vec2](https://huggingface.co/superb/wav2vec2-base-superb-ks)
- Speech to speech generation with [Moshi](https://huggingface.co/kyutai/moshiko-pytorch-bf16)
- Text to audio with [MusicGen](https://huggingface.co/facebook/musicgen-large)
- Text to speech with [CSM](https://huggingface.co/sesame/csm-1b)
Computer vision
- Automatic mask generation with [SAM](https://huggingface.co/facebook/sam-vit-base)
- Depth estimation with [DepthPro](https://huggingface.co/apple/DepthPro-hf)
- Image classification with [DINO v2](https://huggingface.co/facebook/dinov2-base)
- Keypoint detection with [SuperPoint](https://huggingface.co/magic-leap-community/superpoint)
- Keypoint matching with [SuperGlue](https://huggingface.co/magic-leap-community/superglue_outdoor)
- Object detection with [RT-DETRv2](https://huggingface.co/PekingU/rtdetr_v2_r50vd)
- Pose Estimation with [VitPose](https://huggingface.co/usyd-community/vitpose-base-simple)
- Universal segmentation with [OneFormer](https://huggingface.co/shi-labs/oneformer_ade20k_swin_large)
- Video classification with [VideoMAE](https://huggingface.co/MCG-NJU/videomae-large)
Multimodal
- Audio or text to text with [Voxtral](https://huggingface.co/mistralai/Voxtral-Mini-3B-2507), [Audio Flamingo](https://huggingface.co/nvidia/audio-flamingo-3-hf)
- Document question answering with [LayoutLMv3](https://huggingface.co/microsoft/layoutlmv3-base)
- Image or text to text with [Qwen-VL](https://huggingface.co/Qwen/Qwen2.5-VL-3B-Instruct)
- Image captioning [BLIP-2](https://huggingface.co/Salesforce/blip2-opt-2.7b)
- OCR-based document understanding with [GOT-OCR2](https://huggingface.co/stepfun-ai/GOT-OCR-2.0-hf)
- Table question answering with [TAPAS](https://huggingface.co/google/tapas-base)
- Unified multimodal understanding and generation with [Emu3](https://huggingface.co/BAAI/Emu3-Gen)
- Vision to text with [Llava-OneVision](https://huggingface.co/llava-hf/llava-onevision-qwen2-0.5b-ov-hf)
- Visual question answering with [Llava](https://huggingface.co/llava-hf/llava-1.5-7b-hf)
- Visual referring expression segmentation with [Kosmos-2](https://huggingface.co/microsoft/kosmos-2-patch14-224)
NLP
- Masked word completion with [ModernBERT](https://huggingface.co/answerdotai/ModernBERT-base)
- Named entity recognition with [Gemma](https://huggingface.co/google/gemma-2-2b)
- Question answering with [Mixtral](https://huggingface.co/mistralai/Mixtral-8x7B-v0.1)
- Summarization with [BART](https://huggingface.co/facebook/bart-large-cnn)
- Translation with [T5](https://huggingface.co/google-t5/t5-base)
- Text generation with [Llama](https://huggingface.co/meta-llama/Llama-3.2-1B)
- Text classification with [Qwen](https://huggingface.co/Qwen/Qwen2.5-0.5B)

## Citation

We now have a [paper](https://aclanthology.org/2020.emnlp-demos.6/) you can cite for the 🤗 Transformers library:

```
@inproceedings{wolf-etal-2020-transformers,
    title = "Transformers: State-of-the-Art Natural Language Processing",
     = "Thomas Wolf and Lysandre Debut and Victor Sanh and Julien Chaumond and Clement Delangue and Anthony Moi and Pierric Cistac and Tim Rault and Rémi Louf and Morgan Funtowicz and Joe Davison and Sam Shleifer and Patrick von Platen and Clara Ma and Yacine Jernite and Julien Plu and Canwen Xu and Teven Le Scao and Sylvain Gugger and Mariama Drame and Quentin Lhoest and Alexander M. Rush",
    booktitle = "Proceedings of the 2020 Conference on Empirical Methods in Natural Language Processing: System Demonstrations",
    month = oct,
    year = "2020",
    address = "Online",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2020.emnlp-demos.6/",
    pages = "38--45"
}
```