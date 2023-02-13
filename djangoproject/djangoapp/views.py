import datetime
from django.shortcuts import render
from django.template import loader 

# Create your views here.
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods  

def hello(request):
    return HttpResponse("<h1>Hello welcome</h1>")

def index(request):
    template = loader.get_template('index.html')
    name = {'student': 'Vineeth'}
    return HttpResponse(template.render(name))
@require_http_methods(["GET"])  
def show(request):  
    return HttpResponse('<h1>This is Http GET request.</h1>')  