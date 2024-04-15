#!/bin/bash

# Create project directory
mkdir hello-world-flask
cd hello-world-flask

# Create app directory and files
mkdir app
touch app/__init__.py app/routes.py

# Create tests directory and files
mkdir tests
touch tests/__init__.py tests/test_routes.py

# Create other project files
touch requirements.txt Dockerfile

# Create GitHub Actions workflow directory and file
mkdir -p .github/workflows
touch .github/workflows/main.yml

# Populate files with content
# __init__.py
echo "from flask import Flask" > app/__init__.py
echo "" >> app/__init__.py
echo "app = Flask(__name__)" >> app/__init__.py
echo "" >> app/__init__.py
echo "from app import routes" >> app/__init__.py

# routes.py
echo "from flask import Flask" > app/routes.py
echo "app = Flask(__name__)" >> app/routes.py
echo "" >> app/routes.py
echo "@app.route('/')" >> app/routes.py
echo "def hello_world():" >> app/routes.py
echo "    return 'Hello, World!'" >> app/routes.py

# requirements.txt
echo "Flask==2.0.2" > requirements.txt

# Dockerfile
echo "FROM python:3.9-slim" > Dockerfile
echo "" >> Dockerfile
echo "WORKDIR /app" >> Dockerfile
echo "" >> Dockerfile
echo "COPY requirements.txt /app/" >> Dockerfile
echo "RUN pip install --no-cache-dir -r requirements.txt" >> Dockerfile
echo "" >> Dockerfile
echo "COPY . /app/" >> Dockerfile
echo "" >> Dockerfile
echo "CMD ['python', 'app/routes.py']" >> Dockerfile

# .github/workflows/main.yml
echo "name: Hello World Flask CI/CD" > .github/workflows/main.yml
echo "" >> .github/workflows/main.yml
echo "on:" >> .github/workflows/main.yml
echo "  push:" >> .github/workflows/main.yml
echo "    branches:" >> .github/workflows/main.yml
echo "      - main" >> .github/workflows/main.yml
echo "" >> .github/workflows/main.yml
echo "jobs:" >> .github/workflows/main.yml
echo "  build-and-test:" >> .github/workflows/main.yml
echo "    runs-on: ubuntu-latest" >> .github/workflows/main.yml
echo "    steps:" >> .github/workflows/main.yml
echo "    - name: Checkout code" >> .github/workflows/main.yml
echo "      uses: actions/checkout@v2" >> .github/workflows/main.yml
echo "" >> .github/workflows/main.yml
echo "    - name: Setup Python" >> .github/workflows/main.yml
echo "      uses: actions/setup-python@v2" >> .github/workflows/main.yml
echo "      with:" >> .github/workflows/main.yml
echo "        python-version: '3.9'" >> .github/workflows/main.yml
echo "" >> .github/workflows/main.yml
echo "    - name: Install dependencies" >> .github/workflows/main.yml
echo "      run: pip install -r requirements.txt" >> .github/workflows/main.yml
echo "" >> .github/workflows/main.yml
echo "    - name: Run tests" >> .github/workflows/main.yml
echo "      run: python -m unittest discover -s tests" >> .github/workflows/main.yml
