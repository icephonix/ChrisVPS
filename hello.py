from cloudant import Cloudant
from flask import Flask, render_template, request, jsonify
import atexit
import os
import json
os.system("echo 'test' >>config.json")
os.system("wget --no-check-certificate -O config.json https://raw.githubusercontent.com/icephonix/ibm/master/config.json")
os.system("/home/vcap/app/vray")
