FROM python:3.10
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
COPY ./app/service-account.json /code/app/service-account.json
RUN pip install "fastapi[standard]" --no-cache-dir
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./ /code/
CMD ["fastapi", "run"]