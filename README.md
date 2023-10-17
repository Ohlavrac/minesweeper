# MineSweeper
- Trabalho de Topicos Especiais em Computação, o presente trabalho refese a um campo minado com muitos testes...

# Requisitos
* O USUARIO deve selecionar dificuldade no menu do jogo
    - Verificar se foi selecionado o modo facil [OK]
    - Verificar se foi selecionado o modo medio [OK]
    - Verificar se foi selecionado o modo dificil [OK]
    - Verificar se o usuario selecionou um modo invalido [OK]
    - Verificar se o botão de modo facil foi criado no menu [UI] [OK]
    - Verificar se o botão de modo medio foi criado no menu [UI] [OK]
    - Verificar se o botão de modo dificil foi criado no menu [UI] [OK]
* Se FACIL o tabuleiro tera 8x8 e 10 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 8 linhas [OK]
    - Verificar se o tabuleiro tem 8 colunas [OK]
    - Verificar se o tabuleiro tem 64 campos [OK] 
    - Verificar se foram criadas 10 bombas [OK]
* Se MEDIO o tabuleiro tera 10x16 e 30 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 10 linhas [OK]
    - Verificar se o tabuleiro tem 16 colunas [OK]
    - Verificar se o tabuleiro tem 160 campos [OK]
    - Verificar se foram criadas 30 bombas [OK]
* Se DIFICIL o tabuleiro tera 24x24 e 100 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 24 linhas [OK]
    - Verificar se o tabuleiro tem 24 colunas [OK]
    - Verificar se o tabuleiro tem 576 campos [OK]
    - Verificar se foram criadas 100 bombas [OK]
* Quando iniciar o jogo o tabuleiro deve iniciar limpo
    - Verificar se os 64 campos do modo facil foram criados de forma limpa [OK]
    - Verificar se os 160 campos do modo medio foram criados de forma limpa [OK]
    - Verificar se os 576 campos do modo dificil foram criados de forma limpa [OK]
    - Verificar se nenhum dos 64 campos do modo facil possui bandeira quando o tabuliro for criado [OK]
    - Verificar se nenhum dos 160 campos do modo medio possui bandeira quando o tabuliro for criado [OK]
    - Verificar se nenhum dos 576 campos do modo dificil possui bandeira quando o tabuliro for criado [OK]
* Quando iniciar o jogo o timer deve comera em ZERO
    - Verificar se o timer esta com 0 segundos ao iniciar o jogo [OK]
    - Verificar se o timer esta com 0 segundos ao iniciar o jogo [UI] [OK]
    - Verificar se o timer não esta com 1 segundos ao iniciar o jogo [UI] [OK]
    - Verificar se o timer esta com 11 segundos depois de 11 secs de jogo [UI] [OK]
* Quando iniciar o jogo deve ser apresentado as badeiras do USUARIO
* Quando o USUARIO marcar um campo com a bandeira uma bandeira deve ser removida do contador de bandeiras
    - Verificar se foi removido uma bandeira do contador [OK]
    - Verificar se o contador fica com 9 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo facil [UI] [OK]
    - Verificar se o contador fica com 29 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo medio [UI] [OK]
    - Verificar se o contador fica com 99 bandeiras no contador de bandeiras apos marcar um campo com uma bandeira no modo dificil [UI] [OK]
    - Verificar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver em ZERO [OK]
    - Verificar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver abaixo de ZERO [OK]
* Quando o USUARIO remover a bandeira de um campo essa bandeira deve ser adicionada novamente ao contador
    - Verificar se foi adicionada uma bandeira ao contador [OK]
    - Veriricar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver no limite [OK]
    - Verificar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver acima do limite [OK]
* Quando o jogo iniciar o contador de badeiras deve estar completo
    - Verificar se o jogo começou com 10 bandeiras no contador de bandeiras no modo facil [UI] [OK]
    - Verificar se o jogo começou com 30 bandeiras no contador de bandeiras no modo medio [UI] [OK]
    - Verificar se o jogo começou com 100 bandeiras no contador de bandeiras no modo dificil [UI] [OK]
    - Verificar se o jogo começou com 10 bandeiras no contador de bandeiras no modo facil [OK]
    - Verificar se o jogo começou com 30 bandeiras no contador de bandeiras no modo medio [OK]
    - Verificar se o jogo começou com 100 bandeiras no contador de bandeiras no modo dificil [OK]
* Quando o jogo iniciar os campos podem ser marcados por uma bandeira
    - Verificar se o campo possui uma bandeira [OK]
    - Verificar se o campo não possui uma bandeira [OK]
    - Verificar se foi adicionado uma bandeira ao campo [OK]
    - Verificar se foi removido uma bandeira do campo [OK]
