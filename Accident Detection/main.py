from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn 
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf
import cv2

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:3000",
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

MODEL = tf.keras.models.load_model(r'C:\Users\ASUS\Desktop\PCD\Accident Detection\API')
CLASS_NAMES = ["Accident", "No Accident"] 


def read_file_as_image(data, target_size=(256, 256)) -> np.ndarray:
    image = Image.open(BytesIO(data))
    print("Original image size:", image.size)
    image = image.convert("RGB")  # Ensure image is in RGB format
    image = image.resize(target_size)  # Resize image
    print("Resized image size:", image.size)
    image_np = np.array(image)
    return image_np

@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)
    
    predictions = MODEL.predict(img_batch)
    if predictions[0][0] >= 0.55:
        predicted_class_index = 1
    else:
        predicted_class_index = 0

    predicted_class = CLASS_NAMES[predicted_class_index]
    confidence = float(np.max(predictions[0]))
    return {
        'class': predicted_class,
    }

if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)
