# 🎙️ Godot Dialog Hub System

Sistema modular de diálogos customizados para jogos feitos com **Godot Engine**. Desenvolvido com foco em **imersão narrativa**, sincronização de áudio por caractere e fácil integração com cenas e eventos.

---

## 📌 Funcionalidades

- 💬 **Sistema de diálogo baseado em dicionários**  
  Cada linha é definida com um `Dictionary` contendo:
  - `"Line"`: Texto da fala  
  - `"Voice"`: Caminho do som para cada letra  
  - `"Name"`: Nome do personagem exibido

- 🎧 **Som por caractere exibido**  
  Sons são tocados conforme o texto aparece, criando uma sensação de fala estilizada (estilo *Undertale* ou *Animal Crossing*).

- 🕒 **Controle de tempo por tipo de caractere**  
  Pausas específicas para pontuação (`.`, `!`, `?`, etc.), melhorando o ritmo e a leitura do texto.

- 🪪 **Nome do personagem exibido dinamicamente**  
  A interface mostra o nome correto do personagem para cada linha do diálogo.

- 🧩 **Design modular e reutilizável**  
  O sistema é plug-and-play. Pode ser reaproveitado em qualquer parte do jogo com apenas uma chamada de função.

---

## 📂 Estrutura dos Arquivos

res:// ├── Scenes/ │   └── HUB_text_box.tscn         # Cena da caixa de diálogo ├── Scripts/ │   ├── DialogHubManager.gd       # Controlador global de diálogos │   ├── HUB_text_box.gd           # Script da UI de texto │   └── SampleEvent.gd            # Exemplo de evento com diálogo ├── Speech_sounds/ │   ├── Voice_grill.wav           # Voz do personagem "Girl" │   └── Void1.wav                 # Voz alternativa (exemplo)

---

## 🧪 Exemplo de Uso

### 📜 Script de evento (`SampleEvent.gd`)

```gdscript
var dialog_entries: Array[Dictionary] = [
	{ "Line": "Eu consigo.", "Voice": Girl_voice, "Name": "Girl" },
	{ "Line": "Dessa vez... eu vou conseguir!", "Voice": Girl_voice, "Name": "Girl" }
]

DialogHubManager.start_dialog(dialog_entries)

📊 Comportamento Visual

Texto aparece letra por letra

Sons são reproduzidos com cada letra

Nome do personagem exibido

Avanço do diálogo com tecla (ex: "Advance line")



---

🚀 Como Usar

1. Adicione DialogHubManager.gd como autoload no seu projeto:

Vá em Project > Project Settings > Autoload

Adicione DialogHubManager.gd com o nome DialogHubManager



2. Crie ou adapte eventos com uma lista de falas:

DialogHubManager.start_dialog(sequencia_de_dialogos)


3. Certifique-se de que a cena HUB_text_box.tscn está correta no caminho exportado.




---

⚙️ Requisitos

Godot Engine 4.0+

Ação de entrada "Advance line" configurada no projeto (InputMap)



---

📌 Recursos Demonstrados

Manipulação de sinais e timers

Criação de UI dinâmica e modular

Integração de áudio com fluxo de texto

Organização de código escalável

Capacidade de adaptar lógica de tutoriais para soluções próprias



---

🧠 Motivação

Esse projeto foi criado para resolver um problema comum em jogos narrativos: como montar diálogos ricos com som e controle visual simples, sem reescrever código a cada nova cena.


---

📜 Licença

Distribuído sob a licença MIT. Livre para usar, modificar e distribuir, com ou sem créditos.


---

> Projeto por Seu Nome ou GitHub — sinta-se livre para contribuir ou adaptar.



---

Se quiser, posso montar esse arquivo `.md` direto pra você baixar. Quer?

