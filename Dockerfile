FROM ubuntu:22.04

# Install essential packages
RUN apt-get update && apt-get install -y \
    texlive-full \
    texlive-fonts-recommended \
    # texlive-lang-english \
    # texlive-lang-french \
    # texlive-lang-german \
    # texlive-lang-spanish \
    # dvips \
    gsfonts \
    python3-pip

# Install Python packages (if needed)
COPY . .
RUN pip3 install -r /requirements.txt

# Set working directory
WORKDIR /app

# Copy LaTeX files
COPY . /app

# Expose port for web preview (if applicable)
EXPOSE 8080

# Command to run LaTeX compilation
CMD ["latexmk", "-pdf", "-output-directory", "/app", "main.tex"]