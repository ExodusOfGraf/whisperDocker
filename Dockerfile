FROM python:3.9-slim

WORKDIR /app

COPY pyproject.toml MANIFEST.in README.md LICENSE ./
COPY whisper/ whisper/

RUN pip install --no-cache-dir .

# Add whisper executable to PATH, if not already handled by pip install
ENV PATH="/app/.local/bin:${PATH}"

# Default command, can be overridden
CMD ["whisper"] 