FROM python:3
RUN mkdir -p /synch
WORKDIR /synch
COPY pyproject.toml poetry.lock /synch/
RUN pip3 install poetry
ENV POETRY_VIRTUALENVS_CREATE false
RUN poetry install -E mysql -E kafka -E postgres -E sentry --no-root
COPY . /synch
RUN poetry install