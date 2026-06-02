import 'package:flutter/material.dart';


class QuizHistoriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de História',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapaScreen(),
    );
  }
}

/// Modelo de pergunta
class Pergunta {
  final String enunciado;
  final List<String> alternativas;
  final int indiceCorreto;

  Pergunta({
    required this.enunciado,
    required this.alternativas,
    required this.indiceCorreto,
  });

  Pergunta embaralharAlternativas() {
    final List<String> novasAlternativas = List<String>.from(alternativas);
    final String respostaCorreta = alternativas[indiceCorreto];

    novasAlternativas.shuffle();
    final int novoIndice = novasAlternativas.indexOf(respostaCorreta);

    return Pergunta(
      enunciado: enunciado,
      alternativas: novasAlternativas,
      indiceCorreto: novoIndice,
    );
  }
}

/// Dados de todas as fases (10 fases x 10 perguntas)
class BancoPerguntas {
  static final List<String> temas = [
    'Primeira Guerra Mundial',
    'Segunda Guerra Mundial',
    'Revolução Francesa',
    'Império Romano',
    'Descobrimentos e Navegações',
    'Revolução Industrial',
    'Guerra Fria',
    'Antiguidade Egípcia',
    'Independências das Américas',
    'Globalização e Mundo Contemporâneo',
  ];

