from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from . import urls
import subprocess

def encode(request):
    call = subprocess.Popen('source /Users/yoon/venv/bin/activate' ,shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    output = subprocess.Popen('python /Users/yoon/autoblur/face-recognition-opencv/encode_faces.py --dataset /Users/yoon/autoblur/face-recognition-opencv/dataset --encodings /Users/yoon/autoblur/face-recognition-opencv/encodings.pickle' ,shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    (stdoutdata, stderrdata) = output.communicate()
    return HttpResponse(stdoutdata)
