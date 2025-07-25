FROM alpine:latest

RUN apk update && apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    python3-dev \
    py3-pip \
    git

WORKDIR /app

COPY . /app/

RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 80

CMD ["/app/venv/bin/python", "-c", "from advice import app; app.run(host='0.0.0.0', port=80, debug=False)"]
