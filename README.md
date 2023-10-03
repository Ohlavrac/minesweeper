# MineSweeper
- Trabalho de Topicos Especiais em Computação, o presente trabalho refese a um campo minado com muitos testes...

# Requisitos
* O USUARIO deve selecionar dificuldade no menu do jogo
    - Verificar se foi selecionado o modo facil [OK]
    - Verificar se foi selecionado o modo medio [OK]
    - Verificar se foi selecionado o modo dificil [OK]
    - Verificar se o usuario selecionou um modo invalido [OK]
* Se FACIL o tabuleiro tera 8x8 e 10 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 8 linhas [OK]
    - Verificar se o tabuleiro tem 8 colunas [OK]
    - Verificar se o tabuleiro tem 64 campos
* Se MEDIO o tabuleiro tera 10x16 e 30 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 10 linhas [OK]
    - Verificar se o tabuleiro tem 16 colunas [OK]
    - Verificar se o tabuleiro tem 160 campos
* Se DIFICIL o tabuleiro tera 24x24 e 100 bombas
    - Verificar se foi criado um tabuleiro com o tamanho correto
    - Verificar se o tabuleiro tem 24 linhas [OK]
    - Verificar se o tabuleiro tem 24 colunas [OK]
    - Verificar se o tabuleiro tem 576 campos
* Quando iniciar o jogo o tabuleiro deve iniciar sem nenhuma descoberta
* Quando iniciar o jogo o timer deve comera em ZERO
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
* Quando o jogo iniciar um campo pode ser revelado
