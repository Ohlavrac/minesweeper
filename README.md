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
* Quando iniciar o jogo deve ser apresentado as badeiras do USUARIO
* Quando o USUARIO marcar um campo com a bandeira uma bandeira deve ser removida do contador de bandeiras
    - Verificar se foi removido uma bandeira do contador [OK]
    - Verificar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver em ZERO [OK]
    - Verificar e retornar um erro se o USUARIO tentar marcar uma bandeira quando o contador estiver abaixo de ZERO [OK]
* Quando o USUARIO remover a bandeira de um campo essa bandeira deve ser adicionada novamente ao contador
    - Verificar se foi adicionada uma bandeira ao contador [OK]
    - Veriricar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver no limite [OK]
    - Verificar e retornar um erro se o USUARIO tentar remover uma bandeira se o contador estiver acima do limite [OK]
* Quando o jogo iniciar os campos podem ser marcados por uma bandeira
    - Verificar se o campo possui uma bandeira [OK]
    - Verificar se o campo não possui uma bandeira [OK]
    - Verificar se foi adicionado uma bandeira ao campo [OK]
    - Verificar se foi removido uma bandeira do campo [OK]
* Quando o jogo iniciar um campo aleatorio vai receber uma bomba
    - Verificar se um campo recebeu uma bomba
* Quando o jogo iniciar um campo pode ser revelado
    - Verificar se um campo foi marcado como revelado
* Quando um campo for verificado ele não pode ser desverificado
    - Verificar se o campo continua verificado mesmo apos ser "desverificado"
    - Se o campo for deverificado retornar Erro UnmarkedFieldError
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
    - Verificar se quando não tiver bomba nos campos adjacentes os campos vão abrir automaticamente
* Quando o jogo acabar deve ser salvo um resultado da partida em um historico
    - Verificar se foi retornado fim de jogo
    - Veriricar se foi retornado o historico salvo
* O USUARIO deve ter acesso ao historico das partidas
    - Veriricar e retornar a lista de historico
    - Verificar e retornar Lista Vazia se não tiver nada salvo
* Quando um campo for selecionado deve ser possivel recuber a linha e coluna do mesmo
    - Verificar se quando um campo for selecionado é retornado o valor da linha e da coluna [OK]
