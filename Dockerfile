ARG PYTHON_VERSION=3.9

FROM python:${PYTHON_VERSION}

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    python3-setuptools \
    python3-wheel

run pip3 install Twisted

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .


EXPOSE 5000

# replace APP_NAME with module name
CMD ["python", "Server.py", "5000"]
#run python3 Server.py 5000
