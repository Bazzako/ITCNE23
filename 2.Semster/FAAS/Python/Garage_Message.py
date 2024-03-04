from threading import Thread

import paho.mqtt.client as mqtt
import schedule
import time

GARAGE_DOOR_TOPIC = "Dennis/Thor"


def on_connect(client, userdata, flags, rc):
    print("Connected with result code " + str(rc))
    client.subscribe(GARAGE_DOOR_TOPIC)


def on_message(client, userdata, msg):
    global last_state, notification_sent, last_opened_timestamp
    msg_str = msg.payload.decode("utf-8")
    print(msg.topic, msg_str)


client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("cloud.tbz.ch", 1883, 60)

client.loop_start()

garage_is_open = False

def send_fake_garage_door_state():
    global garage_is_open, client
    if garage_is_open:
        client.publish(GARAGE_DOOR_TOPIC, "-0.03,0.0,-0.85")
    else:
        client.publish(GARAGE_DOOR_TOPIC, "-0.03,0.99,0.05")
    garage_is_open = not garage_is_open


schedule.clear()
schedule.every(5).seconds.do(send_fake_garage_door_state)


def schedule_thread():
    while True:
        schedule.run_pending()
        time.sleep(1)


if __name__ == '__main__':
    thread_schedule = Thread(target=schedule_thread, args=())
    thread_schedule.start()

