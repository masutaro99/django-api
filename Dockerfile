FROM python:3.8.2-slim-buster
# 作業ディレクトリを設定
WORKDIR /usr/src

# 環境変数を設定
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Pipenvをインストール
RUN pip install --upgrade pip \
  && pip install pipenv

COPY Pipfile /usr/src/Pipfile

# pipfileからパッケージをインストールしてDjango環境を構築
RUN pipenv install --skip-lock --system --dev

# ホストのカレントディレクトリ（現在はappディレクトリ）を作業ディレクトリにコピー
COPY . /usr/src