---
title: Classify Text With Bert Hate Speech
emoji: 🔥
colorFrom: purple
colorTo: red
sdk: gradio
sdk_version: 3.20.1
app_file: app.py
pinned: false
license: openrail
---

# Hate Speech Classifier

This project uses TensorFlow, and BERT to implement a hate speech and offensive language classifier. The model is trained on the Hate Speech and Offensive Language Dataset and can classify tweets into three classes:

0. Hate speech
1. Offensive language
2. Neither

## Try the Model Online

You can try the model online using the following link:

- [Hate Speech Classifier on Hugging Face Spaces](https://huggingface.co/spaces/Ordenador/classify-text-with-bert-hate-speech)

Click the link above to access the interactive interface where you can input text and see the model's predictions for hate speech, offensive language, or neither.


## Prerequisites
Make sure you have the following Python packages installed:

- gradio
- tensorflow
- tensorflow_hub
- tensorflow_text


You can install all them using `makefile`. The `make pip-compile` command automatically creates a `virtualenv` and installs everything in `requirements.txt`:

```bash
make pip-compile
```

## How to run the project
Simply run the provided Python script in your preferred Python environment. The script will create a web interface using Gradio so you can input text and receive predictions from the model.

```bash
gradio app.py
```

## Usage
Once you have launched the app, simply enter a sentence in the textbox and press Enter. The model will classify the sentence into one of the three classes mentioned above and display the confidence for each class.

## Jupyter Notebooks

- [`hate_speech_bert_bert_mlp_in_tensorflow.ipynb`](./hate_speech_bert_bert_mlp_in_tensorflow.ipynb): You can see how the model was trained
- [`hate_speech_run.ipynb`](./hate_speech_run.ipynb): Example of model execution


## References and Resources
This project is based on:

- Classify text with BERT. (s. f.). TensorFlow. https://www.tensorflow.org/text/tutorials/classify_text_with_bert
- Devlin, J., Chang, M., Lee, K., & Toutanova, K. (2018). BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding. arXiv (Cornell University). https://arxiv.org/pdf/1810.04805v2
- G. (2021, February 3). Hate Speech - BERT+CNN and BERT+MLP in Tensorflow. Kaggle. https://www.kaggle.com/code/giovanimachado/hate-speech-bert-cnn-and-bert-mlp-in-tensorflow
- Hate Speech and Offensive Language Dataset. (2020, June 17). Kaggle. https://www.kaggle.com/mrmorj/hate-speech-and-offensive-language-dataset