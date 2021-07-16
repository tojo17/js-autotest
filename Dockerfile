FROM python:3.8-slim-buster

WORKDIR /usr/src/app

# COPY requirements.txt ./
# RUN apt update && apt install poppler-utils -y && apt clean && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh .
# Creates a non-root user and adds permission to access the app folder
RUN useradd --create-home appuser && chown -R appuser /usr/src/app
USER appuser
COPY . .
RUN pip install --no-cache-dir -r requirements.txt && chmod +x wait-for-it.sh


CMD [ "./wait-for-it.sh", "selenium-chrome:4444", "--", "./wait-for-it.sh", "html:80", "--", "python", "-u", "./spiderTest.py" ]
