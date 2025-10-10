from typing import Dict

import gradio as gr
import numpy as np
import tensorflow as tf
import tensorflow_hub as hub
import tensorflow_text  # noqa: F401 - Required to register TensorFlow Text ops

# Use tf_keras for compatibility with models saved using tf.keras
try:
    import tf_keras
    from tf_keras.optimizers import Adam  # noqa: F401

    keras = tf_keras
except ImportError:
    keras = tf.keras

from official.nlp.optimization import AdamWeightDecay, WarmUp

np.set_printoptions(suppress=True)

labels = ["hate speech", "offensive language", "neither"]


# Load model with custom objects
custom_objects = {"KerasLayer": hub.KerasLayer, "AdamWeightDecay": AdamWeightDecay, "WarmUp": WarmUp}
classifier_model = keras.models.load_model("classifier_model.h5", custom_objects=custom_objects)


def run_model(text: str) -> Dict[str, float]:
    prediction = classifier_model.predict([text])[0]
    confidences = {labels[i]: float(prediction[i]) for i in range(len(labels))}
    return confidences


examples = [
    ["This is wonderful!"],
]

short_description = (
    "This application classifies text into three categories: hate speech, offensive language, "
    "and neither, using a deep learning model trained on the Hate Speech and Offensive Language Dataset. "
    "Enter a sentence and the model will predict its category."
)

demo = gr.Interface(
    fn=run_model,
    inputs=gr.Textbox(lines=5, placeholder="Enter a sentence here...", label="Input Text"),
    outputs=gr.Label(),
    examples=examples,
    title="Hate Speech and Offensive Language Classifier",
    description=short_description,
)

demo.launch()
