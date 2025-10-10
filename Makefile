.PHONY: help install dev clean test format lint status run notebook docker-build docker-run requirements update

IMAGE_NAME := classify-text-with-bert-hate-speech
IMAGE_TAG := local

# Default target - show help
.DEFAULT_GOAL := help

.ONESHELL:

help:
	@echo "Project - Available Commands:"
	@echo ""
	@echo "  make install     - Install production dependencies with uv"
	@echo "  make dev         - Install development dependencies with uv"
	@echo "  make requirements- Generate requirements.txt from uv.lock"
	@echo "  make update      - Update all dependencies to latest versions"
	@echo "  make run         - Run the application (app.py)"
	@echo "  make notebook    - Launch jupyter notebook/lab"
	@echo "  make test        - Run tests (requires pytest)"
	@echo "  make format      - Format code (ruff or black if available)"
	@echo "  make lint        - Run linter (ruff if available)"
	@echo "  make clean       - Remove venv and build/test artifacts"
	@echo "  make status      - Show python version and installed packages summary"
	@echo "  make docker-build- Build a local docker image"
	@echo "  make docker-run  - Run the docker image locally"
	@echo ""

install:
	@echo "📦 Installing production dependencies with uv..."
	uv sync --no-dev
	@echo "✅ Production dependencies installed successfully!"

dev:
	@echo "📦 Installing development dependencies with uv..."
	uv sync --dev
	@echo "✅ Development dependencies installed successfully!"

requirements: update
	@echo "📝 Generating requirements.txt from uv.lock..."
	uv pip compile pyproject.toml -o requirements.txt
	@echo "✅ requirements.txt generated successfully!"

update: dev
	@echo "🔄 Updating all dependencies to latest versions..."
	uv lock --upgrade
	@echo "✅ Dependencies updated! Run 'make install' or 'make dev' to apply changes."
	@echo "💡 Tip: Run 'make requirements' to regenerate requirements.txt"

run:
	@echo "Running app.py..."
	uv run python app.py

notebook:
	@echo "Launching Jupyter Notebook (or lab if available)..."
	uv run jupyter lab || uv run jupyter notebook

test:
	@echo "Running tests with pytest..."
	uv run pytest -q tests || true

format:
	@echo "Formatting code with ruff..."
	uv run ruff format . || true
	-uv run ruff check --fix . || true

lint:
	@echo "Running linter with ruff..."
	uv run ruff check .

status:
	@uv run python --version
	@echo "Installed packages:"
	@uv pip list

clean:
	@echo "🧹 Cleaning up build and Python artifacts..."
	-rm -rf .venv build/ dist/ *.egg-info .eggs
	-find . -type d -name "__pycache__" -exec rm -rf {} +
	-find . -type f -name "*.py[co]" -delete
	-find . -type f -name ".coverage" -delete
	-find . -type d -name ".pytest_cache" -exec rm -rf {} +
	-find . -type d -name ".ruff_cache" -exec rm -rf {} +
	-find . -type d -name ".mypy_cache" -exec rm -rf {} +
	-find . -type d -name "htmlcov" -exec rm -rf {} +
	-find . -type f -name ".DS_Store" -delete
	@echo "✅ Cleanup completed!"

docker-build:
	@echo "Building docker image ${IMAGE_NAME}:${IMAGE_TAG} (requires Docker)"
	@docker build -t ${IMAGE_NAME}:${IMAGE_TAG} . || true

docker-run:
	@echo "Running docker image ${IMAGE_NAME}:${IMAGE_TAG} (port 7860 forwarded)"
	@docker run --rm -p 7860:7860 ${IMAGE_NAME}:${IMAGE_TAG}