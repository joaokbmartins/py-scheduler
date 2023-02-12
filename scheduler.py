import schedule
import time
from schedule import every, repeat

fileID = 0

@repeat(every(3).seconds)
def job():
  global fileID
  fileID += 1
  fileName = "arquivo-" + str(fileID) + ".txt"
  file = open(fileName, "a")
  file.write("ID: " + str(fileID))
  file.close()

while True:
  schedule.run_pending()
  time.sleep(1)