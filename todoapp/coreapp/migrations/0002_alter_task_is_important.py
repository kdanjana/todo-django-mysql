# Generated by Django 4.2.6 on 2023-10-09 09:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('coreapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task',
            name='is_important',
            field=models.BooleanField(blank=True, default=False),
        ),
    ]
