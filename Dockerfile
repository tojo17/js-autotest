FROM python:3.8-slim-buster

ARG UID=1000
ARG GID=1000

# Creates a non-root user and adds permission to access the app folder
RUN groupadd -f -g ${GID} appgroup && \
    useradd --create-home -u ${UID} -g ${GID} appuser

USER appuser
WORKDIR /usr/src/app
ADD --chown=appuser:appgroup https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh .
COPY --chown=appuser:appgroup . .
RUN pip install --no-cache-dir -r requirements.txt && chmod +x wait-for-it.sh


CMD [ "./wait-for-it.sh", "selenium-chrome:4444", "--", "./wait-for-it.sh", "html:80", "--", "python", "-u", "./spiderTest.py" ]
