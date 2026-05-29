import '../models/question.dart';

class QuestionsDatabase {
  static const List<List<Question>> allPhases = [
    // FASE 1 - Primeira Guerra Mundial
    [
      Question(
        question: 'Em que ano começou a Primeira Guerra Mundial?',
        options: ['1910', '1914', '1918', '1939'],
        correctIndex: 1,
        explanation: 'A Primeira Guerra Mundial começou em 1914 com o assassinato do arquiduque Francisco Ferdinando.',
      ),
      Question(
        question: 'Qual evento estopim desencadeou a Primeira Guerra Mundial?',
        options: [
          'A invasão da Bélgica pela Alemanha',
          'O afundamento do Lusitânia',
          'O assassinato do arquiduque Francisco Ferdinando',
          'A Revolução Russa',
        ],
        correctIndex: 2,
        explanation: 'O assassinato do arquiduque Francisco Ferdinando em Sarajevo em 28 de junho de 1914 foi o estopim da guerra.',
      ),
      Question(
        question: 'Qual país não fazia parte da Tríplice Aliança antes da Primeira Guerra Mundial?',
        options: ['Alemanha', 'Áustria-Hungria', 'Itália', 'França'],
        correctIndex: 3,
        explanation: 'A Tríplice Aliança era composta por Alemanha, Áustria-Hungria e Itália. A França integrava a Tríplice Entente.',
      ),
      Question(
        question: 'Em que ano os Estados Unidos entraram na Primeira Guerra Mundial?',
        options: ['1914', '1915', '1917', '1918'],
        correctIndex: 2,
        explanation: 'Os EUA entraram na guerra em 1917, em parte devido ao afundamento de navios americanos por submarinos alemães.',
      ),
      Question(
        question: 'Qual tratado encerrou oficialmente a Primeira Guerra Mundial?',
        options: [
          'Tratado de Versalhes',
          'Tratado de Brest-Litovsk',
          'Tratado de Trianon',
          'Tratado de Paris',
        ],
        correctIndex: 0,
        explanation: 'O Tratado de Versalhes, assinado em 1919, encerrou oficialmente a Primeira Guerra Mundial.',
      ),
      Question(
        question: 'Qual inovação tecnológica foi amplamente utilizada pela primeira vez na Primeira Guerra Mundial?',
        options: ['Canhão', 'Espingarda', 'Gás venenoso', 'Canhão naval'],
        correctIndex: 2,
        explanation: 'O uso de gás venenoso em larga escala foi uma das inovações bélicas mais terríveis da Primeira Guerra Mundial.',
      ),
      Question(
        question: 'Como ficou conhecida a zona de combate entre as trincheiras alemãs e aliadas?',
        options: [
          'Zona Neutra',
          'Terra de Ninguém',
          'Corredor da Morte',
          'Faixa Sangrenta',
        ],
        correctIndex: 1,
        explanation: 'A "Terra de Ninguém" era o espaço entre as trincheiras inimigas, constantemente varrido por fogo cruzado.',
      ),
      Question(
        question: 'Qual batalha da Primeira Guerra Mundial foi uma das mais mortais da história?',
        options: [
          'Batalha de Waterloo',
          'Batalha do Marne',
          'Batalha do Somme',
          'Batalha de Stalingrado',
        ],
        correctIndex: 2,
        explanation: 'A Batalha do Somme em 1916 resultou em mais de um milhão de baixas, sendo uma das mais sangrentas da história.',
      ),
      Question(
        question: 'Qual foi a consequência política mais importante para a Alemanha após a Primeira Guerra Mundial?',
        options: [
          'A divisão em dois países',
          'A perda de territórios e pesadas reparações de guerra',
          'A colonização pela França',
          'A expansão para o Leste Europeu',
        ],
        correctIndex: 1,
        explanation: 'O Tratado de Versalhes impôs à Alemanha pesadas reparações de guerra e a perda de vários territórios.',
      ),
      Question(
        question: 'Qual país saiu da Primeira Guerra Mundial após a Revolução Bolchevique?',
        options: ['Itália', 'Turquia', 'Rússia', 'Bulgária'],
        correctIndex: 2,
        explanation: 'Após a Revolução Bolchevique de 1917, a Rússia assinou o Tratado de Brest-Litovsk e saiu da guerra.',
      ),
    ],

    // FASE 2 - Segunda Guerra Mundial
    [
      Question(
        question: 'Em que ano a Alemanha nazista invadiu a Polônia, iniciando a Segunda Guerra Mundial?',
        options: ['1937', '1938', '1939', '1940'],
        correctIndex: 2,
        explanation: 'A invasão da Polônia em 1º de setembro de 1939 marcou o início da Segunda Guerra Mundial.',
      ),
      Question(
        question: 'Qual era o nome do plano de extermínio de judeus pela Alemanha nazista?',
        options: [
          'Plano Ariano',
          'Solução Final',
          'Operação Barbarossa',
          'Plano Fuhrer',
        ],
        correctIndex: 1,
        explanation: 'A "Solução Final" foi o eufemismo utilizado pelos nazistas para descrever o genocídio sistemático dos judeus.',
      ),
      Question(
        question: 'Qual foi o codinome da invasão alemã à União Soviética em 1941?',
        options: [
          'Operação Overlord',
          'Operação Barbarossa',
          'Operação Dynamo',
          'Operação Market Garden',
        ],
        correctIndex: 1,
        explanation: 'A Operação Barbarossa foi a maior invasão militar da história, iniciada pela Alemanha contra a URSS em junho de 1941.',
      ),
      Question(
        question: 'Qual evento levou os Estados Unidos a entrar na Segunda Guerra Mundial?',
        options: [
          'Invasão da França',
          'Bombardeio de Pearl Harbor',
          'Queda de Paris',
          'Batalha de Stalingrado',
        ],
        correctIndex: 1,
        explanation: 'O ataque japonês à base naval de Pearl Harbor, no Havaí, em dezembro de 1941, fez os EUA declararem guerra ao Japão.',
      ),
      Question(
        question: 'Em que cidade ocorreu o julgamento dos líderes nazistas após a guerra?',
        options: ['Berlim', 'Viena', 'Nuremberg', 'Munique'],
        correctIndex: 2,
        explanation: 'Os Julgamentos de Nuremberg (1945-1946) foram tribunais militares internacionais realizados na cidade alemã de Nuremberg.',
      ),
      Question(
        question: 'Qual foi o nome do dia do desembarque aliado na Normandia em 1944?',
        options: ['Dia X', 'Dia V', 'Dia D', 'Dia N'],
        correctIndex: 2,
        explanation: 'O "Dia D", em 6 de junho de 1944, foi o maior desembarque anfíbio da história, marcando a libertação da Europa Ocidental.',
      ),
      Question(
        question: 'Quais cidades japonesas foram atingidas pelas bombas atômicas em 1945?',
        options: [
          'Tóquio e Osaka',
          'Hiroshima e Nagasaki',
          'Kyoto e Hiroshima',
          'Nagasaki e Tóquio',
        ],
        correctIndex: 1,
        explanation: 'As cidades de Hiroshima (6 ago) e Nagasaki (9 ago) de 1945 foram bombardeadas atomicamente pelos EUA, levando ao fim da guerra.',
      ),
      Question(
        question: 'Quem era o líder da Alemanha nazista durante a Segunda Guerra Mundial?',
        options: ['Hermann Göring', 'Heinrich Himmler', 'Adolf Hitler', 'Joseph Goebbels'],
        correctIndex: 2,
        explanation: 'Adolf Hitler foi o líder (Führer) da Alemanha nazista de 1933 até sua morte em 30 de abril de 1945.',
      ),
      Question(
        question: 'Qual batalha é considerada o ponto de virada da guerra no front Oriental?',
        options: [
          'Batalha de Moscou',
          'Batalha de Kursk',
          'Batalha de Stalingrado',
          'Batalha de Kiev',
        ],
        correctIndex: 2,
        explanation: 'A Batalha de Stalingrado (1942-43) foi o ponto de virada: a derrota alemã marcou o início do recuo nazista no Leste.',
      ),
      Question(
        question: 'Em que ano terminou a Segunda Guerra Mundial?',
        options: ['1943', '1944', '1945', '1946'],
        correctIndex: 2,
        explanation: 'A Segunda Guerra Mundial terminou em 1945: a Alemanha capitulou em maio e o Japão em setembro do mesmo ano.',
      ),
    ],

    // FASE 3 - Revolução Francesa
    [
      Question(
        question: 'Em que ano ocorreu a Revolução Francesa?',
        options: ['1776', '1789', '1799', '1804'],
        correctIndex: 1,
        explanation: 'A Revolução Francesa começou em 1789 com a tomada da Bastilha em 14 de julho.',
      ),
      Question(
        question: 'Qual foi o principal símbolo do início da Revolução Francesa?',
        options: [
          'A execução do rei Luís XVI',
          'A tomada da Bastilha',
          'A Declaração dos Direitos do Homem',
          'A fuga da família real',
        ],
        correctIndex: 1,
        explanation: 'A tomada da Bastilha em 14 de julho de 1789 é o símbolo máximo da Revolução Francesa e feriado nacional da França.',
      ),
      Question(
        question: 'Qual rei foi guilhotinado durante a Revolução Francesa?',
        options: ['Luís XIV', 'Luís XV', 'Luís XVI', 'Carlos X'],
        correctIndex: 2,
        explanation: 'Luís XVI foi guilhotinado em 21 de janeiro de 1793, após ser julgado e condenado pela Convenção Nacional.',
      ),
      Question(
        question: 'Qual foi o lema da Revolução Francesa?',
        options: [
          'Paz, Terra e Pão',
          'Liberdade, Igualdade e Fraternidade',
          'Fé, Pátria e Família',
          'Justiça, Ordem e Progresso',
        ],
        correctIndex: 1,
        explanation: '"Liberdade, Igualdade e Fraternidade" é o lema da Revolução Francesa e até hoje o motto oficial da República Francesa.',
      ),
      Question(
        question: 'Qual período da Revolução Francesa ficou marcado pelo terror e execuções em massa?',
        options: [
          'Período Jacobino',
          'Era Napoleon',
          'O Grande Terror',
          'Fase Girondina',
        ],
        correctIndex: 2,
        explanation: 'O "Grande Terror" (1793-1794) foi um período de repressão intensa liderado por Robespierre, com milhares de execuções.',
      ),
      Question(
        question: 'Quem foi o principal líder do período do Terror durante a Revolução Francesa?',
        options: [
          'Jean-Paul Marat',
          'Georges Danton',
          'Maximilien Robespierre',
          'Jacques Necker',
        ],
        correctIndex: 2,
        explanation: 'Maximilien Robespierre liderou o Comitê de Salvação Pública durante o Terror, até ser ele próprio guilhotinado em 1794.',
      ),
      Question(
        question: 'Qual documento aprovado em 1789 estabeleceu os princípios da Revolução Francesa?',
        options: [
          'Declaração dos Direitos do Homem e do Cidadão',
          'Constituição Francesa',
          'Carta Magna Francesa',
          'Código Napoleônico',
        ],
        correctIndex: 0,
        explanation: 'A Declaração dos Direitos do Homem e do Cidadão (1789) proclamou os princípios de liberdade, igualdade e soberania popular.',
      ),
      Question(
        question: 'A Revolução Francesa foi influenciada por quais eventos anteriores?',
        options: [
          'Revolução Industrial e Reforma Protestante',
          'Revolução Americana e Iluminismo',
          'Renascimento e Cruzadas',
          'Revolução Russa e Socialismo',
        ],
        correctIndex: 1,
        explanation: 'A Revolução Americana (1776) e os ideais iluministas de pensadores como Rousseau e Voltaire influenciaram fortemente a Revolução Francesa.',
      ),
      Question(
        question: 'O que era o "Terceiro Estado" na França pré-revolucionária?',
        options: [
          'A nobreza e o clero',
          'Os militares e a burguesia',
          'O restante da população, incluindo burgueses e camponeses',
          'Os nobres empobrecidos',
        ],
        correctIndex: 2,
        explanation: 'O Terceiro Estado representava a maioria da população francesa (burgueses, artesãos e camponeses) excluída dos privilégios da nobreza e do clero.',
      ),
      Question(
        question: 'Como terminou a Revolução Francesa e quem assumiu o poder?',
        options: [
          'Com a restauração da monarquia por Luís XVII',
          'Com o golpe de Estado de Napoleão Bonaparte em 1799',
          'Com a proclamação da República por Robespierre',
          'Com a intervenção militar inglesa',
        ],
        correctIndex: 1,
        explanation: 'O 18 Brumário (1799) foi o golpe de Estado de Napoleão Bonaparte, que encerrou a fase revolucionária e iniciou o Consulado.',
      ),
    ],

    // FASE 4 - Revolução Industrial
    [
      Question(
        question: 'Em qual país surgiu a Revolução Industrial no século XVIII?',
        options: ['França', 'Alemanha', 'Inglaterra', 'Estados Unidos'],
        correctIndex: 2,
        explanation: 'A Revolução Industrial surgiu na Inglaterra na segunda metade do século XVIII, graças às inovações tecnológicas e ao acúmulo de capital.',
      ),
      Question(
        question: 'Qual invenção é considerada o símbolo da Primeira Revolução Industrial?',
        options: ['A locomotiva', 'A máquina a vapor', 'O tear mecânico', 'O alto-forno'],
        correctIndex: 1,
        explanation: 'A máquina a vapor, aperfeiçoada por James Watt, foi a principal força motriz da Revolução Industrial.',
      ),
      Question(
        question: 'O que foi o ludismo durante a Revolução Industrial?',
        options: [
          'Um movimento artístico de trabalhadores',
          'Uma festa popular da classe operária',
          'Um movimento de trabalhadores que destruíam máquinas',
          'Uma teoria econômica de Adam Smith',
        ],
        correctIndex: 2,
        explanation: 'Os ludistas eram trabalhadores que destruíam máquinas por acreditar que elas estavam tomando seus empregos na Inglaterra do início do século XIX.',
      ),
      Question(
        question: 'Qual filósofo desenvolveu o conceito de "mais-valia" para criticar o capitalismo industrial?',
        options: ['Adam Smith', 'Karl Marx', 'John Stuart Mill', 'David Ricardo'],
        correctIndex: 1,
        explanation: 'Karl Marx desenvolveu o conceito de mais-valia em "O Capital", argumentando que os capitalistas se apropriam do trabalho excedente dos operários.',
      ),
      Question(
        question: 'O que caracterizava o sistema de trabalho nas fábricas durante a Revolução Industrial?',
        options: [
          'Jornadas de 8 horas e bons salários',
          'Trabalho ao ar livre e liberdade de horários',
          'Jornadas extenuantes, baixos salários e uso de mão de obra infantil',
          'Cooperativas de trabalhadores autônomos',
        ],
        correctIndex: 2,
        explanation: 'As condições de trabalho na Revolução Industrial eram brutais: jornadas de 14-16 horas, salários mínimos e trabalho infantil eram comuns.',
      ),
      Question(
        question: 'Qual foi a principal fonte de energia da Segunda Revolução Industrial?',
        options: ['Vapor', 'Eletricidade e petróleo', 'Carvão', 'Energia hidráulica'],
        correctIndex: 1,
        explanation: 'A Segunda Revolução Industrial (fins do séc. XIX) foi impulsionada pela eletricidade e pelo petróleo, além do desenvolvimento da indústria química.',
      ),
      Question(
        question: 'Qual processo de produção foi introduzido por Henry Ford no início do século XX?',
        options: [
          'Produção artesanal',
          'Sistema de manufaturas',
          'Linha de montagem (produção em série)',
          'Sistema corporativo',
        ],
        correctIndex: 2,
        explanation: 'Henry Ford criou a linha de montagem móvel em 1913, que permitiu a produção em série e barateou o custo dos automóveis.',
      ),
      Question(
        question: 'O que foi o "Cartismo" durante a Revolução Industrial britânica?',
        options: [
          'Um movimento de colonização industrial',
          'Um movimento operário por direitos políticos',
          'Uma corrente filosófica capitalista',
          'Uma política de comércio exterior',
        ],
        correctIndex: 1,
        explanation: 'O Cartismo foi um movimento político britânico (1838-1857) que buscava direitos políticos para os trabalhadores, como o sufrágio universal masculino.',
      ),
      Question(
        question: 'Qual cidade inglesa foi o principal centro têxtil durante a Revolução Industrial?',
        options: ['Londres', 'Liverpool', 'Manchester', 'Birmingham'],
        correctIndex: 2,
        explanation: 'Manchester tornou-se o principal centro têxtil do mundo durante a Revolução Industrial, sendo chamada de "Cottonopolis".',
      ),
      Question(
        question: 'Que documento foi publicado em 1848 por Marx e Engels como crítica ao capitalismo industrial?',
        options: [
          'A Riqueza das Nações',
          'O Manifesto Comunista',
          'O Contrato Social',
          'A Origem das Espécies',
        ],
        correctIndex: 1,
        explanation: 'O "Manifesto Comunista" (1848) foi escrito por Marx e Engels convocando os trabalhadores a se unirem contra a exploração capitalista.',
      ),
    ],

    // FASE 5 - Brasil Colônia
    [
      Question(
        question: 'Em que ano Pedro Álvares Cabral chegou ao Brasil?',
        options: ['1492', '1498', '1500', '1520'],
        correctIndex: 2,
        explanation: 'Pedro Álvares Cabral chegou ao Brasil em 22 de abril de 1500, durante uma expedição portuguesa com destino às Índias.',
      ),
      Question(
        question: 'Qual foi o primeiro produto de exportação explorado pelos portugueses no Brasil colonial?',
        options: ['Açúcar', 'Pau-brasil', 'Ouro', 'Algodão'],
        correctIndex: 1,
        explanation: 'O pau-brasil, madeira avermelhada usada para tingir tecidos, foi o primeiro produto explorado pelos portugueses no Brasil.',
      ),
      Question(
        question: 'Qual sistema de administração foi adotado por Portugal para colonizar o Brasil em 1532?',
        options: [
          'Sistema de Sesmarias',
          'Capitanias Hereditárias',
          'Governo Geral',
          'Sistema Foral',
        ],
        correctIndex: 1,
        explanation: 'As Capitanias Hereditárias dividiram o Brasil em 15 faixas de terra doadas a nobres portugueses (donatários) para colonizar.',
      ),
      Question(
        question: 'Quem foi o primeiro Governador-Geral do Brasil, nomeado em 1549?',
        options: [
          'Martim Afonso de Sousa',
          'Tomé de Sousa',
          'Mem de Sá',
          'Duarte da Costa',
        ],
        correctIndex: 1,
        explanation: 'Tomé de Sousa foi o primeiro Governador-Geral do Brasil (1549), fundando Salvador como capital da colônia.',
      ),
      Question(
        question: 'Qual ciclo econômico marcou os séculos XVII e XVIII no Brasil colonial?',
        options: [
          'Ciclo do Pau-brasil',
          'Ciclo do Café',
          'Ciclo do Ouro',
          'Ciclo da Borracha',
        ],
        correctIndex: 2,
        explanation: 'O Ciclo do Ouro (séc. XVII-XVIII) foi o período de maior riqueza do Brasil colonial, com as minas em Minas Gerais, Goiás e Mato Grosso.',
      ),
      Question(
        question: 'O que foi a Inconfidência Mineira e em que ano ocorreu?',
        options: [
          'Revolta dos escravos em 1789',
          'Movimento separatista em Minas Gerais em 1789',
          'Revolução popular do Rio de Janeiro em 1792',
          'Conspiração dos indígenas em 1798',
        ],
        correctIndex: 1,
        explanation: 'A Inconfidência Mineira (1789) foi uma conspiração de elite em Minas Gerais contra o domínio português, inspirada pelos ideais iluministas.',
      ),
      Question(
        question: 'Quem foi Tiradentes e qual foi seu destino?',
        options: [
          'Governador de Minas Gerais, exilado em Portugal',
          'Líder da Inconfidência Mineira, enforcado e esquartejado',
          'Comerciante de diamantes, preso em Lisboa',
          'Militar português, traído pelos conspiradores',
        ],
        correctIndex: 1,
        explanation: 'Joaquim José da Silva Xavier, o Tiradentes, foi o único condenado à morte na Inconfidência Mineira, sendo enforcado e esquartejado em 1792.',
      ),
      Question(
        question: 'Por que a família real portuguesa veio ao Brasil em 1808?',
        options: [
          'Para supervisionar a extração de ouro',
          'Para escapar das invasões napoleônicas em Portugal',
          'Para combater os holandeses no Brasil',
          'Para realizar uma visita diplomática',
        ],
        correctIndex: 1,
        explanation: 'A vinda da família real em 1808 foi motivada pela invasão de Portugal pelas tropas de Napoleão Bonaparte, lideradas pelo general Junot.',
      ),
      Question(
        question: 'Qual foi a principal fonte de mão de obra no Brasil colonial?',
        options: [
          'Trabalhadores portugueses assalariados',
          'Mão de obra indígena e africana escravizada',
          'Imigrantes europeus',
          'Trabalho familiar dos colonos',
        ],
        correctIndex: 1,
        explanation: 'O Brasil colonial baseou sua economia no trabalho escravo: primeiro dos indígenas e depois, predominantemente, dos africanos sequestrados.',
      ),
      Question(
        question: 'Qual acordo abriu os portos brasileiros para o comércio com nações amigas em 1808?',
        options: [
          'Tratado de Methuen',
          'Carta Régia de Abertura dos Portos',
          'Tratado de Comércio Anglo-Português',
          'Decreto de Liberdade Comercial',
        ],
        correctIndex: 1,
        explanation: 'A Carta Régia de 28 de janeiro de 1808 abriu os portos do Brasil para o comércio com países aliados de Portugal, beneficiando principalmente a Inglaterra.',
      ),
    ],

    // FASE 6 - Ditadura Militar no Brasil
    [
      Question(
        question: 'Em que ano ocorreu o golpe militar que instaurou a ditadura no Brasil?',
        options: ['1960', '1962', '1964', '1968'],
        correctIndex: 2,
        explanation: 'O golpe militar de 31 de março/1º de abril de 1964 derrubou o presidente João Goulart e iniciou 21 anos de ditadura militar.',
      ),
      Question(
        question: 'Qual presidente foi deposto pelo golpe militar de 1964?',
        options: [
          'Juscelino Kubitschek',
          'Jânio Quadros',
          'João Goulart',
          'Eurico Gaspar Dutra',
        ],
        correctIndex: 2,
        explanation: 'João Goulart (Jango) foi deposto pelo golpe de 1964 enquanto estava em Porto Alegre e exilou-se no Uruguai.',
      ),
      Question(
        question: 'O que estabelecia o Ato Institucional nº 5 (AI-5) de 1968?',
        options: [
          'A abertura política gradual',
          'A suspensão de direitos políticos e civis e o fechamento do Congresso',
          'A criação de novos partidos políticos',
          'A realização de eleições diretas',
        ],
        correctIndex: 1,
        explanation: 'O AI-5 (13/12/1968) foi o ato mais duro da ditadura: fechou o Congresso, cassou mandatos, suspendeu o habeas corpus e permitiu torturas.',
      ),
      Question(
        question: 'Durante qual governo ocorreu o chamado "Milagre Econômico" no Brasil?',
        options: [
          'Governo Castello Branco',
          'Governo Costa e Silva',
          'Governo Médici',
          'Governo Geisel',
        ],
        correctIndex: 2,
        explanation: 'O "Milagre Econômico" ocorreu no governo Médici (1969-1974), com crescimento do PIB superior a 10% ao ano, mas com concentração de renda.',
      ),
      Question(
        question: 'O que foi o DOI-CODI durante a ditadura militar?',
        options: [
          'Um programa de desenvolvimento econômico',
          'Um órgão de censura à imprensa',
          'O principal órgão de repressão e tortura do regime',
          'Um departamento de obras públicas',
        ],
        correctIndex: 2,
        explanation: 'O DOI-CODI (Destacamento de Operações de Informações) foi o principal órgão de repressão do regime militar, responsável por torturas e mortes.',
      ),
      Question(
        question: 'Qual projeto político foi adotado pelo governo Geisel a partir de 1974?',
        options: [
          'Endurecimento da ditadura',
          'Abertura política "lenta, gradual e segura"',
          'Realização de eleições diretas imediatas',
          'Criação de um novo partido militar',
        ],
        correctIndex: 1,
        explanation: 'O general Geisel iniciou a distensão política, chamada de abertura "lenta, gradual e segura", que levaria ao fim do regime.',
      ),
      Question(
        question: 'O que foi a campanha "Diretas Já" de 1983-1984?',
        options: [
          'Uma campanha pela abertura de novos mercados',
          'Um movimento popular por eleições presidenciais diretas',
          'Uma mobilização contra a inflação',
          'Uma campanha pela anistia política',
        ],
        correctIndex: 1,
        explanation: 'As "Diretas Já" foi um movimento de massa que reuniu milhões de brasileiros pedindo eleições presidenciais diretas, após 20 anos de ditadura.',
      ),
      Question(
        question: 'Quem foi o último presidente do regime militar no Brasil?',
        options: [
          'Ernesto Geisel',
          'João Figueiredo',
          'Artur Costa e Silva',
          'Humberto Castello Branco',
        ],
        correctIndex: 1,
        explanation: 'João Figueiredo (1979-1985) foi o último presidente do regime militar, tendo governado durante a abertura política e a crise econômica dos anos 80.',
      ),
      Question(
        question: 'Qual artista brasileiro foi exilado durante a ditadura por suas músicas de protesto?',
        options: [
          'Roberto Carlos',
          'Caetano Veloso e Gilberto Gil',
          'Elis Regina',
          'Chico Buarque apenas',
        ],
        correctIndex: 1,
        explanation: 'Caetano Veloso e Gilberto Gil foram presos em 1968 e depois exilados em Londres até 1972 devido às suas músicas de postura crítica ao regime.',
      ),
      Question(
        question: 'Em que ano foi promulgada a Lei de Anistia no Brasil durante a ditadura?',
        options: ['1974', '1977', '1979', '1982'],
        correctIndex: 2,
        explanation: 'A Lei de Anistia de 1979 permitiu o retorno de exilados políticos ao Brasil, mas também beneficiou agentes do Estado responsáveis por torturas.',
      ),
    ],

    // FASE 7 - Guerra Fria
    [
      Question(
        question: 'Qual foi o período aproximado da Guerra Fria?',
        options: ['1920-1945', '1945-1991', '1950-1980', '1939-1989'],
        correctIndex: 1,
        explanation: 'A Guerra Fria durou de 1945 (fim da Segunda Guerra Mundial) a 1991 (dissolução da União Soviética).',
      ),
      Question(
        question: 'Quais eram as duas superpotências em disputa na Guerra Fria?',
        options: [
          'EUA e China',
          'URSS e China',
          'EUA e União Soviética',
          'Grã-Bretanha e União Soviética',
        ],
        correctIndex: 2,
        explanation: 'A Guerra Fria foi a disputa geopolítica, ideológica e militar entre os Estados Unidos (capitalismo) e a União Soviética (comunismo).',
      ),
      Question(
        question: 'O que foi a "Corrida Espacial" durante a Guerra Fria?',
        options: [
          'Uma competição de aviões militares',
          'A disputa entre EUA e URSS pela exploração do espaço',
          'Um programa conjunto de exploração espacial',
          'Uma competição de foguetes balísticos',
        ],
        correctIndex: 1,
        explanation: 'A Corrida Espacial foi a disputa tecnológica entre EUA e URSS para dominar o espaço, com o Sputnik (1957) e a chegada à Lua (1969) como marcos.',
      ),
      Question(
        question: 'O que foi a "Doutrina Truman" de 1947?',
        options: [
          'Um plano econômico para reconstruir a Europa',
          'Uma política dos EUA de conter o avanço do comunismo',
          'Um acordo de paz entre EUA e URSS',
          'Um programa de ajuda militar à Coreia',
        ],
        correctIndex: 1,
        explanation: 'A Doutrina Truman (1947) comprometia os EUA a apoiar nações ameaçadas pelo comunismo, sendo a base da política de contenção americana.',
      ),
      Question(
        question: 'Em que ano foi construído o Muro de Berlim e quando caiu?',
        options: [
          'Construído em 1955, caiu em 1985',
          'Construído em 1961, caiu em 1989',
          'Construído em 1949, caiu em 1991',
          'Construído em 1963, caiu em 1990',
        ],
        correctIndex: 1,
        explanation: 'O Muro de Berlim foi erguido em agosto de 1961 para impedir a fuga de alemães do Leste para o Oeste, e caiu em novembro de 1989.',
      ),
      Question(
        question: 'O que foi a Crise dos Mísseis de 1962?',
        options: [
          'O teste nuclear soviético na Sibéria',
          'A tensão entre EUA e URSS após instalação de mísseis soviéticos em Cuba',
          'O teste de mísseis americanos no Pacífico',
          'Uma crise militar na fronteira entre Alemanha e URSS',
        ],
        correctIndex: 1,
        explanation: 'A Crise dos Mísseis (outubro de 1962) foi o momento mais tenso da Guerra Fria: mísseis soviéticos em Cuba quase levaram ao confronto nuclear.',
      ),
      Question(
        question: 'O que foi o Plano Marshall e qual seu objetivo?',
        options: [
          'Um plano militar de defesa da Europa Ocidental',
          'Um programa americano de ajuda econômica para reconstruir a Europa pós-guerra',
          'Um acordo de livre comércio entre EUA e Europa',
          'Um programa de rearme americano',
        ],
        correctIndex: 1,
        explanation: 'O Plano Marshall (1948-1952) foi um programa de ajuda econômica dos EUA para reconstruir a Europa Ocidental e impedir o avanço comunista.',
      ),
      Question(
        question: 'Qual foi o primeiro satélite artificial lançado na história, pela URSS em 1957?',
        options: ['Vostok 1', 'Sputnik 1', 'Luna 1', 'Cosmos 1'],
        correctIndex: 1,
        explanation: 'O Sputnik 1, lançado pela URSS em 4 de outubro de 1957, foi o primeiro satélite artificial a orbitar a Terra, iniciando a Corrida Espacial.',
      ),
      Question(
        question: 'O que foi a OTAN (NATO) criada em 1949?',
        options: [
          'Uma aliança militar das nações comunistas',
          'Uma aliança militar do bloco ocidental liderado pelos EUA',
          'Uma organização de comércio transatlântico',
          'Um acordo de paz entre Alemanha e Aliados',
        ],
        correctIndex: 1,
        explanation: 'A OTAN (Organização do Tratado do Atlântico Norte) é uma aliança militar ocidental criada em 1949 para a defesa coletiva contra possível agressão soviética.',
      ),
      Question(
        question: 'Como terminou a Guerra Fria?',
        options: [
          'Com uma guerra nuclear limitada',
          'Com a dissolução da União Soviética em 1991',
          'Com o Tratado de Paz de Genebra em 1990',
          'Com a reunificação da Alemanha em 1989',
        ],
        correctIndex: 1,
        explanation: 'A Guerra Fria terminou com a dissolução da União Soviética em 25 de dezembro de 1991, quando Mikhail Gorbachev renunciou à presidência.',
      ),
    ],

    // FASE 8 - Independência do Brasil
    [
      Question(
        question: 'Em que data é comemorada a Independência do Brasil?',
        options: ['22 de Abril', '7 de Setembro', '15 de Novembro', '21 de Abril'],
        correctIndex: 1,
        explanation: 'O 7 de Setembro de 1822 é a data da proclamação da Independência do Brasil às margens do riacho Ipiranga, em São Paulo.',
      ),
      Question(
        question: 'Quem proclamou a Independência do Brasil em 1822?',
        options: [
          'Dom João VI',
          'José Bonifácio de Andrada e Silva',
          'Dom Pedro I',
          'Leopoldina de Habsburgo',
        ],
        correctIndex: 2,
        explanation: 'Dom Pedro I proclamou a Independência do Brasil em 7 de setembro de 1822, às margens do riacho Ipiranga, gritando "Independência ou Morte!".',
      ),
      Question(
        question: 'Qual era a relação de Dom Pedro com Portugal quando proclamou a Independência?',
        options: [
          'Era general do exército português',
          'Era príncipe herdeiro e regente do Brasil',
          'Era governador nomeado pelas Cortes',
          'Era embaixador português no Brasil',
        ],
        correctIndex: 1,
        explanation: 'Dom Pedro era o príncipe herdeiro de Portugal e regente do Brasil desde 1821, quando Dom João VI retornou a Lisboa.',
      ),
      Question(
        question: 'Qual foi o papel de José Bonifácio de Andrada e Silva na Independência?',
        options: [
          'Liderou as tropas contra Portugal',
          'Foi o principal conselheiro e ministro de Dom Pedro, o "Patriarca da Independência"',
          'Redigiu a Constituição de 1824',
          'Organizou a campanha militar pela independência',
        ],
        correctIndex: 1,
        explanation: 'José Bonifácio foi o principal articulador político da independência, sendo chamado de "Patriarca da Independência" por seu papel fundamental.',
      ),
      Question(
        question: 'O que foi o "Dia do Fico" em 9 de janeiro de 1822?',
        options: [
          'O dia em que Dom João VI partiu para Portugal',
          'A data em que Dom Pedro se recusou a retornar a Portugal',
          'O dia da assinatura da independência',
          'A data da coroação de Dom Pedro I',
        ],
        correctIndex: 1,
        explanation: 'No "Dia do Fico" (9/01/1822), Dom Pedro desafiou as Cortes Portuguesas e disse "Fico!" ao recusar-se a retornar para Portugal.',
      ),
      Question(
        question: 'Em que ano Dom Pedro I foi coroado imperador do Brasil?',
        options: ['1822', '1823', '1824', '1825'],
        correctIndex: 0,
        explanation: 'Dom Pedro I foi coroado imperador do Brasil em 1º de dezembro de 1822, poucos meses após a proclamação da independência.',
      ),
      Question(
        question: 'Como Portugal reconheceu oficialmente a Independência do Brasil?',
        options: [
          'Através do Tratado de Lisboa em 1824',
          'Mediante pagamento de indenização ao rei português em 1825',
          'Com a assinatura do Tratado do Rio de Janeiro em 1826',
          'Após a guerra de independência em 1823',
        ],
        correctIndex: 1,
        explanation: 'Portugal reconheceu a independência brasileira em 1825 mediante o pagamento de 2 milhões de libras como indenização a Dom João VI.',
      ),
      Question(
        question: 'Qual foi a primeira Constituição do Brasil, outorgada por Dom Pedro I?',
        options: [
          'Constituição de 1823',
          'Constituição de 1824',
          'Constituição de 1826',
          'Constituição de 1821',
        ],
        correctIndex: 1,
        explanation: 'A Constituição de 1824 foi outorgada por Dom Pedro I após dissolver a Assembleia Constituinte; vigorou por 65 anos, até a Proclamação da República.',
      ),
      Question(
        question: 'Por que Dom Pedro I abdicou do trono brasileiro em 1831?',
        options: [
          'Para retornar a Portugal e lutar pelo trono lusitano',
          'Devido à pressão militar dos países vizinhos',
          'Por problemas de saúde graves',
          'Por exigência da Igreja Católica',
        ],
        correctIndex: 0,
        explanation: 'Dom Pedro I abdicou em favor de seu filho (o futuro Dom Pedro II) em 1831, pois precisava voltar a Portugal para lutar pelo trono em nome de sua filha Maria.',
      ),
      Question(
        question: 'Qual região do Brasil resistiu mais à independência, apoiando as tropas portuguesas?',
        options: ['Pernambuco', 'Grão-Pará (atual Pará)', 'Rio Grande do Sul', 'Bahia apenas'],
        correctIndex: 1,
        explanation: 'A região do Grão-Pará (atual Pará) foi uma das últimas a aderir à independência, resistindo com o apoio de tropas portuguesas até agosto de 1823.',
      ),
    ],

    // FASE 9 - Idade Média
    [
      Question(
        question: 'Qual período histórico é chamado de Idade Média?',
        options: [
          'Séculos I ao X d.C.',
          'Séculos V ao XV d.C.',
          'Séculos X ao XVI d.C.',
          'Séculos III ao XII d.C.',
        ],
        correctIndex: 1,
        explanation: 'A Idade Média convencionalmente vai do século V (queda de Roma, 476 d.C.) ao século XV (queda de Constantinopla, 1453 d.C.).',
      ),
      Question(
        question: 'O que foi o feudalismo, sistema predominante na Idade Média?',
        options: [
          'Um sistema de comércio marítimo',
          'Um sistema político-econômico baseado na posse de terras e relações de vassalagem',
          'Uma forma de governo democrático',
          'Um sistema de produção urbana em corporações',
        ],
        correctIndex: 1,
        explanation: 'O feudalismo era um sistema baseado na posse de terras (feudo) onde senhores (suseranos) protegiam vassalos em troca de serviços militares e lealdade.',
      ),
      Question(
        question: 'O que foram as Cruzadas medievais?',
        options: [
          'Guerras entre cristãos e pagãos na Europa',
          'Expedições militares cristãs para reconquistar Jerusalém dos muçulmanos',
          'Campanhas missionárias dos franciscanos na Ásia',
          'Guerras entre o Papa e os reis europeus',
        ],
        correctIndex: 1,
        explanation: 'As Cruzadas (séc. XI-XIII) foram expedições militares organizadas pelo papado para reconquistar a Terra Santa (Jerusalém) dos muçulmanos.',
      ),
      Question(
        question: 'Qual doença devastou a Europa no século XIV, matando cerca de 1/3 da população?',
        options: [
          'Varíola',
          'Cólera',
          'Peste Negra (Bubônica)',
          'Lepra',
        ],
        correctIndex: 2,
        explanation: 'A Peste Negra (1347-1351) foi uma pandemia de peste bubônica que matou entre 25 a 50 milhões de pessoas na Europa medieval.',
      ),
      Question(
        question: 'O que era o Sistema de Corporações de Ofício na Idade Média?',
        options: [
          'Associações de cavaleiros para a guerra',
          'Associações de artesãos que controlavam a produção e o comércio de ofícios específicos',
          'Grupos religiosos monásticos',
          'Guildas de comerciantes marítimos',
        ],
        correctIndex: 1,
        explanation: 'As Corporações de Ofício eram associações de artesãos que regulavam a produção, os preços e a formação de profissionais em cada área.',
      ),
      Question(
        question: 'Qual foi o papel da Igreja Católica na sociedade medieval?',
        options: [
          'Limitava-se às questões espirituais dos fiéis',
          'Dominava todos os aspectos da vida: religioso, político, econômico e cultural',
          'Era apenas uma instituição assistencial para os pobres',
          'Tinha poder apenas sobre os monastérios',
        ],
        correctIndex: 1,
        explanation: 'A Igreja Católica era a instituição mais poderosa da Idade Média, controlando a educação, cobrando impostos (dízimo), possuindo terras e influenciando reis.',
      ),
      Question(
        question: 'O que foi a Inquisição medieval?',
        options: [
          'Um tribunal eclesiástico para investigar e punir heresias',
          'Uma escola de teologia criada pelo Papa',
          'Um concílio de bispos para reformar a Igreja',
          'Um movimento de reforma religiosa',
        ],
        correctIndex: 0,
        explanation: 'A Inquisição foi um tribunal da Igreja Católica criado no séc. XIII para investigar e punir (muitas vezes com tortura e morte) os acusados de heresia.',
      ),
      Question(
        question: 'Quem foi Carlos Magno e qual seu papel na Europa medieval?',
        options: [
          'O último imperador romano',
          'Rei Franco que unificou grande parte da Europa Ocidental e foi coroado imperador em 800',
          'O fundador da Igreja Católica medieval',
          'O líder das primeiras Cruzadas',
        ],
        correctIndex: 1,
        explanation: 'Carlos Magno (742-814) reuniu grande parte da Europa Ocidental sob seu governo e foi coroado imperador pelo Papa em 800, revigorando a ideia imperial.',
      ),
      Question(
        question: 'O que foi a Magna Carta, assinada em 1215 na Inglaterra?',
        options: [
          'A primeira constituição democrática do mundo',
          'Um documento que limitava o poder do rei inglês João Sem-Terra',
          'O tratado de paz entre Inglaterra e França',
          'A bíblia traduzida para o inglês',
        ],
        correctIndex: 1,
        explanation: 'A Magna Carta (1215) foi imposta pelos barões ingleses ao rei João Sem-Terra, limitando os poderes reais e sendo considerada precursora dos direitos modernos.',
      ),
      Question(
        question: 'O que foi o Cisma do Oriente de 1054?',
        options: [
          'A divisão do Império Romano em 395 d.C.',
          'A separação definitiva entre a Igreja Católica Romana e a Igreja Ortodoxa',
          'A reforma protestante de Lutero',
          'A divisão do Império Carolíngio',
        ],
        correctIndex: 1,
        explanation: 'O Cisma do Oriente (1054) foi a ruptura definitiva entre a Igreja Católica Romana (liderada pelo Papa) e a Igreja Ortodoxa (liderada pelo Patriarca de Constantinopla).',
      ),
    ],

    // FASE 10 - Roma Antiga
    [
      Question(
        question: 'Segundo a tradição, em que ano Roma foi fundada?',
        options: ['1000 a.C.', '753 a.C.', '509 a.C.', '264 a.C.'],
        correctIndex: 1,
        explanation: 'Segundo a tradição, Roma foi fundada em 753 a.C. por Rômulo, que teria matado seu irmão Remo durante a demarcação dos limites da cidade.',
      ),
      Question(
        question: 'Quem foi Júlio César e qual seu destino?',
        options: [
          'O primeiro imperador romano, morto em batalha',
          'General e político romano, assassinado pelos senadores em 44 a.C.',
          'O último rei de Roma, exilado',
          'Um general que conquistou a Grécia',
        ],
        correctIndex: 1,
        explanation: 'Júlio César foi assassinado pelos senadores (entre eles Bruto e Cássio) nas Ides de Março (15 de março de 44 a.C.), por temerem que se tornasse tirano.',
      ),
      Question(
        question: 'Qual foi o primeiro imperador de Roma?',
        options: [
          'Júlio César',
          'Marco Antônio',
          'Otávio Augusto',
          'Nero',
        ],
        correctIndex: 2,
        explanation: 'Otávio Augusto (63 a.C.-14 d.C.) foi o primeiro imperador romano, tendo recebido o título de "Augusto" pelo Senado em 27 a.C.',
      ),
      Question(
        question: 'O que foram as Guerras Púnicas?',
        options: [
          'Guerras entre Roma e a Grécia',
          'Conflitos entre Roma e Cartago pelo domínio do Mediterrâneo',
          'Guerras civis entre romanos',
          'Conflitos entre Roma e os Gauleses',
        ],
        correctIndex: 1,
        explanation: 'As Guerras Púnicas (264-146 a.C.) foram três conflitos entre Roma e Cartago (norte da África) pelo domínio do Mediterrâneo ocidental.',
      ),
      Question(
        question: 'Qual general cartaginês cruzou os Alpes com elefantes para atacar Roma?',
        options: ['Amílcar Barca', 'Asdrúbal', 'Aníbal Barca', 'Magão'],
        correctIndex: 2,
        explanation: 'Aníbal Barca (247-183 a.C.) cruzou os Alpes com elefantes de guerra na Segunda Guerra Púnica (218 a.C.), vencendo várias batalhas em solo italiano.',
      ),
      Question(
        question: 'O que foi o Coliseu e para que servia?',
        options: [
          'Um templo dedicado a Júpiter',
          'O maior anfiteatro romano, usado para espetáculos como lutas de gladiadores',
          'O palácio dos imperadores romanos',
          'O centro comercial mais importante de Roma',
        ],
        correctIndex: 1,
        explanation: 'O Coliseu (inaugurado em 80 d.C.) era o maior anfiteatro romano, com capacidade para 50.000 espectadores, usado para lutas de gladiadores e caçadas.',
      ),
      Question(
        question: 'O que foi a Pax Romana?',
        options: [
          'Um tratado de paz entre Roma e seus inimigos',
          'Um período de relativa paz e prosperidade no Império Romano (27 a.C.-180 d.C.)',
          'A paz negociada após as Guerras Púnicas',
          'O período de paz durante a República Romana',
        ],
        correctIndex: 1,
        explanation: 'A Pax Romana foi um período de aproximadamente 200 anos de relativa paz e prosperidade no Império Romano, iniciado com Augusto.',
      ),
      Question(
        question: 'Em que ano o Império Romano do Ocidente caiu, marcando o fim da Antiguidade?',
        options: ['395 d.C.', '410 d.C.', '455 d.C.', '476 d.C.'],
        correctIndex: 3,
        explanation: 'O Império Romano do Ocidente caiu em 476 d.C., quando o chefe bárbaro Odoacro depôs o último imperador Rômulo Augústulo.',
      ),
      Question(
        question: 'Qual foi a principal contribuição romana para o direito e a organização social?',
        options: [
          'A criação da democracia direta',
          'O Direito Romano, base dos sistemas jurídicos ocidentais modernos',
          'O sistema parlamentarista de governo',
          'A abolição da escravidão',
        ],
        correctIndex: 1,
        explanation: 'O Direito Romano, codificado na Lei das XII Tábuas (450 a.C.) e no Código de Justiniano (529 d.C.), é a base dos sistemas jurídicos de grande parte do mundo.',
      ),
      Question(
        question: 'Qual imperador romano tornou o Cristianismo a religião oficial do Império?',
        options: [
          'Constantino I',
          'Teodósio I',
          'Diocleciano',
          'Júlio César',
        ],
        correctIndex: 1,
        explanation: 'Teodósio I tornou o Cristianismo Niceno a religião oficial do Império Romano em 380 d.C., pelo Édito de Tessalônica.',
      ),
    ],
  ];
}
