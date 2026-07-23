from django.conf import settings


def mapbox_key(request):
    return {
        "MAPBOX_KEY": settings.MAPBOX_KEY
    }