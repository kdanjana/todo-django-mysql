from django.db import models

# Create your models here.

class Task(models.Model):
    title = models.TextField(max_length=500)
    is_important = models.BooleanField(default=False, blank=True)
    is_complete = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.title}"