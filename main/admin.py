from django.contrib import admin

from .models import Contact

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone')
    list_display_links = ('name', 'email', 'phone')
    search_fields = ('name', 'phone', 'id')

    

