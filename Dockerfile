
FROM python:3.10-slim

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#копирует все requerements.txt
COPY requirements.txt .
#устанавливает зависимости, перечисленные в файле requerements.txt, используя инструмент управления пакетами pip. 
RUN python -m pip install -r requirements.txt

#как будет называться рабочая область проекта
WORKDIR /app
#скопируй все файлы проекта из локальной директории внешнего проекта внутри контейнера в директорию app
COPY . /app

#создает пользователя без права root  с явным UID и добавляет разрешение на доступ к папке /app
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

#запускаем сервер django при старте контейнера
CMD ["python", "manage.py", "runserver", "127.0.0.1:8000"]
