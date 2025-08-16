#!/bin/bash

# EasyOCR Application Container Management Script

echo "EasyOCR Application Container Manager"
echo "====================================="

case "$1" in
    "build")
        echo "Building Docker image..."
        docker-compose build
        ;;
    "start")
        echo "Starting EasyOCR application..."
        docker-compose up -d
        echo "Application is running at http://localhost:8501"
        ;;
    "stop")
        echo "Stopping EasyOCR application..."
        docker-compose down
        ;;
    "restart")
        echo "Restarting EasyOCR application..."
        docker-compose restart
        ;;
    "logs")
        echo "Showing application logs..."
        docker-compose logs -f
        ;;
    "clean")
        echo "Cleaning up containers and images..."
        docker-compose down --rmi all --volumes --remove-orphans
        ;;
    *)
        echo "Usage: $0 {build|start|stop|restart|logs|clean}"
        echo ""
        echo "Commands:"
        echo "  build   - Build the Docker image"
        echo "  start   - Start the application"
        echo "  stop    - Stop the application"
        echo "  restart - Restart the application"
        echo "  logs    - Show application logs"
        echo "  clean   - Clean up containers and images"
        exit 1
        ;;
esac
