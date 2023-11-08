# Lista de Testes

# Lista de testes unitários:
    - Testar se foi selecionado o modo facil [OK]
    - Testar se foi selecionado o modo medio [OK]
    - Testar se foi selecionado o modo dificil [OK]
    - Testar se o usuario selecionou um modo invalido [OK]
    - Testar se o campo possui uma bandeira [OK]
    - Testar se o campo não possui uma bandeira [OK]
    - Testar se foi adicionado uma bandeira ao campo [OK]
    - Testar se um campo foi marcado como revelado [OK]
    - Testar se um campo foi marcado como revelado [OK]
    - Testar se o campo continua verificado mesmo apos ser "desverificado" [OK]
    - Testar se o campo selecionado possui uma bomba [OK]
    - Testar se o campo selecionado não possui uma bomba [OK]
    - Testar se o jogo acabou quando a bomba foi selecionada [OK]
    - Testar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver em ZERO [OK]
    - Testar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver abaixo de ZERO [OK]
    - Veriricar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver no limite [OK]
    - Testar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver acima do limite [OK]
# Lista de testes funcionais:
    - Testar se foi criado um tabuleiro com o tamanho correto [OK]
    - Testar se foi criado um tabuleiro com o tamanho correto [OK]
    - Testar se foi criado um tabuleiro com o tamanho correto [OK]
    - Testar se o campo [0][0] existe e pode ser marcado com bandeira modo facil [OK]
    - Testar se o campo [3][7] existe e pode ser marcado com bandeira modo facil [OK]
    - Testar se o campo [7][7] existe e pode ser marcado com bandeira modo facil [OK]
    - Testar se o campo [0][0] existe e pode ser marcado com bandeira modo medio [OK]
    - Testar se o campo [5][2] existe e pode ser marcado com bandeira modo medio [OK]
    - Testar se o campo [9][15] existe e pode ser marcado com bandeira modo medio [OK]
    - Testar se o campo [0][0] existe e pode ser marcado com bandeira modo dificil [OK]
    - Testar se o campo [11][18] existe e pode ser marcado com bandeira modo dificil [OK]
    - Testar se o campo [23][23] existe e pode ser marcado com bandeira modo dificil [OK]
    - Testar se o campo [0][0] existe e pode ser revelado modo facil [OK]
    - Testar se o campo [3][7] existe e pode ser revelado modo facil [OK]
    - Testar se o campo [7][7] existe e pode ser revelado modo facil [OK]
    - Testar se o campo [0][0] existe e pode ser revelado modo medio [OK]
    - Testar se o campo [5][2] existe e pode ser revelado modo medio [OK]
    - Testar se o campo [9][15] existe e pode ser revelado modo medio [OK]
    - Testar se o campo [0][0] existe e pode ser revelado modo dificil [OK]
    - Testar se o campo [11][18] existe e pode ser revelado modo dificil [OK]
    - Testar se o campo [23][23] existe e pode ser revelado modo dificil [OK]
    - Testar se o campo [0][0] continua revelado mesmo depois de ser desrevelado no modo facil [OK]
    - Testar se o campo [3][7] continua revelado mesmo depois de ser desrevelado no modo facil [OK]
    - Testar se o campo [7][7] continua revelado mesmo depois de ser desrevelado no modo facil [OK]
    - Testar se o campo [0][0] continua revelado mesmo depois de ser desrevelado no modo medio [OK]
    - Testar se o campo [5][2] continua revelado mesmo depois de ser desrevelado no modo medio [OK]
    - Testar se o campo [9][15] continua revelado mesmo depois de ser desrevelado no modo medio [OK]
    - Testar se o campo [0][0] continua revelado mesmo depois de ser desrevelado no modo dificil [OK]
    - Testar se o campo [11][18] continua revelado mesmo depois de ser desrevelado no modo dificil [OK]
    - Testar se o campo [23][23] continua revelado mesmo depois de ser desrevelado no modo dificil [OK]
    - Testar se o campo com bandeira foi revelado [OK]
    - Testar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 0 caso o campo [0][7] revelado não possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 0 caso o campo [7][0] revelado não possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 0 caso o campo [7][7] revelado não possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 1 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 1 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 1 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 2 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 2 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 2 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 3 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 3 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 3 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Testar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 0 caso o campo [0][15] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 0 caso o campo [9][0] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 0 caso o campo [9][15] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 1 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 1 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 1 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 2 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 2 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 2 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 3 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 3 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 3 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Testar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 0 caso o campo [0][23] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 0 caso o campo [23][0] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 0 caso o campo [23][23] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 1 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 1 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 1 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 2 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 2 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 2 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 3 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 3 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se retorna 3 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Testar se quando um campo for selecionado é retornado o valor da linha e da coluna [OK]
    - Testar se foi retornado true quando um campo com bomba for marcado com uma bandeira [OK]
    - Testar se foi retornado false quando um campo sem bomba for marcado [OK]
    - Testar se foi removido o valor true da lista de campos com bomba marcados quando o usuario remover a bandeira de um campo com bomba [OK]
