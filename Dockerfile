FROM python:3.8

WORKDIR /usr/src/app

# COPY requirements.txt ./
# RUN apt update && apt install poppler-utils -y && apt clean && rm -rf /var/lib/apt/lists/*

COPY . .
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh .
RUN pip install --no-cache-dir -r requirements.txt && chmod +x wait-for-it.sh


CMD [ "./wait-for-it.sh", "selenium-chrome:4444", "--", "./wait-for-it.sh", "html:80", "--", "python", "-u", "./spiderTest.py" ]
