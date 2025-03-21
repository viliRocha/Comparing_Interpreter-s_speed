import subprocess
import csv

# Executes the code and captures the output
ruby_script = "./Ruby/Algo1.rb"
process = subprocess.Popen(["ruby", ruby_script], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout, stderr = process.communicate()

output = ""

# Handles errors
if process.returncode != 0:
    print(f"Error occurred while executing the script: {stderr.decode()}")
else:
    output = stdout.decode()

lang_exec_time = output.split("Execution time:")[1].strip()

# Saves to a CSV file
with open("exec_time.csv", mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Execution"])
    writer.writerow([lang_exec_time])

print("Data successfully saved in the CSV file!")
