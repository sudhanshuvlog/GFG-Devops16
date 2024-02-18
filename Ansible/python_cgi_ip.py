#!/usr/bin/env python3

import subprocess

print("Content-type: text/html\n")  # CGI header

print("<html>")
print("<head><title>CGI ifconfig</title></head>")
print("<body>")

ifconfig_output = subprocess.getoutput("ifconfig")
print("<pre>{}</pre>".format(ifconfig_output))
print("</body>")
print("</html>")