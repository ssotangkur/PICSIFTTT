# PICSIFTTT
Integrate the PICS webcam streaming service with IFTTT

## Background
Originally developed to automate turning on/off lights via IFTTT when the PICS service starts/stops the camera. It turns out that it's pretty easy to customize this script to monitor any service log and trigger all sorts of custom events on IFTTT.

## Usage
1. Copy `sample_config.txt` to `config.txt` and enter your details.
1. Run `./picsifttt.sh` and monitor the output to see if your events are being sent to IFTTT

## How it works
The script uses journalctl to monitor your service's log. On every line it applies a grep regex to find any events to publish. If it finds one, it uses it `curl` the IFTTT webhook with your webhook API key. This completes the "trigger" side of IFTTT. You will still need to create an applet in IFTTT to connect this webhook event to the actions you want to trigger. 

## Installing it as a service
```
sudo cp picsifttt.service /etc/systemd/system/.
sudo systemctl start picsifttt.service
sudo systemctl enable picsifttt.service
```
