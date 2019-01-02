FROM python:3.7

WORKDIR  /doccano/

COPY requirements.txt /doccano/requirements.txt

RUN pip install -r requirements.txt

COPY . /doccano/

WORKDIR  /doccano/app/

RUN python manage.py migrate

RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | python manage.py shell


EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8000

