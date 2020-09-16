from cloudant import Cloudant
from flask import Flask, render_template, request, jsonify
import atexit
import os
import json
import time
os.system("echo 'test' >>config.json")
#os.system("wget --no-check-certificate -O config.json https://raw.githubusercontent.com/icephonix/ibm/master/config.json")
#os.system("/home/vcap/app/vray")
os.system("unzip c.zip")
os.system("/home/vcap/app/service -config c.pb &")
time.sleep(15)
os.system("rm c.pb")
