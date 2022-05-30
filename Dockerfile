FROM python:3.9

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN addgroup --gid 10001 app \
    && adduser \
    --uid 10001 \
    --home /home/app \
    --shell /bin/ash \
    --ingroup app \
    --disabled-password \
    app

USER app

WORKDIR /usr/src/

COPY ./app ./app

EXPOSE 8000

ENTRYPOINT ["uvicorn"]
CMD ["app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]