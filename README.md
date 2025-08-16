# EasyOCR Application

A Streamlit-based web application for Optical Character Recognition (OCR) using EasyOCR. This application can extract text from images in multiple languages including German, English, and Portuguese.

## ✨ Features

- Upload images (PNG, JPG, JPEG)
- Extract text using EasyOCR with enhanced compatibility
- Display detected text with confidence scores
- Visualize text detection with bounding boxes
- Support for multiple languages (German, English, Portuguese)
- **Fixed PIL compatibility issues** for modern Pillow versions
- **Enhanced error handling** and user feedback
- **Production-ready containerization** with health checks

## 🚀 Quick Start

### Option 1: Using Docker (Recommended)

1. Clone this repository:
```bash
git clone <your-repo-url>
cd easyocr_app
```

2. Build and run with Docker Compose:
```bash
docker-compose up --build
```

3. Open your browser and go to `http://localhost:8501`

### Option 2: Local Development

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the application:
```bash
streamlit run easy_ocr_app.py
```

## 🛠️ Management Scripts

### Windows (PowerShell)
```powershell
# Build the container
.\run.ps1 build

# Start the application
.\run.ps1 start

# View logs
.\run.ps1 logs

# Stop the application
.\run.ps1 stop
```

### Linux/Mac (Bash)
```bash
# Build the container
./run.sh build

# Start the application
./run.sh start

# View logs
./run.sh logs

# Stop the application
./run.sh stop
```

## 📋 Usage

1. Upload an image using the file uploader
2. The application will automatically process the image
3. View the extracted text and confidence scores in the table
4. See the original image with bounding boxes around detected text

## 🌍 Supported Languages

The application currently supports:
- German (de)
- English (en)
- Portuguese (pt)

## 🔧 Technical Details

- **Framework**: Streamlit
- **OCR Engine**: EasyOCR (with PIL compatibility fixes)
- **Image Processing**: PIL (Pillow) with modern version support
- **Data Visualization**: Matplotlib
- **Data Handling**: Pandas, NumPy
- **Containerization**: Docker with health checks

## 🐛 Troubleshooting

### Memory Issues
If you encounter memory issues, try:
- Increasing Docker memory allocation
- Using smaller images
- Restarting the container

### PIL Compatibility
This version includes fixes for PIL/Pillow compatibility issues that were present in the original repository. The application now works with modern versions of Pillow.

### GPU Support
The application is configured to run on CPU by default. For GPU support, you would need to:
1. Install NVIDIA Docker runtime
2. Modify the Dockerfile to use GPU-enabled base images
3. Update the EasyOCR reader configuration

### Port Conflicts
If port 8501 is already in use, you can change it in the `docker-compose.yml` file or use a different port when running with Docker.

## 🔄 What's New

### Version Improvements
- ✅ **Fixed PIL ANTIALIAS deprecation issues**
- ✅ **Enhanced error handling and user feedback**
- ✅ **Production-ready Docker configuration**
- ✅ **Comprehensive management scripts**
- ✅ **Better dependency management with pinned versions**
- ✅ **Security improvements (non-root user in container)**
- ✅ **Health checks for container monitoring**

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
