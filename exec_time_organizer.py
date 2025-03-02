import subprocess

import gspread

# Executes the code and captures the output
ruby_script = "./Ruby/Algo1.rb"
process = subprocess.Popen(["ruby", ruby_script], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout, stderr = process.communicate()

# Handles errors
if process.returncode != 0:
    print(f"Error occurred while executing the script: {stderr.decode()}")
else:
    print(stdout.decode())

lang_exec_time = output.split("Execution time:")[1].strip()  # Extracts a specific part of the output
#print(f"Parte desejada: {parte_desejada}")

# Conecta-se à planilha pública
gc = gspread.Client(None)  # Sem autenticação
sheet = gc.open_by_url("https://docs.google.com/spreadsheets/d/1KBrz7iNv1NRu2qMRUi9mlzn-m8E6G878SwFXdMnqZNU/edit?gid=0#gid=0").sheet1

# Insere o valor na célula A1
sheet.update("A1", parte_desejada)
print("Dados inseridos com sucesso!")