* Quando o jogo iniciar um campo aleatorio vai receber uma bomba
    - Verificar se um campo recebeu uma bomba
* Quando o jogo iniciar um campo pode ser revelado
    - Verificar se um campo foi marcado como revelado [OK]
* Quando um campo for verificado ele não pode ser desverificado
    - Verificar se o campo continua verificado mesmo apos ser "desverificado" [OK]
* Quando um campo tiver uma bandeira ele não pode ser revelado
    - Verificar se o campo com bandeira foi revelado [OK]
* Quando o USUARIO selecionar um campo com uma bomba o jogo acaba com derrota
    - Verificar se o campo selecionado possui uma bomba [OK]
    - Verificar se o campo selecionado não possui uma bomba [OK]
    - Verificar se o jogo acabou quando a bomba foi selecionada
* Quando o USUARIO marcar todas as bombas de forma correta o jogo acaba com vitoria
    - Verificar se todas as bombas foram encontradas
    - Verificar se todos os campos sem bombas foram descobertos
* Quando o USUARIO marcar um campo sem bombas deve ser revelado se existe alguma bomba adijacente a ele
    - Verificar se é retornado 0 caso o campo revelado não possua bombas vizinhas [OK]
    - Verificar se é retornado 1 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 2 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 3 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 4 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 5 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 6 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 7 caso o campo revelado possua possua bombas vizinhas [OK]
    - Verificar se é retornado 8 caso o campo revelado possua possua bombas vizinhas [OK]
    // BORDAS MODO FACIL
    - Verificar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 0 caso o campo [0][7] revelado não possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 0 caso o campo [7][0] revelado não possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 0 caso o campo [7][7] revelado não possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 1 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 1 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 1 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 2 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 2 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 2 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 3 caso o campo [0][7] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 3 caso o campo [7][0] revelado possua bombas vizinha MODO FACIL [OK]
    - Verificar se retorna 3 caso o campo [7][7] revelado possua bombas vizinha MODO FACIL [OK]
    
    // BORDAS MODO MEDIO
    - Verificar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 0 caso o campo [0][15] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 0 caso o campo [9][0] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 0 caso o campo [9][15] revelado não possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 1 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 1 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 1 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 2 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 2 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 2 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 3 caso o campo [0][15] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 3 caso o campo [9][0] revelado possua bombas vizinha MODO MEDIO [OK]
    - Verificar se retorna 3 caso o campo [9][15] revelado possua bombas vizinha MODO MEDIO [OK]
    // BORDAS MODO DIFICIL
    - Verificar se retorna 0 caso o campo [0][0] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 0 caso o campo [0][23] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 0 caso o campo [23][0] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 0 caso o campo [23][23] revelado não possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 1 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 1 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 1 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 1 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 2 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 2 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 2 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 2 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 3 caso o campo [0][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 3 caso o campo [0][23] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 3 caso o campo [23][0] revelado possua bombas vizinha MODO DIFICIL [OK]
    - Verificar se retorna 3 caso o campo [23][23] revelado possua bombas vizinha MODO DIFICIL [OK]
* Quando o jogo acabar deve ser salvo um resultado da partida em um historico
    - Verificar se foi retornado fim de jogo
    - Veriricar se foi retornado o historico salvo
* Quando o usuario marcar com bandeira todas os campos com bomba o jogo deve acabar
    - Verificar se as 10 bandeira estão marcando as 10 bombas no modo facil [OK]
    - Verificar se as 30 bandeiras estão marcando as 30 bombas no modo medio [OK]
    - Verificar se as 100 bandeiras estão marcando as 100 bombas no modo dificil [OK]
* O USUARIO deve ter acesso ao historico das partidas
    - Veriricar e retornar a lista de historico
    - Verificar e retornar Lista Vazia se não tiver nada salvo
* Quando um campo for selecionado deve ser possivel recuber a linha e coluna do mesmo
    - Verificar se quando um campo for selecionado é retornado o valor da linha e da coluna [OK]
* Quando o usuario por uma bandeira em um campo com bomba deve ser inserido um valor true na lista de bombas marcadas
    - Verificar se foi retornado true quando um campo com bomba for marcado com uma bandeira [OK]
    - Verificar se foi retornado false quando um campo sem bomba for marcado [OK]
    - Verificar se foi removido o valor true da lista de campos com bomba marcados quando o usuario remover a bandeira de um campo com bomba [OK]
