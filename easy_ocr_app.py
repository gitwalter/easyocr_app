import os
import pandas as pd
import numpy as np
import streamlit as st
import easyocr
from PIL import Image, ImageDraw
from matplotlib import pyplot as plt

# Fix for PIL compatibility issue
import PIL.Image    
if not hasattr(PIL.Image, 'Resampling'):  # Pillow<9.0
    PIL.Image.Resampling = PIL.Image

# Fix for ANTIALIAS deprecation
if not hasattr(PIL.Image, 'ANTIALIAS'):
    PIL.Image.ANTIALIAS = PIL.Image.Resampling.LANCZOS

os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

# main title
st.title("Get text from image with EasyOCR") 
# subtitle
st.markdown("## EasyOCR with Streamlit")

# upload image file
file = st.file_uploader(label = "Upload your image", type=['png', 'jpg', 'jpeg'])

def rectangle(image, result):
    """ draw rectangles on image based on predicted coordinates"""
    draw = ImageDraw.Draw(image)
    for res in result:
        top_left = tuple(res[0][0]) # top left coordinates as tuple
        bottom_right = tuple(res[0][2]) # bottom right coordinates as tuple
        draw.rectangle((top_left, bottom_right), outline="blue", width=2)
    #display image on streamlit
    st.image(image)

if file:
    try:
        image = Image.open(file) # read image with PIL library
        st.image(image) #display

        # Show loading message
        with st.spinner('Processing image with EasyOCR...'):
            # it will detect German, English, and Portuguese text in the image
            reader = easyocr.Reader(['de','en', 'pt'], gpu=False) 
            result = reader.readtext(np.array(image))  # turn image to numpy array

        if result:
            textdic_easyocr = {} 
            for idx in range(len(result)): 
                pred_coor = result[idx][0] 
                pred_text = result[idx][1] 
                pred_confidence = result[idx][2] 
                textdic_easyocr[pred_text] = {} 
                textdic_easyocr[pred_text]['pred_confidence'] = pred_confidence
                textdic_easyocr[pred_text]['pred_coor'] = pred_coor

            # create a dataframe which shows the predicted text and prediction confidence
            df = pd.DataFrame.from_dict(textdic_easyocr).T
            st.success(f"Found {len(result)} text regions!")
            st.table(df)
          
            rectangle(image, result)
        else:
            st.warning("No text detected in the image.")
            
    except Exception as e:
        st.error(f"Error processing image: {str(e)}")
        st.info("Please try with a different image or check if the image contains readable text.")
