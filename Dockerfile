FROM python:3.11-alpine as build

RUN apk update && \
    apk add --no-cache gcc musl-dev

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine

RUN apk update && \
    apk add --no-cache fzf

COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

WORKDIR /app

COPY main.py .

CMD ["python", "main.py"]
