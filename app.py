#! /usr/bin/python
#https://forums.raspberrypi.com/viewtopic.php?t=217431
from flask import Flask, render_template
import os
import subprocess 



app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/button_ON')
def button_1():
    # firefox --new-tab https://www.google.com/
    # make run -C /home/marco/soc_work/22b-soc-labs-marcotuliomrt/Entrega_1
    os.system('./root/hps_gpio -n')
    print("Python received the command: button on")
    return render_template('index.html')
     
@app.route('/button_OFF')
def button_2():
    os.system('./root/hps_gpio -f')
    print("Python received the command: button off")
    return render_template('index.html')
    
@app.route('/button_ler')
def button_3():
    os.system('./root/hps_gpio -r')
    print("Python received the command: button read")

    proc = subprocess.Popen(["./root/hps_gpio -r"], stdout=subprocess.PIPE, shell=True)
    (out, err) = proc.communicate()
    print ("hps_gpio output read on python:", out)    

    out_ascii = out.decode('ascii')
   
    if out_ascii == "button_pressed":
        button_status = "Botão pressionado"
    else:
        button_status = "Botão não pressionado"


    return render_template('index.html', george = button_status)



if __name__ == '__main__':
    app.run(debug=True, port=80, host='0.0.0.0')