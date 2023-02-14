import time
import subprocess
from apscheduler.schedulers.background import BackgroundScheduler

fileID = 0

def create_log_file_job():
  global fileID
  fileID += 1
  fileName = "arquivo-" + str(fileID) + ".txt"
  file = open(fileName, "a")
  file.write("ID: " + str(fileID))
  file.close()
  subprocess.call([ "sh", "./runner.sh", str(fileID) ])

if __name__ == '__main__':
  scheduler = BackgroundScheduler()
  scheduler.add_job(create_log_file_job, 'cron', second=10)
  scheduler.start()
  
  while True:
    print("Running...")
    time.sleep(59)