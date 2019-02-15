FROM python:3.7-alpine as base
FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip3.7 install --no-cache-dir --upgrade pip && pip3.7 install --no-cache-dir --install-option="--prefix=/install" -r /requirements.txt && pip3.7 install --no-cache-dir --install-option="--prefix=/install" -U https://github.com/Rapptz/discord.py/archive/rewrite.zip
FROM base
COPY --from=builder /install /usr/local
COPY src /app
WORKDIR /app
CMD ["python3.7", "app.py"]