# Lista de testes de validação:
    - Testar se o tabuleiro não tem linhas [OK]
    - Testar se o tabuleiro não tem mais de 8 linhas [OK]
    - Testar se o tabuleiro tem 8 colunas [OK]
    - Testar se o tabuleiro não tem colunas [OK]
    - Testar se o tabuleiro não tem mais de 8 colunas [OK]
    - Testar se o tabuleiro tem 64 campos [OK]
    - Testar se o tabuleiro tem 10 linhas [OK]
    - Testar se o tabuleiro não tem linhas [OK]
    - Testar se o tabuleiro não tem mais de 10 linhas [OK]
    - Testar se o tabuleiro tem 16 colunas [OK]
    - Testar se o tabuleiro não tem colunas [OK]
    - Testar se o tabuleiro não tem mais de 16 colunas [OK]
    - Testar se o tabuleiro tem 160 campos [OK]
    - Testar se o tabuleiro tem 24 linhas [OK]
    - Testar se o tabuleiro não tem linhas [OK]
    - Testar se o tabuleiro não tem mais de 24 linhas [OK]
    - Testar se o tabuleiro tem 24 colunas [OK]
    - Testar se o tabuleiro não tem colunas [OK]
    - Testar se o tabuleiro não tem mais de 24 colunas [OK]
    - Testar se o tabuleiro tem 576 campos [OK]
    - Testar se o tabuleiro possui 10 bombas [OK]
    - Testar se o tabuleiro não possui bombas [OK]
    - Testar se o tabuleiro possui mais de 10 bombas [OK]
    - Testar se o tabuleiro possui 30 bombas [OK]
    - Testar se o tabuleiro não possui bombas [OK]
    - Testar se o tabuleiro possui mais de 30 bombas [OK]
    - Testar se o tabuleiro possui 100 bombas [OK]
    - Testar se o tabuleiro não possui bombas [OK]
    - Testar se o tabuleiro possui mais de 100 bombas [OK]
    - Testar se os 64 campos do modo facil foram criados de forma limpa [OK]
    - Testar se os 160 campos do modo medio foram criados de forma limpa [OK]
    - Testar se os 576 campos do modo dificil foram criados de forma limpa [OK]
    - Testar se o timer esta com 0 segundos ao iniciar o jogo [OK]
    - Testar se nenhum dos 64 campos do modo facil possui bandeira quando o tabuliro for criado [OK]
    - Testar se nenhum dos 160 campos do modo medio possui bandeira quando o tabuliro for criado [OK]
    - Testar se nenhum dos 576 campos do modo dificil possui bandeira quando o tabuliro for criado [OK]
    - Testar se o jogo começou com 10 bandeiras no contador de bandeiras no modo facil [OK]
    - Testar se não tem bandeiras no contador de bandeiras quando o jogo começar [OK]
    - Testar se existe mais de 10 bandeiras no contador de bandeiras [OK]
    - Testar se o jogo começou com 30 bandeiras no contador de bandeiras no modo medio [OK]
    - Testar se não tem bandeiras no contador de bandeiras quando o jogo começar [OK]
    - Testar se existe mais de 30 bandeiras no contador de bandeiras [OK]
    - Testar se o jogo começou com 100 bandeiras no contador de bandeiras no modo dificil [OK]
    - Testar se não tem bandeiras no contador de bandeiras quando o jogo começar [OK]
    - Testar se existe mais de 100 bandeiras no contador de bandeiras [OK]
    - Testar se foi retornado fim de jogo ganho modo facil [OK]
    - Testar se foi retornado fim de jogo ganho modo medio [OK]
    - Testar se foi retornado fim de jogo ganho modo dificil [OK]
    - Testar se as 10 bandeira estão marcando as 10 bombas no modo facil [OK]
    - Testar se as 30 bandeiras estão marcando as 30 bombas no modo medio [OK]
    - Testar se as 100 bandeiras estão marcando as 100 bombas no modo dificil [OK]
    - Testar se todos os campos sem bombas foram descobertos no modo facil [OK]
    - Testar se todos os campos sem bombas foram descobertos no modo medio [OK]
    - Testar se todos os campos sem bombas foram descobertos no modo dificl [OK]
    - Testar se o contador de bandeiras esta vazio no modo facil [OK]
    - Testar se o contador de bandeiras esta vazio no modo medio [OK]
    - Testar se o contador de bandeiras esta vazio no modo dificil [OK]
    - Testar se foi removido uma bandeira do contador [OK]
    - Testar se foi adicionada uma bandeira ao contador [OK]
    - Testar se é retornado 0 caso o campo revelado não possua bombas vizinhas [OK]
    - Testar se é retornado 1 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 2 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 3 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 4 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 5 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 6 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 7 caso o campo revelado possua possua bombas vizinhas [OK]
    - Testar se é retornado 8 caso o campo revelado possua possua bombas vizinhas [OK]
