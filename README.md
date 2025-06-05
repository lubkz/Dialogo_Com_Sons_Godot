🎙️ Godot Dialog Hub System

Sistema modular de diálogos customizados para jogos feitos com Godot Engine. Desenvolvido com foco em imersão narrativa, sincronização de áudio por letra e fácil integração com cenas e eventos.

📌 Funcionalidades

💬 Sistema de diálogo baseado em dicionários
Cada linha é definida com um Dictionary contendo:

"Line": Texto da fala

"Voice": Caminho do som para cada letra

"Name": Nome do personagem exibido


🎧 Som por caractere exibido
Cada letra exibida no texto aciona um som associado ao personagem, oferecendo feedback auditivo semelhante a jogos como Undertale e Animal Crossing.

🕒 Controle de tempo por tipo de caractere
Diferencia pausas por pontuação (., ,, !, ?) e espaços, proporcionando um ritmo natural à fala.

🪪 Nome do personagem exibido dinamicamente
A UI atualiza automaticamente o nome do personagem falando a cada nova linha.

🧩 Design modular e reutilizável
Criado para ser fácil de importar, adaptar e escalar para projetos maiores (RPGs, visual novels, etc).



---

📂 Estrutura dos Arquivos

res://
├── Scenes/
│   └── HUB_text_box.tscn         # Cena da caixa de diálogo
├── Scripts/
│   ├── DialogHubManager.gd       # Controlador global de diálogos
│   ├── HUB_text_box.gd           # Script da UI de texto
│   └── SampleEvent.gd            # Exemplo de evento com diálogo
├── Speech_sounds/
│   ├── Voice_grill.wav           # Voz do personagem "Girl"
│   └── Void1.wav                 # Voz alternativa (exemplo)


---

🧪 Exemplo de uso

📜 Script de evento (SampleEvent.gd)

var dialog_entries: Array[Dictionary] = [
	{ "Line": "Eu consigo.", "Voice": Girl_voice, "Name": "Girl" },
	{ "Line": "Dessa vez... eu vou conseguir!", "Voice": Girl_voice, "Name": "Girl" }
]

DialogHubManager.start_dialog(dialog_entries)

📊 Comportamento visual

Texto aparece letra por letra

Sons tocam junto com cada letra

Nome do personagem exibido no topo da caixa de diálogo

Avanço com tecla configurada (ex: "Enter" ou customizável por InputMap)



---

🚀 Como usar

1. Importe os arquivos DialogHubManager.gd e HUB_text_box.tscn no seu projeto.


2. Instancie DialogHubManager como nó global ou autoload.


3. Crie uma lista de dicionários contendo "Line", "Voice" e "Name".


4. Chame DialogHubManager.start_dialog(entries) com sua lista.




---

⚙️ Requisitos

Godot Engine 4.0 ou superior

Sistema de entrada configurado com ação "Advance line"



---

📌 Recursos aprendidos ou demonstrados

✔️ Manipulação de sinais e timers
✔️ Criação de UI dinâmica com Godot
✔️ Integração de áudio com fluxo de texto
✔️ Organização modular de scripts e cenas
✔️ Capacidade de adaptar tutoriais e montar sistemas próprios


---

🧠 Motivação

Esse projeto surgiu da necessidade de criar um sistema de diálogo personalizável e imersivo, capaz de ser usado em múltiplas cenas com mínima configuração. Foi inspirado em sistemas de narrativa interativa e adaptado com lógica própria de som e fluxo de texto.


---

📷 Screenshots (adicione se quiser)

Caso você queira, posso gerar mockups ou capturas do sistema em funcionamento para colocar aqui.


---

📜 Licença

Este projeto está sob a licença MIT. Sinta-se à vontade para usar, modificar e adaptar em seus próprios jogos.


---

Se quiser, posso adaptar esse README direto num arquivo README.md para você colar no seu repositório. Deseja?

