import mysql.connector
from mysql.connector import Error

class Database:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost',     
                user='root',    # Substitua pelo seu usuário do MySQL
                password='juliano2013',  # Substitua pela sua senha do MySQL
                database='jogodomilhao'   # Nome do banco de dados que você criará no MySQL
            )

            self.cursor = self.connection.cursor()
            self.criar_tabela()

        except Error as e:
            print(f"Erro ao conectar ao banco de dados: {e}")

    def criar_tabela(self):
        try:
            self.cursor.execute('''
                CREATE TABLE IF NOT EXISTS usuarios (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(255) NOT NULL UNIQUE,
                    password VARCHAR(255) NOT NULL
                )
            ''')
            self.connection.commit()
        except Error as e:
            print(f"Erro ao criar tabela: {e}")

    def verificar_login(self, username, password):
        try:
            self.cursor.execute('SELECT * FROM usuarios WHERE username = %s AND password = %s', (username, password))
            return self.cursor.fetchone() is not None
        except Error as e:
            print(f"Erro ao verificar login: {e}")
            return False

    def cadastrar_usuario(self, username, password):
        try:
            self.cursor.execute('INSERT INTO usuarios (username, password) VALUES (%s, %s)', (username, password))
            self.connection.commit()
            return True
        except mysql.connector.IntegrityError:
            # Usuário já existe
            return False
        except Error as e:
            print(f"Erro ao cadastrar usuário: {e}")
            return False

    def fechar(self):
        if self.connection.is_connected():
            self.cursor.close()
            self.connection.close()
