from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from . import urls
import subprocess

def recognition(request):
    call = subprocess.Popen('source /Users/yoon/venv/bin/activate' ,shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    output = subprocess.Popen('python /Users/yoon/autoblur/face-recognition-opencv/recognize_faces_image.py --encodings /Users/yoon/autoblur/face-recognition-opencv/encodings.pickle \
	--image /Users/yoon/autoblur/face-recognition-opencv/examples/example_02.png' ,shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    (stdoutdata, stderrdata) = output.communicate()
    saveImg = subprocess.Popen('python /Users/yoon/autoblur/importgc.py', shell=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    return HttpResponse(stderrdata)