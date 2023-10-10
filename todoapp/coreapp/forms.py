from django import forms

from .models import Task


class TaskForm(forms.ModelForm):
    class Meta:
        model = Task
        fields = ["title", "is_important"]
        labels = {
            "title": "Todo",
        }
        widgets = {
            "title": forms.TextInput(attrs={'class': 'myfieldclass'})
        }

 
    def clean(self):
        print("1111")
        super(TaskForm, self).clean()
        title = self.cleaned_data.get('title')
        if len(title) < 3:
            self._errors['title'] = self.error_class([
                        'Please enter todo item.'])            
        return self.cleaned_data
    