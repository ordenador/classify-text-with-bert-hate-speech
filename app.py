import gradio as gr
from official.nlp.optimization import AdamWeightDecay, WarmUp
import tensorflow as tf
import tensorflow_hub as hub
import tensorflow_text as text
import numpy as np
np.set_printoptions(suppress=True)
# https://www.kaggle.com/datasets/mrmorj/hate-speech-and-offensive-language-dataset
labels = [
    "hate speech",
    "offensive language",
    "neither"
]

# model
with tf.keras.utils.custom_object_scope({'AdamWeightDecay': AdamWeightDecay(), 'WarmUp': WarmUp}):
    classifier_model = tf.keras.models.load_model('classifier_model.h5',
                                                  custom_objects={'KerasLayer': hub.KerasLayer})


def run_model(text):
    prediction = classifier_model.predict([text])[0]
    confidences = {labels[i]: float(prediction[i]) for i in range(len(labels))}
    return confidences


examples = [
    ["This is wonderful!"],
]

hate_speech = gr.Interface(
    fn=run_model,
    inputs=gr.Textbox(lines=5,
                      placeholder="Enter a positive or negative sentence here...",
                      label="Input Text"),
    outputs=gr.outputs.Label(),
    examples=examples
)

hate_speech.launch()