# Lista de testes de interface:
    - Testar se o botao de modo facil leva ate a tela do jogo [UI] [OK]
    - Testar se o botao de modo medio leva ate a tela do jogo [UI] [OK]
    - Testar se o botao de modo dificil leva ate a tela do jogo [UI] [OK]
    - Testar se o botão de modo facil foi criado no menu [UI] [OK]
    - Testar se o botão de modo medio foi criado no menu [UI] [OK]
    - Testar se o botão de modo dificil foi criado no menu [UI] [OK]
    - Testar se foi criado um tabuleiro com o tamanho correto [UI] [OK]
    - Testar se foi criado um tabuleiro com o tamanho correto [UI] [OK]
    - Testar se foi criado um tabuleiro com o tamanho correto [UI] [OK]
    - Testar se o timer esta com 0 segundos ao iniciar o jogo [UI] [OK]
    - Testar se o timer não esta com 1 segundos ao iniciar o jogo [UI] [OK]
    - Testar se o timer esta com 11 segundos depois de 11 secs de jogo [UI] [OK]
    - Testar se o jogo começou com 10 bandeiras no contador de bandeiras no modo facil [UI] [OK]
    - Testar se o jogo começou com 30 bandeiras no contador de bandeiras no modo medio [UI] [OK]
    - Testar se o jogo começou com 100 bandeiras no contador de bandeiras no modo dificil [UI] [OK]
    - Testar se o campo [0][0] fica com icone de bandeira quando marcado no modo facil [UI] [OK]
    - Testar se o campo [3][7] fica com icone de bandeira quando marcado no modo facil [UI] [OK]
    - Testar se o campo [7][7] fica com icone de bandeira quando marcado no modo facil [UI] [OK]
    - Testar se o campo [0][0] fica com icone de bandeira quando marcado no modo medio [UI] [OK]
    - Testar se o campo [5][2] fica com icone de bandeira quando marcado no modo medio [UI] [OK]
    - Testar se o campo [9][15] fica com icone de bandeira quando marcado no modo medio [UI] [OK]
    - Testar se o campo [0][0] fica com icone de bandeira quando marcado no modo dificil [UI] [OK]
    - Testar se o campo [11][18] fica com icone de bandeira quando marcado no modo dificil [UI] [OK]
    - Testar se o campo [23][23] fica com icone de bandeira quando marcado no modo dificil [UI] [OK]
    - Testar se aparece a mensagem de fim de jogo quando o usuario seleciona uma bomba no modo facil [UI] [OK]
    - Testar se aparece a mensagem de fim de jogo quando o usuario seleciona uma bomba no modo medio [UI] [OK]
    - Testar se aparece a mensagem de fim de jogo quando o usuario seleciona uma bomba no modo dificil [UI] [OK]
    - Testar se o contador fica com 9 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo facil [UI] [OK]
    - Testar se o contador fica com 29 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo medio [UI] [OK]
    - Testar se o contador fica com 99 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo dificil [UI] [OK]
    - Testar se o contador fica com 0 bandeiras no contador de bandeiras apos marcar 10 campos com uma bandeira no modo facil [UI] [OK]
    - Testar se o contador fica com 0 bandeiras no contador de bandeiras apos marcar 30 campos com uma bandeira no modo medio [UI] [OK]
    - Testar se o contador fica com 0 bandeiras no contador de bandeiras apos marcar 100 campos com uma bandeira no modo dificil [UI] [OK]
    - Testar se o contador fica com 1 bandeiras no contador de bandeiras apos marcar 10 campos e depois remover uma bandeira no modo facil [UI] [OK]
    - Testar se o contador fica com 1 bandeiras no contador de bandeiras apos marcar 30 campos e depois remover uma bandeira no modo medio [UI] [OK]
    - Testar se o contador fica com 1 bandeiras no contador de bandeiras apos marcar 100 campos e depois remover uma bandeira no modo dificil [UI] [OK]
    - Testar se o campo [0][0] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [3][7] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [7][7] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [0][0] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [5][2] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [9][15] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [0][0] continua cinza quando desrevelado no modo dificil [UI] [OK]
    - Testar se o campo [11][18] continua cinza quando desrevelado no modo dificil [UI] [OK]
    - Testar se o campo [23][23] continua cinza quando desrevelado no modo dificil [UI] [OK]
     - Testar se o campo [0][0] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [3][7] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [7][7] continua cinza quando desrevelado no modo facil [UI] [OK]
    - Testar se o campo [0][0] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [5][2] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [9][15] continua cinza quando desrevelado no modo medio [UI] [OK]
    - Testar se o campo [0][0] continua cinza quando desrevelado no modo dificil [UI] [OK]
    - Testar se o campo [11][18] continua cinza quando desrevelado no modo dificil [UI] [OK]
    - Testar se o campo [23][23] continua cinza quando desrevelado no modo dificil [UI] [OK]