  static final List<List<Pergunta>> fases = [
    // FASE 1 – PRIMEIRA GUERRA MUNDIAL
    [
      Pergunta(
        enunciado: 'Em que ano começou a Primeira Guerra Mundial?',
        alternativas: ['1914', '1912', '1918', '1905'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual evento foi o estopim para o início da Primeira Guerra Mundial?',
        alternativas: [
          'Assassinato do Arquiduque Francisco Ferdinando',
          'Invasão da Polônia',
          'Bombardeio de Pearl Harbor',
          'Queda da Bolsa de Nova York'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Como era chamada a aliança formada por Alemanha, Áustria-Hungria e Itália antes da guerra?',
        alternativas: [
          'Tríplice Aliança',
          'Tríplice Entente',
          'Liga das Nações',
          'Eixo'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual tecnologia de guerra foi usada em larga escala pela primeira vez na Primeira Guerra Mundial?',
        alternativas: [
          'Gás venenoso / guerra química',
          'Bombas atômicas',
          'Mísseis balísticos',
          'Armas a laser'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Em que ano os Estados Unidos entraram na Primeira Guerra?',
        alternativas: ['1917', '1914', '1915', '1919'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual tratado encerrou oficialmente a Primeira Guerra Mundial?',
        alternativas: [
          'Tratado de Versalhes',
          'Tratado de Tordesilhas',
          'Tratado de Paris (1783)',
          'Tratado de Yalta'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Em que cidade foi assinado o Tratado de Versalhes?',
        alternativas: ['Versalhes', 'Paris', 'Londres', 'Berlim'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual país saiu da guerra após a Revolução Bolchevique de 1917?',
        alternativas: ['Rússia', 'Itália', 'França', 'Turquia'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Que expressão ficou famosa por acreditarem que a Primeira Guerra seria rápida?',
        alternativas: [
          'A guerra que acabaria com todas as guerras',
          'Guerra Fria',
          'Blitzkrieg',
          'Guerra Relâmpago'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quais eram os países da Tríplice Entente?',
        alternativas: [
          'França, Reino Unido e Rússia',
          'Alemanha, Áustria-Hungria e Itália',
          'EUA, França e Japão',
          'Itália, Rússia e Turquia'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 2 – SEGUNDA GUERRA MUNDIAL
    [
      Pergunta(
        enunciado: 'Em que ano começou a Segunda Guerra Mundial?',
        alternativas: ['1939', '1941', '1918', '1929'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual evento marcou a entrada dos EUA na Segunda Guerra Mundial?',
        alternativas: [
          'Ataque a Pearl Harbor',
          'Invasão da Polônia',
          'Dia D',
          'Batalha de Stalingrado'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem era o líder da Alemanha Nazista durante a Segunda Guerra?',
        alternativas: [
          'Adolf Hitler',
          'Benito Mussolini',
          'Joseph Stalin',
          'Franklin D. Roosevelt'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o Dia D, em 1944?',
        alternativas: [
          'O desembarque aliado na Normandia',
          'O ataque a Pearl Harbor',
          'A assinatura do Tratado de Versalhes',
          'O fim da Primeira Guerra'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi o nome do plano alemão de invasão à União Soviética?',
        alternativas: [
          'Operação Barbarossa',
          'Operação Overlord',
          'Plano Marshall',
          'Operação Husky'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em quais cidades japonesas foram lançadas as bombas atômicas?',
        alternativas: [
          'Hiroshima e Nagasaki',
          'Tóquio e Osaka',
          'Kyoto e Hiroshima',
          'Nagasaki e Yokohama'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual organização internacional foi criada após a Segunda Guerra Mundial?',
        alternativas: [
          'ONU (Organização das Nações Unidas)',
          'Liga das Nações',
          'OTAN',
          'União Europeia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Em que ano terminou a Segunda Guerra Mundial?',
        alternativas: ['1945', '1940', '1950', '1939'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o Holocausto?',
        alternativas: [
          'O genocídio de judeus e outros grupos pelos nazistas',
          'A invasão da França pela Alemanha',
          'A explosão das bombas atômicas',
          'O julgamento de Nuremberg'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem foi Winston Churchill?',
        alternativas: [
          'Primeiro-ministro britânico durante a guerra',
          'Líder soviético',
          'Presidente dos EUA',
          'Imperador japonês'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 3 – REVOLUÇÃO FRANCESA
    [
      Pergunta(
        enunciado: 'Em que ano começou a Revolução Francesa?',
        alternativas: ['1789', '1776', '1804', '1815'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual prisão foi tomada pelos revolucionários em 14 de julho de 1789?',
        alternativas: ['Bastilha', 'Versalhes', 'Conciergerie', 'Louvre'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quais eram os três estados da sociedade francesa antes da Revolução?',
        alternativas: [
          'Clero, Nobreza e Terceiro Estado',
          'Burguesia, Camponeses e Escravos',
          'Reis, Nobres e Servos',
          'Sacerdotes, Guerreiros e Trabalhadores'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Qual foi o lema da Revolução Francesa?',
        alternativas: [
          'Liberdade, Igualdade e Fraternidade',
          'Ordem e Progresso',
          'Pátria, Trabalho e Família',
          'Pão, Paz e Terra'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual rei francês foi guilhotinado durante a Revolução Francesa?',
        alternativas: ['Luís XVI', 'Luís XIV', 'Carlos X', 'Napoleão III'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'O que foi a Declaração dos Direitos do Homem e do Cidadão?',
        alternativas: [
          'Documento que garantia direitos universais inspirados no Iluminismo',
          'Tratado de paz com a Inglaterra',
          'Constituição do Império Napoleônico',
          'Abolição da escravidão na França'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem foi o principal líder do período conhecido como "O Terror"?',
        alternativas: [
          'Robespierre',
          'Napoleão Bonaparte',
          'Danton',
          'Marat'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual fase da Revolução Francesa abriu caminho para a ascensão de Napoleão?',
        alternativas: [
          'Diretório e Golpe do 18 Brumário',
          'Monarquia Constitucional',
          'Assembleia Nacional Constituinte',
          'Restauração Bourbon'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi uma das principais causas populares da Revolução Francesa?',
        alternativas: [
          'Crise econômica, fome e desigualdade social',
          'Vitória sobre a Inglaterra',
          'Abundância de alimentos',
          'Expansão colonial'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual documento americano influenciou os ideais da Revolução Francesa?',
        alternativas: [
          'Declaração de Independência dos EUA',
          'Constituição Mexicana',
          'Carta Magna inglesa',
          'Tratado de Versalhes'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 4 – IMPÉRIO ROMANO
    [
      Pergunta(
        enunciado: 'Segundo a tradição, em que ano Roma foi fundada?',
        alternativas: ['753 a.C.', '27 a.C.', '476 d.C.', '509 a.C.'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem foi o primeiro imperador romano?',
        alternativas: [
          'Augusto (Otávio Augusto)',
          'Júlio César',
          'Nero',
          'Constantino'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que era o Senado Romano?',
        alternativas: [
          'Órgão político consultivo composto por aristocratas',
          'Assembleia de escravos',
          'Conselho de generais bárbaros',
          'Tribunal religioso'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual general romano cruzou o rio Rubicão desafiando o Senado?',
        alternativas: [
          'Júlio César',
          'Marco Aurélio',
          'Cícero',
          'Bruto'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Como se chamava o longo período de paz e prosperidade no Império Romano?',
        alternativas: [
          'Pax Romana',
          'Belle Époque',
          'Paz Armada',
          'Idade de Ouro Grega'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que ano caiu o Império Romano do Ocidente, tradicionalmente?',
        alternativas: ['476 d.C.', '1453', '27 a.C.', '732 d.C.'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Qual era o idioma oficial do Império Romano?',
        alternativas: ['Latim', 'Grego', 'Hebraico', 'Árabe'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foram as Guerras Púnicas?',
        alternativas: [
          'Conflitos entre Roma e Cartago',
          'Guerras civis entre patrícios e plebeus',
          'Guerras contra os vikings',
          'Conflitos com a Pérsia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem foi Espártaco?',
        alternativas: [
          'Líder de uma grande revolta de escravos contra Roma',
          'Imperador que dividiu o império',
          'Filósofo estoico',
          'Senador responsável pela Pax Romana'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual imperador romano é associado à legalização do Cristianismo?',
        alternativas: [
          'Constantino',
          'Nero',
          'Augusto',
          'Calígula'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 5 – DESCOBRIMENTOS E NAVEGAÇÕES
    [
      Pergunta(
        enunciado: 'Quem chegou ao Brasil em 1500?',
        alternativas: [
          'Pedro Álvares Cabral',
          'Cristóvão Colombo',
          'Vasco da Gama',
          'Fernão de Magalhães'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem foi o primeiro europeu a liderar uma viagem de circum-navegação do globo?',
        alternativas: [
          'Fernão de Magalhães (completada por Elcano)',
          'Pedro Álvares Cabral',
          'Bartolomeu Dias',
          'James Cook'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual rota marítima foi descoberta por Vasco da Gama no fim do século XV?',
        alternativas: [
          'Caminho marítimo para as Índias contornando a África',
          'Passagem Noroeste para o Ártico',
          'Rota pelo Pacífico até a América',
          'Travessia do Atlântico Norte até a Groenlândia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Que instrumento de navegação ajudava a medir a posição pelo Sol e pelas estrelas?',
        alternativas: [
          'Astrolábio',
          'Bússola digital',
          'Radar',
          'Telescópio de Galileu'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual país europeu liderou as Grandes Navegações no início do século XV?',
        alternativas: ['Portugal', 'Espanha', 'França', 'Holanda'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem patrocinou a viagem de Cristóvão Colombo em 1492?',
        alternativas: [
          'Reis Católicos da Espanha (Fernando e Isabel)',
          'Rei de Portugal',
          'Papa Alexandre VI',
          'Rei da Inglaterra'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o Tratado de Tordesilhas (1494)?',
        alternativas: [
          'Acordo que dividiu o mundo entre Portugal e Espanha',
          'Tratado de paz entre França e Inglaterra',
          'Acordo que aboliu a escravidão',
          'Pacto de não agressão entre Portugal e Holanda'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que ano Cristóvão Colombo chegou à América pelo Atlântico?',
        alternativas: ['1492', '1500', '1453', '1519'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi o papel do Infante Dom Henrique nas navegações portuguesas?',
        alternativas: [
          'Incentivou e organizou expedições, criando um centro de estudos náuticos',
          'Liderou a invasão da Inglaterra',
          'Foi o primeiro a chegar ao Brasil',
          'Criou a bússola magnética'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quais especiarias eram muito valorizadas pelos europeus nas rotas comerciais?',
        alternativas: [
          'Pimenta, cravo, noz-moscada e canela',
          'Café e cacau',
          'Algodão e tabaco',
          'Milho e batata'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 6 – REVOLUÇÃO INDUSTRIAL
    [
      Pergunta(
        enunciado: 'Em qual país começou a Revolução Industrial?',
        alternativas: [
          'Inglaterra (Reino Unido)',
          'França',
          'Alemanha',
          'Estados Unidos'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual invenção foi fundamental para impulsionar a Revolução Industrial?',
        alternativas: [
          'Máquina a vapor',
          'Motor a jato',
          'Telefone',
          'Imprensa de Gutenberg'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem aperfeiçoou a máquina a vapor no século XVIII?',
        alternativas: [
          'James Watt',
          'Henry Ford',
          'Thomas Edison',
          'Nikola Tesla'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o ludismo?',
        alternativas: [
          'Movimento de trabalhadores que destruíam máquinas por medo do desemprego',
          'Movimento pela jornada de 8 horas',
          'Partido político liberal',
          'Sindicato patronal'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Que tipo de sistema de trabalho passou a predominar com a Revolução Industrial?',
        alternativas: [
          'Trabalho assalariado em fábricas',
          'Escravidão rural',
          'Servidão feudal',
          'Cooperativas artesanais'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual filósofo criticou o capitalismo industrial na obra "O Capital"?',
        alternativas: [
          'Karl Marx',
          'Adam Smith',
          'John Locke',
          'Jean-Jacques Rousseau'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'O que foi a urbanização acelerada causada pela Revolução Industrial?',
        alternativas: [
          'Migração em massa do campo para as cidades industriais',
          'Retorno das pessoas ao campo',
          'Expansão das aldeias indígenas',
          'Criação de cidades medievais muradas'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi um dos principais impactos ambientais da Revolução Industrial?',
        alternativas: [
          'Aumento da poluição do ar e da água',
          'Redução do efeito estufa',
          'Fim do desmatamento',
          'Recuperação total de florestas'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que século ocorreu a chamada Segunda Revolução Industrial?',
        alternativas: ['Século XIX', 'Século XVI', 'Século XXI', 'Século XIII'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Que novo meio de transporte terrestre se desenvolveu com força nesse período?',
        alternativas: [
          'Ferrovia / trem a vapor',
          'Carro voador',
          'Bicicleta elétrica',
          'Dirigível supersônico'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 7 – GUERRA FRIA
    [
      Pergunta(
        enunciado:
            'Entre quais duas superpotências ocorreu a Guerra Fria após a Segunda Guerra Mundial?',
        alternativas: [
          'Estados Unidos e União Soviética',
          'Alemanha e Japão',
          'França e Inglaterra',
          'China e Índia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi a Corrida Espacial?',
        alternativas: [
          'Disputa tecnológica entre EUA e URSS para dominar o espaço',
          'Competição esportiva entre países europeus',
          'Prova olímpica de maratona',
          'Conflito armado na Lua'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi o primeiro satélite artificial lançado ao espaço, em 1957?',
        alternativas: [
          'Sputnik',
          'Apollo 11',
          'Voyager 1',
          'Hubble'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que representava o Muro de Berlim?',
        alternativas: [
          'A divisão entre o bloco capitalista e o bloco socialista',
          'A fronteira entre França e Espanha',
          'A barreira contra invasões vikings',
          'O limite do Império Romano'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Em que ano o Muro de Berlim caiu?',
        alternativas: ['1989', '1945', '1961', '2001'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi a Crise dos Mísseis de Cuba, em 1962?',
        alternativas: [
          'Confronto diplomático sobre mísseis soviéticos instalados em Cuba',
          'Guerra civil entre Cuba e México',
          'Invasão de Cuba pelo Japão',
          'Acidente nuclear em Cuba'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quais foram os nomes das políticas de reforma implementadas por Mikhail Gorbachev na URSS?',
        alternativas: [
          'Glasnost e Perestroika',
          'New Deal',
          'Plano Marshall',
          'Guerra Relâmpago'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que é a OTAN?',
        alternativas: [
          'Aliança militar de países ocidentais liderada pelos EUA',
          'Organização de comércio africano',
          'União política sul-americana',
          'Agência espacial europeia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que ano a União Soviética foi oficialmente dissolvida, encerrando a Guerra Fria?',
        alternativas: ['1991', '1980', '2000', '1975'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o Plano Marshall?',
        alternativas: [
          'Programa americano de reconstrução econômica da Europa',
          'Plano de invasão do Japão',
          'Projeto de bomba atômica alemã',
          'Acordo de paz entre EUA e URSS'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 8 – ANTIGUIDADE EGÍPCIA
    [
      Pergunta(
        enunciado:
            'Qual rio foi fundamental para o desenvolvimento da civilização egípcia?',
        alternativas: ['Rio Nilo', 'Rio Tigre', 'Rio Eufrates', 'Rio Jordão'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Como eram chamados os governantes do Antigo Egito?',
        alternativas: ['Faraós', 'Czares', 'Césares', 'Xás'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Para que serviam as grandes pirâmides egípcias?',
        alternativas: [
          'Tumbas para faraós e locais de rituais funerários',
          'Templos gregos para deuses',
          'Fortalezas militares',
          'Mercados de escravos'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual sistema de escrita foi desenvolvido pelos antigos egípcios?',
        alternativas: [
          'Hieróglifos',
          'Cuneiforme',
          'Alfabeto cirílico',
          'Kanji'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi a Pedra de Roseta?',
        alternativas: [
          'Artefato que permitiu decifrar os hieróglifos',
          'Primeira pirâmide construída',
          'Cidade egípcia submersa',
          'Livro sagrado dos egípcios'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual rainha egípcia se aliou a Júlio César e Marco Antônio?',
        alternativas: ['Cleópatra', 'Nefertiti', 'Hatshepsut', 'Isis'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'O que os egípcios acreditavam sobre a vida após a morte?',
        alternativas: [
          'Na imortalidade da alma e no julgamento de Osíris',
          'Que nada existia depois da morte',
          'Na reencarnação em animais apenas',
          'Que apenas os escravos tinham vida eterna'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que era o processo de mumificação?',
        alternativas: [
          'Técnica de preservar corpos para a vida após a morte',
          'Método de construir pirâmides',
          'Forma de escrever em pedra',
          'Nome de festivais religiosos'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem foi Ramsés II?',
        alternativas: [
          'Um dos mais importantes faraós, conhecido por batalhas e construções',
          'Um deus egípcio do sol',
          'Sacerdote que proibiu pirâmides',
          'Rei da Mesopotâmia'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quando o Egito Antigo foi incorporado ao Império Romano?',
        alternativas: ['30 a.C.', '476 d.C.', '753 a.C.', '1453 d.C.'],
        indiceCorreto: 0,
      ),
    ],

    // FASE 9 – INDEPENDÊNCIAS DAS AMÉRICAS
    [
      Pergunta(
        enunciado: 'Em que ano o Brasil declarou sua independência?',
        alternativas: ['1822', '1500', '1888', '1808'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Quem proclamou a independência do Brasil?',
        alternativas: [
          'Dom Pedro I',
          'Dom João VI',
          'Tiradentes',
          'José Bonifácio'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que data é comemorada a Independência do Brasil?',
        alternativas: [
          '7 de setembro',
          '21 de abril',
          '15 de novembro',
          '1º de janeiro'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi o primeiro país das Américas a declarar independência?',
        alternativas: [
          'Estados Unidos',
          'Brasil',
          'México',
          'Argentina'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem liderou a independência de vários países da América do Sul, como Venezuela e Colômbia?',
        alternativas: [
          'Simón Bolívar',
          'José de San Martín',
          'Dom Pedro II',
          'Pancho Villa'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi o "Grito do Ipiranga"?',
        alternativas: [
          'Momento em que Dom Pedro I declarou a independência do Brasil às margens do rio Ipiranga',
          'Primeiro discurso de Dom Pedro II',
          'Ataque português a São Paulo',
          'Revolta de escravos no interior de São Paulo'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Qual país europeu colonizou o Brasil?',
        alternativas: ['Portugal', 'Espanha', 'França', 'Inglaterra'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Quem foi José de San Martín na história das independências?',
        alternativas: [
          'Líder da independência da Argentina, Chile e Peru',
          'Imperador do México',
          'Presidente dos EUA',
          'Rei de Portugal'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Em que ano o Haiti se tornou independente, tornando-se a primeira república negra do mundo?',
        alternativas: ['1804', '1776', '1822', '1889'],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual foi um impacto da vinda da Família Real portuguesa ao Brasil para a independência?',
        alternativas: [
          'Elevou o Brasil a Reino Unido, criando condições para a independência',
          'Enfraqueceu totalmente a economia brasileira',
          'Acabou com o comércio no Brasil',
          'Impediu o surgimento de qualquer movimento separatista'
        ],
        indiceCorreto: 0,
      ),
    ],

    // FASE 10 – GLOBALIZAÇÃO E MUNDO CONTEMPORÂNEO
    [
      Pergunta(
        enunciado: 'O que é globalização?',
        alternativas: [
          'Processo de integração econômica, cultural e política entre países',
          'Isolamento total das nações',
          'Domínio de um único império mundial',
          'Retorno ao feudalismo'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual evento marcou de forma trágica o início do século XXI?',
        alternativas: [
          'Ataques de 11 de setembro de 2001 nos EUA',
          'Queda do Muro de Berlim',
          'Crise de 1929',
          'Primeira Guerra Mundial'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi a Primavera Árabe?',
        alternativas: [
          'Série de revoltas populares em países árabes a partir de 2010',
          'Conferência ambiental da ONU',
          'Programa de reformas na Europa',
          'Acordo de paz no Oriente Médio em 1948'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual organização internacional é responsável por regular o comércio entre os países?',
        alternativas: [
          'OMC (Organização Mundial do Comércio)',
          'OTAN',
          'ONU',
          'OPEP'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que é a União Europeia (UE)?',
        alternativas: [
          'Bloco político e econômico de países europeus',
          'Um único país europeu',
          'Aliança militar africana',
          'Organização esportiva'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'Qual foi o impacto da internet na globalização?',
        alternativas: [
          'Acelerou a comunicação, o comércio e a troca de informações em escala global',
          'Eliminou totalmente as diferenças culturais',
          'Acabou com o comércio internacional',
          'Impediu a circulação de ideias'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que foi a crise financeira global de 2008?',
        alternativas: [
          'Crise originada no mercado imobiliário dos EUA que afetou economias do mundo todo',
          'Colapso da bolsa em 1929',
          'Quebra do padrão-ouro no século XIX',
          'Falência de todos os bancos chineses'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado: 'O que são os BRICS?',
        alternativas: [
          'Grupo de países emergentes: Brasil, Rússia, Índia, China e África do Sul',
          'União de países europeus',
          'Aliança militar asiática',
          'Organização de países árabes'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'Qual é considerado um dos principais desafios ambientais do mundo contemporâneo?',
        alternativas: [
          'Aquecimento global e mudanças climáticas',
          'Extinção completa dos vulcões',
          'Aumento das geleiras',
          'Fim da poluição'
        ],
        indiceCorreto: 0,
      ),
      Pergunta(
        enunciado:
            'O que foi a pandemia de COVID-19 que começou em 2019?',
        alternativas: [
          'Pandemia causada pelo vírus SARS-CoV-2, com grande impacto social e econômico',
          'Gripe espanhola do início do século XX',
          'Surto de peste bubônica medieval',
          'Doença localizada apenas em um país'
        ],
        indiceCorreto: 0,
      ),
    ],
  ];
}

/// Status de cada fase
enum StatusFase { bloqueada, disponivel, concluida }

/// Tela do mapa de fases
class MapaScreen extends StatefulWidget {
  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  // Fase 0 desbloqueada inicialmente
  List<StatusFase> statusFases = List.generate(
    10,
    (index) => index == 0 ? StatusFase.disponivel : StatusFase.bloqueada,
  );

  void _atualizarStatusFase(int faseIndex, bool passou) {
    setState(() {
      if (passou) {
        statusFases[faseIndex] = StatusFase.concluida;
        if (faseIndex + 1 < statusFases.length &&
            statusFases[faseIndex + 1] == StatusFase.bloqueada) {
          statusFases[faseIndex + 1] = StatusFase.disponivel;
        }
      }
    });
  }

  Color _corPorStatus(StatusFase status) {
    switch (status) {
      case StatusFase.bloqueada:
        return Colors.grey;
      case StatusFase.disponivel:
        return Colors.indigoAccent;
      case StatusFase.concluida:
        return Colors.green;
    }
  }

  IconData _iconePorStatus(StatusFase status) {
    switch (status) {
      case StatusFase.bloqueada:
        return Icons.lock;
      case StatusFase.disponivel:
        return Icons.play_arrow;
      case StatusFase.concluida:
        return Icons.check;
    }
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Fases - História'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: largura * 0.9,
            height: altura * 0.85,
            child: Stack(
              children: [
                // Linhas conectando as fases
                CustomPaint(
                  size: Size.infinite,
                  painter: _ConexoesFasesPainter(),
                ),
                // Fases em zigue-zague
                ...List.generate(10, (index) {
                  final linha = index; // 0 a 9
                  final y = (linha + 1) * (altura * 0.07);
                  final bool ladoEsquerdo = linha % 2 == 0;
                  final double x = ladoEsquerdo
                      ? largura * 0.15
                      : largura * 0.6; // zigue-zague

                  return Positioned(
                    left: x,
                    top: y,
                    child: _buildFaseNode(index),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFaseNode(int index) {
    final status = statusFases[index];
    final tema = BancoPerguntas.temas[index];

    return Column(
      children: [
        GestureDetector(
          onTap: status == StatusFase.bloqueada
              ? null
              : () async {
                  final resultado = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        indiceFase: index,
                        tema: tema,
                        perguntas: BancoPerguntas.fases[index],
                      ),
                    ),
                  );

                  if (resultado != null) {
                    _atualizarStatusFase(index, resultado);
                  }
                },
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _corPorStatus(status),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    _iconePorStatus(status),
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 120,
          child: Text(
            tema,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Desenha as linhas de conexão entre as fases em zigue-zague
class _ConexoesFasesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white38
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 9; i++) {
      final linha = i;
      final proxLinha = i + 1;
      final bool ladoEsquerdo = linha % 2 == 0;
      final bool proxLadoEsquerdo = proxLinha % 2 == 0;

      final double y = (linha + 1) * (size.height * 0.07);
      final double y2 = (proxLinha + 1) * (size.height * 0.07);

      final double x = ladoEsquerdo ? size.width * 0.15 : size.width * 0.6;
      final double x2 =
          proxLadoEsquerdo ? size.width * 0.15 : size.width * 0.6;

      canvas.drawLine(Offset(x + 32, y + 32), Offset(x2 + 32, y2 + 32), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Tela do quiz de uma fase específica
class QuizScreen extends StatefulWidget {
  final int indiceFase;
  final String tema;
  final List<Pergunta> perguntas;

  const QuizScreen({
    Key? key,
    required this.indiceFase,
    required this.tema,
    required this.perguntas,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late List<Pergunta> _perguntasEmbaralhadas;
  int _indiceAtual = 0;
  int _acertos = 0;
  int? _indiceSelecionado;
  bool _respondeu = false;
  late AnimationController _animController;
  late Animation<double> _animScale;

  @override
  void initState() {
    super.initState();
    _perguntasEmbaralhadas = widget.perguntas
        .map((p) => p.embaralharAlternativas())
        .toList(growable: false);

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _animScale = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selecionarResposta(int indice) async {
    if (_respondeu) return;

    setState(() {
      _indiceSelecionado = indice;
      _respondeu = true;
      if (indice ==
          _perguntasEmbaralhadas[_indiceAtual].indiceCorreto) {
        _acertos++;
      }
    });

    // Pequena animação (efeito de clique)
    _animController.forward(from: 0.95);
  }

  void _proximaPergunta() {
    if (_indiceAtual < _perguntasEmbaralhadas.length - 1) {
      setState(() {
        _indiceAtual++;
        _indiceSelecionado = null;
        _respondeu = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultadoScreen(
            indiceFase: widget.indiceFase,
            tema: widget.tema,
            acertos: _acertos,
            total: _perguntasEmbaralhadas.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = _perguntasEmbaralhadas[_indiceAtual];
    final progresso =
        (_indiceAtual + 1) / _perguntasEmbaralhadas.length.toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('Fase ${widget.indiceFase + 1} - ${widget.tema}'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Barra de progresso
            LinearProgressIndicator(
              value: progresso,
              backgroundColor: Colors.white24,
              color: Colors.greenAccent,
              minHeight: 10,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pergunta ${_indiceAtual + 1}/${_perguntasEmbaralhadas.length}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Acertos: $_acertos',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Enunciado
            Card(
              color: Colors.white.withOpacity(0.95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  pergunta.enunciado,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Alternativas
            Expanded(
              child: ListView.builder(
                itemCount: pergunta.alternativas.length,
                itemBuilder: (context, index) {
                  final alternativa = pergunta.alternativas[index];

                  Color corFundo = Colors.white.withOpacity(0.9);
                  Color corTexto = Colors.black87;

                  if (_respondeu) {
                    if (index == pergunta.indiceCorreto) {
                      corFundo = Colors.green.shade400;
                      corTexto = Colors.white;
                    } else if (_indiceSelecionado == index &&
                        index != pergunta.indiceCorreto) {
                      corFundo = Colors.red.shade400;
                      corTexto = Colors.white;
                    }
                  }

                  return ScaleTransition(
                    scale: _animScale,
                    child: GestureDetector(
                      onTap: () => _selecionarResposta(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: corFundo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.indigo,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                alternativa,
                                style: TextStyle(
                                  color: corTexto,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Botão Próxima
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _respondeu ? _proximaPergunta : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _indiceAtual < _perguntasEmbaralhadas.length - 1
                      ? 'Próxima Pergunta'
                      : 'Ver Resultado',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tela de resultado da fase
class ResultadoScreen extends StatelessWidget {
  final int indiceFase;
  final String tema;
  final int acertos;
  final int total;

  const ResultadoScreen({
    Key? key,
    required this.indiceFase,
    required this.tema,
    required this.acertos,
    required this.total,
  }) : super(key: key);

  String _mensagem() {
    final porcentagem = acertos / total;
    if (porcentagem >= 0.8) {
      return 'Excelente! Você domina muito esse tema.';
    } else if (porcentagem >= 0.6) {
      return 'Muito bom! Você passou de fase, mas pode melhorar ainda mais.';
    } else if (porcentagem >= 0.4) {
      return 'Você acertou algumas, mas ainda não é o suficiente para passar.';
    } else {
      return 'Foi difícil desta vez. Tente novamente para melhorar sua pontuação!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool passou = acertos >= 6;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado da Fase'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              'Fase ${indiceFase + 1} - $tema',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Card(
              color: Colors.white.withOpacity(0.95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      '$acertos / $total acertos',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: passou ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _mensagem(),
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      passou
                          ? 'Você desbloqueia a próxima fase!'
                          : 'Você precisa de pelo menos 6 acertos para avançar.',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            if (passou)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // volta para o mapa, informando que passou
                    Navigator.pop<bool>(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade400,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Voltar ao mapa (próxima fase liberada)',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Recomeça a fase: volta para o mapa e deixa status como estava;
                    // o próprio mapa deixa a fase atual disponível.
                    Navigator.pop<bool>(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Tentar novamente a fase',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.pop<bool>(context, passou);
              },
              child: const Text(
                'Voltar ao mapa',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}