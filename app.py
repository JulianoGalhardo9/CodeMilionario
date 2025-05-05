import customtkinter as ctk
from PIL import Image, ImageTk

# Define o modo escuro
ctk.set_appearance_mode("dark")

class LoginApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Sistema de Login")
        self.geometry("700x400")
        self.resizable(False, False)

        # Layout da janela principal (2 colunas: imagem | login)
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        self.criar_interface()

    def criar_interface(self):
        # === Lado Esquerdo: Imagem ===
        imagem_original = Image.open("Exemplo2.webp").resize((300, 300))
        self.img = ImageTk.PhotoImage(imagem_original)

        self.lb_img = ctk.CTkLabel(self, text="", image=self.img)
        self.lb_img.grid(row=0, column=0, padx=20, pady=20)

        # === Lado Direito: Área de Login ===
        frame_login = ctk.CTkFrame(self)
        frame_login.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")

        # Título
        title_label = ctk.CTkLabel(frame_login, text="Faça seu Login para acessar o Game!",
                                   font=("Century Gothic", 16))
        title_label.pack(pady=(20, 10))

        # Campo de usuário
        self.entry_usuario = ctk.CTkEntry(frame_login, placeholder_text="Usuário")
        self.entry_usuario.pack(pady=10, padx=20)

        # Campo de senha
        self.entry_senha = ctk.CTkEntry(frame_login, placeholder_text="Senha", show="*")
        self.entry_senha.pack(pady=10, padx=20)

        # Botão de login
        login_button = ctk.CTkButton(frame_login, text="Entrar", command=self.acao_login)
        login_button.pack(pady=20)

    def acao_login(self):
        usuario = self.entry_usuario.get()
        senha = self.entry_senha.get()
        print(f"Usuário: {usuario}, Senha: {senha}")  # Apenas para teste

if __name__ == "__main__":
    app = LoginApp()
    app.mainloop()
