#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate

python manage.py shell -c "import os; from django.contrib.auth import get_user_model; U=get_user_model(); username=os.environ['DJANGO_SUPERUSER_USERNAME']; password=os.environ['DJANGO_SUPERUSER_PASSWORD']; email=os.environ.get('DJANGO_SUPERUSER_EMAIL',''); u,_=U.objects.get_or_create(username=username, defaults={'email':email}); u.email=email; u.is_active=True; u.is_staff=True; u.is_superuser=True; u.set_password(password); u.save(); print('Superuser password reset successfully')"