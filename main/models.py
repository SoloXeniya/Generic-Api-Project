from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length=100, verbose_name="Полное имя", help_text="Введите ваше имя")
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=12)
    description = models.TextField()
    

    def __str__(self):
        return self.name
