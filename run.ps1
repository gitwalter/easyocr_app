# EasyOCR Application Container Management Script for Windows

param(
    [Parameter(Position=0)]
    [ValidateSet("build", "start", "stop", "restart", "logs", "clean")]
    [string]$Command
)

Write-Host "EasyOCR Application Container Manager" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

switch ($Command) {
    "build" {
        Write-Host "Building Docker image..." -ForegroundColor Yellow
        docker-compose build
    }
    "start" {
        Write-Host "Starting EasyOCR application..." -ForegroundColor Yellow
        docker-compose up -d
        Write-Host "Application is running at http://localhost:8501" -ForegroundColor Green
    }
    "stop" {
        Write-Host "Stopping EasyOCR application..." -ForegroundColor Yellow
        docker-compose down
    }
    "restart" {
        Write-Host "Restarting EasyOCR application..." -ForegroundColor Yellow
        docker-compose restart
    }
    "logs" {
        Write-Host "Showing application logs..." -ForegroundColor Yellow
        docker-compose logs -f
    }
    "clean" {
        Write-Host "Cleaning up containers and images..." -ForegroundColor Yellow
        docker-compose down --rmi all --volumes --remove-orphans
    }
    default {
        Write-Host "Usage: .\run.ps1 {build|start|stop|restart|logs|clean}" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Commands:" -ForegroundColor White
        Write-Host "  build   - Build the Docker image" -ForegroundColor Gray
        Write-Host "  start   - Start the application" -ForegroundColor Gray
        Write-Host "  stop    - Stop the application" -ForegroundColor Gray
        Write-Host "  restart - Restart the application" -ForegroundColor Gray
        Write-Host "  logs    - Show application logs" -ForegroundColor Gray
        Write-Host "  clean   - Clean up containers and images" -ForegroundColor Gray
        exit 1
    }
}
