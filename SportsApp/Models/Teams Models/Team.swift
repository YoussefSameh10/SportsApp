//
//  TeamModel.swift
//  SportsApp
//
//  Created by Youssef on 1/30/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

class Team: Decodable{
    var id: String!
    var name: String!
    var shortName: String!
    var establishmentYear: String!
    var stadium: String!
    var nickname: String!
    var stadiumImage: String!
    var teamBadge: String!
    var teamJersey: String!
    
    enum CodingKeys: String, CodingKey{
        case id = "idTeam"
        case name = "strTeam"
        case shortName = "strTeamShort"
        case establishmentYear = "intFormedYear"
        case stadium = "strStadium"
        case nickname = "strKeywords"
        case stadiumImage = "strStadiumThumb"
        case teamBadge = "strTeamBadge"
        case teamJersey = "strTeamJersey"
        
    }
}


/*
 "idTeam": "133604",
     "idSoccerXML": "9",
     "idAPIfootball": "42",
     "intLoved": "4",
     "strTeam": "Arsenal",
     "strTeamShort": "ARS",
     "strAlternate": "Arsenal Football Club, AFC, Arsenal FC",
     "intFormedYear": "1892",
     "strSport": "Soccer",
     "strLeague": "English Premier League",
     "idLeague": "4328",
     "strLeague2": "FA Cup",
     "idLeague2": "4482",
     "strLeague3": "EFL Cup",
     "idLeague3": "4570",
     "strLeague4": "",
     "idLeague4": null,
     "strLeague5": "",
     "idLeague5": null,
     "strLeague6": "",
     "idLeague6": null,
     "strLeague7": "",
     "idLeague7": null,
     "strDivision": null,
     "strManager": "",
     "strStadium": "Emirates Stadium",
     "strKeywords": "Gunners, Gooners",
     "strRSS": "https://www.allarsenal.com/feed/",
     "strStadiumThumb": "https://www.thesportsdb.com/images/media/team/stadium/w1anwa1588432105.jpg",
     "strStadiumDescription": "The Emirates Stadium (known as Ashburton Grove prior to sponsorship, and as Arsenal Stadium for UEFA competitions) is a football stadium in Holloway, London, England, and the home of Arsenal. With a capacity of 60,704 it is the fourth-largest football stadium in England after Wembley Stadium, Old Trafford and Tottenham Hotspur Stadium.\r\n\r\nIn 1997, Arsenal explored the possibility of relocating to a new stadium, having been denied planning permission by Islington Council to expand its home stadium, Highbury. After considering various options (including purchasing Wembley Stadium), the club bought an industrial and waste disposal estate in Ashburton Grove in 2000. A year later, they received the council's approval to build a stadium on the site; manager Arsène Wenger described this as the \"biggest decision in Arsenal's history\" since the board appointed Herbert Chapman. Relocation began in 2002, but financial difficulties delayed work until February 2004. Emirates was later announced as the main sponsor for the stadium. The entire stadium project was completed in 2006 at a cost of £390 million. The club's former stadium was redeveloped as Highbury Square, an apartment complex.\r\n\r\nThe stadium has undergone a process of \"Arsenalisation\" since 2009 with the aim of restoring Arsenal's heritage and history. The stadium has hosted international fixtures and music concerts.",
     "strStadiumLocation": "Holloway, London, England",
     "intStadiumCapacity": "60338",
     "strWebsite": "www.arsenal.com",
     "strFacebook": "www.facebook.com/Arsenal",
     "strTwitter": "twitter.com/arsenal",
     "strInstagram": "instagram.com/arsenal",
     "strDescriptionEN": "Arsenal Football Club is a professional football club based in Islington, London, England, that plays in the Premier League, the top flight of English football. The club has won 13 League titles, a record 13 FA Cups, 2 League Cups, 15 FA Community Shields, 1 League Centenary Trophy, 1 UEFA Cup Winners' Cup and 1 Inter-Cities Fairs Cup.\r\n\r\nArsenal was the first club from the South of England to join The Football League, in 1893, and they reached the First Division in 1904. Relegated only once, in 1913, they continue the longest streak in the top division, and have won the second-most top-flight matches in English football history. In the 1930s, Arsenal won five League Championships and two FA Cups, and another FA Cup and two Championships after the war. In 1970–71, they won their first League and FA Cup Double. Between 1989 and 2005, they won five League titles and five FA Cups, including two more Doubles. They completed the 20th century with the highest average league position.\r\n\r\nHerbert Chapman won Arsenal's first national trophies, but died prematurely. He helped introduce the WM formation, floodlights, and shirt numbers, and added the white sleeves and brighter red to the club's kit. Arsène Wenger was the longest-serving manager and won the most trophies. He won a record 7 FA Cups, and his title-winning team set an English record for the longest top-flight unbeaten league run at 49 games between 2003 and 2004, receiving the nickname The Invincibles.\r\n\r\nIn 1886, Woolwich munitions workers founded the club as Dial Square. In 1913, the club crossed the city to Arsenal Stadium in Highbury, becoming close neighbours of Tottenham Hotspur, and creating the North London derby. In 2006, they moved to the nearby Emirates Stadium. In terms of revenue, Arsenal is the ninth highest-earning football club in the world, earned €487.6m in 2016–17 season. Based on social media activity from 2014 to 2015, Arsenal's fanbase is the fifth largest in the world. In 2018, Forbes estimated the club was the third most valuable in England, with the club being worth $2.24 billion.",
     "strDescriptionDE": "Der FC Arsenal (offiziell: Arsenal Football Club) – auch bekannt als (The) Arsenal, (The) Gunners (deutsche Übersetzung: „Schützen“ oder „Kanoniere“) oder im deutschen Sprachraum auch Arsenal London genannt – ist ein 1886 gegründeter Fußballverein aus dem Ortsteil Holloway des Nordlondoner Bezirks Islington. Mit 13 englischen Meisterschaften und elf FA-Pokalsiegen zählt der Klub zu den erfolgreichsten englischen Fußballvereinen.Erst über 40 Jahre nach der Gründung gewann Arsenal mit fünf Ligatiteln und zwei FA Cups in den 1930er Jahren seine ersten bedeutenden Titel. Der nächste Meilenstein war in der Saison 1970/71 der Gewinn des zweiten englischen „Doubles“ im 20. Jahrhundert. In den vergangenen 20 Jahren etablierte sich Arsenal endgültig als einer der erfolgreichsten englischen Fußballvereine, und beim Gewinn zweier weiterer Doubles zu Beginn des 21. Jahrhunderts blieb die Mannschaft in der Ligasaison 2003/04 als zweite in der englischen Fußballgeschichte ungeschlagen. Zunehmende europäische Ambitionen unterstrich der Verein in der Spielzeit 2005/06, als Arsenal als erster Londoner Verein das Finale der Champions League erreichte.",
     "strDescriptionFR": "Arsenal Football Club est un club de football anglais fondé le 1er décembre 1886 à Londres. Son siège est situé dans le borough londonien d'Islington.\r\n\r\nArsenal participe au championnat d'Angleterre de football depuis 1919 dont il a remporté treize éditions, ce qui en fait le troisième club le plus titré d'Angleterre, ainsi que treize coupes d'Angleterre ce qui constitue un record (devant Manchester United, qui en a remporté 12). Sur le plan continental, les Gunners (en français : « les canonniers ») comptent à leur palmarès une Coupe d'Europe des vainqueurs de coupe obtenue en 1994. Deux fois finalistes de cette coupe des vainqueurs de coupe en 1980 et 1995, ils ont également atteint les finales de la coupe de l'UEFA en 2000, de la Ligue des champions en 2006 et de l'Europa League en 2019.\r\n\r\nRésident dès 1913 du stade de Highbury, situé dans un quartier du nord de Londres, le club s’est installé en 2006 dans une nouvelle enceinte de 60 355 places : l'Emirates Stadium, situé à Ashburton Grove. Arsenal nourrit une certaine rivalité avec les nombreux autres clubs de la capitale, mais celle l'opposant à Tottenham Hotspur, avec qui il dispute chaque année le « North London derby » est particulièrement ancienne et profonde.\r\n\r\nLe club est dirigé par Chips Keswick (en) qui succède pour raisons de santé en juin 2013 à Peter Hill-Wood, fils et petit-fils des anciens présidents Denis et Samuel Hill-Wood. Il remplace son père à la mort de ce dernier, en 1982, après vingt ans de responsabilités. Son entraîneur depuis le 29 novembre 2019 est le Suédois Fredrik Ljungberg, ancien joueur du club, après le limogeage de l’Espagnol Unai Emery. Cependant le 20 décembre 2019, l'Espagnol Mikel Arteta, lui aussi ancien joueur du club, est nommé entraîneur. Il était avant sa nomination l'assistant de Pep Guardiola à Manchester City",
     "strDescriptionCN": null,
     "strDescriptionIT": "L'Arsenal Football Club, noto semplicemente come Arsenal, è una società calcistica inglese con sede a Londra, più precisamente nel quartiere di Holloway, nel borgo di Islington.[3]\r\n\r\nFondato nel 1886, è uno dei quattordici club che rappresentano la città di Londra a livello professionistico,[4] nonché uno dei più antichi del Paese. Milita nella massima serie del calcio inglese ininterrottamente dal 1919-1920, risultando quindi la squadra da più tempo presente in First Division/Premier League. È la prima squadra della capitale del Regno Unito per successi sportivi e, in ambito federale, la terza dopo Manchester United e Liverpool, essendosi aggiudicata nel corso della sua storia tredici campionati inglesi, dodici FA Cup (record di vittorie, condiviso con il Manchester United), due League Cup e quattordici Community Shield (una condivisa),[5] mentre in ambito internazionale ha conquistato una Coppa delle Coppe ed una Coppa delle Fiere. Inoltre è una delle tredici squadre che hanno raggiunto le finali di tutte le tre principali competizioni gestite dalla UEFA: Champions League (2005-2006), Coppa UEFA (1999-2000) e Coppa delle Coppe (1979-1980, 1993-1994 e 1994-1995).[6]\r\n\r\nI colori sociali, rosso per la maglietta e bianco per i pantaloncini, hanno subìto variazioni più o meno evidenti nel corso degli anni. Anche la sede del club è stata cambiata più volte: inizialmente la squadra giocava a Woolwich, ma nel 1913 si spostò all'Arsenal Stadium, nel quartiere di Highbury; dal 2006 disputa invece le sue partite casalinghe nel nuovo Emirates Stadium. Lo stemma è stato modificato ripetutamente, ma al suo interno è sempre comparso almeno un cannone. Proprio per questo motivo i giocatori ed i tifosi dell'Arsenal sono spesso soprannominati Gunners (in italiano \"cannonieri\").\r\n\r\nL'Arsenal conta su una schiera di tifosi molto nutrita, distribuita in ogni parte del mondo. Nel corso degli anni sono sorte profonde rivalità con i sostenitori di club concittadini, la più sentita delle quali è quella con i seguaci del Tottenham Hotspur, con i quali i Gunners giocano regolarmente il North London derby.[7] L'Arsenal è anche uno dei club più ricchi del mondo, con un patrimonio stimato di 1,3 miliardi di dollari, secondo la rivista Forbes nel 2014, facendone il quinto club più ricco del pianeta e il secondo in Inghilterra.[8]",
     "strDescriptionJP": "アーセナル・フットボール・クラブ（Arsenal Football Club、イギリス英語発音: [ˈɑːsənl ˈfutˌbɔːl klʌb]）は、イングランドの首都ロンドン北部をホームタウンとする、イングランドプロサッカーリーグ（プレミアリーグ）に加盟するプロサッカークラブ。クラブカラーは赤と白。\r\n\r\n現在のホームスタジアムはロンドンのエミレーツ・スタジアム（収容人数60,260人）。プレミアリーグに所属し、同リーグにおいて3回の優勝記録を持つ（フットボールリーグ時代を含めると13回）。2003-2004シーズンには無敗優勝を達成したイングランド屈指の強豪である。1886年に軍需工場の労働者のクラブとして創設されたため、チームのエンブレムは大砲のマークを持つ。「ガナーズ（Gunners）」の愛称で知られ[1]、サポーターは「グーナー（Gooner）」と呼ばれる。\r\n\r\nクラブのモットーは「勝利は調和の中から生まれる（ラテン語: Victoria Concordia Crescit）」。1949年から使用されたクレストに初めて登場する。現行のクレストは2002年から使用されており、大砲の上にサンセリフ体でチーム名が書かれている。",
     "strDescriptionRU": "«Арсена́л» (официальное полное название — Футбольный клуб «Арсенал», англ. Arsenal Football Club, английское произношение: [ˈɑrsənəl 'futbɔ:l klʌb]) — английский профессиональный футбольный клуб из Северного Лондона, выступающий в Премьер-лиге. Основан в октябре 1886 года. Клуб 13 раз становился чемпионом Англии, 13 раз выигрывал Кубок Англии. Домашним стадионом клуба является Эмирейтс, вмещающий 60 704 зрителей[1].\r\n\r\n«Арсенал» провёл бо́льшую часть своей истории в высшем дивизионе английского футбола, в 1892 году стал одним из клубов-основателей английской Премьер-лиги[4]. Также клуб является рекордсменом по количеству сезонов подряд, проведённых в высшем дивизионе чемпионата Англии, начиная с 1919 года[5].\r\n\r\nПо данным Forbes на 2018 год, «Арсенал» занимал шестое место в списке самых дорогих футбольных клубов мира и оценивался в сумму 2,238 млрд. долларов США[6]. По данным аудиторской компании Deloitte, по итогам сезона 2016/17 «Арсенал» занимал 6-ю строчку в рейтинге самых доходных футбольных клубов с доходом в размере 487,6 млн евро[7].",
     "strDescriptionES": "El Arsenal Football Club (pronunciación en inglés: /ˈɑː(ɹ)sənəl ˈfʊtˌbɔl klʌb/) es un club de fútbol profesional con sede en Holloway, Londres, Inglaterra, que juega en la máxima categoría del fútbol de ese país, la Premier League. Uno de los más laureados del fútbol inglés, ha ganado 43 títulos en su país, incluyendo 13 campeonatos de liga y un récord de 13 Copas de Inglaterra; también ha ganado dos títulos internacionales: la Copa europea de Ferias en 1970 y la Recopa de Europa en 1994.\r\n\r\nFundado en 1886 en el sudeste de Londres, en 1893, se convirtió en el primer club del sur de Inglaterra en unirse a la Football League. Ganó sus primeros títulos —cinco ligas y dos FA Cups— en los años 1930. Luego de un período de escasez en los años posteriores a la Segunda Guerra Mundial, se convirtió en el segundo club del siglo XX en ganar el doblete, obteniendo el Campeonato de Liga y la FA Cup de la temporada 1970-71. Los logros siguieron en los años 1990 y 2000. Durante esos años, Arsenal ganó un doblete de copas nacionales, dos dobletes de Liga y Copa, y dos bicampeonatos de la Copa de Inglaterra. Finalizó una temporada de Liga invicto y se convirtió en el primer club de Londres en llegar a la final de la Liga de Campeones de la UEFA.\r\n\r\nLos colores tradicionales del club, el blanco y el rojo, han evolucionado con el tiempo. Del mismo modo, fue cambiando la ubicación del club; fundado en el distrito de Woolwich, en el sureste de Londres, en 1913 se mudó al norte de Londres, más exactamente en el distrito de Highbury, donde fue establecido el Arsenal Stadium, que funcionó hasta 2006, donde se hizo un traslado más corto, hacia los alrededores de Holloway, donde se levantó el actual Emirates Stadium. La estadía histórica del Arsenal en el norte de Londres, ha creado con el tiempo una fuerte rivalidad con el Tottenham Hotspur, conocida como el Derbi del Norte de Londres.4​\r\n\r\nArsenal posee una de las aficiones más numerosas del mundo.5​6​7​ Según la revista Forbes, el club fue el quinto club más valioso del mundo en 2014, con un valor de 1300 millones libras.8​",
     "strDescriptionPT": "Arsenal Football Club é um clube de futebol, fundado e baseado em Londres, capital da Inglaterra.\r\n\r\nO clube disputa a Premier League e é um dos mais bem sucedidos do futebol inglês, tendo ganhado por 13 vezes o título de campeão do Campeonato Inglês, sendo o terceiro em número de conquistas, e por 13 vezes a Copa da Inglaterra (recorde), sendo também detentor do recorde de maior período de invencibilidade no Campeonato Inglês e também o de ser o único a ganhar a Premier League invicto. No plano internacional, conquistou a Recopa Europeia e a Taça das Cidades com Feiras, já tendo sido finalista da Liga dos Campeões da UEFA, a principal competição europeia de clubes.\r\n\r\nO Arsenal mudou de localização ao longo do tempo, tendo sido fundado em Woolwich, sudeste de Londres, em 1913 mudou-se para o norte de Londres, para o Arsenal Stadium, em Highbury. Em 2006 foi concluída a construção do Emirates Stadium, que está localizado nas proximidades de Holloway, o que foi prometido desde 2004, após o clube fechar negócio com a Emirates Airlines, tendo capacidade para mais de 60.000 expectadores.[3]\r\n\r\nO Arsenal tem muitos torcedores por todo mundo, possuindo uma série de rivalidades de longa data com outros clubes, sendo a mais notável delas contra os vizinhos do Tottenham, com quem disputa regularmente o North London Derby, bastante intensas também contra o Chelsea e o Manchester United.[4]\r\n\r\nSuas cores têm sido tradicionalmente vermelho e branco, mas seus uniformes evoluíram ao longo da história. Um outro grande feito é o de ser um dos 5 únicos clubes do mundo que já venceram a Seleção Brasileira.[5] Já o Arsenal Ladies, é um dos clubes mais bem sucedidos do futebol feminino na Inglaterra.",
     "strDescriptionSE": null,
     "strDescriptionNL": null,
     "strDescriptionHU": null,
     "strDescriptionNO": "Arsenal Football Club er en engelsk fotballklubb som spiller i Premier League. Klubben ble stiftet i 1886, og ble valgt inn i The Football League i 1893. «The Gunners», som er kallenavnet til Arsenal, spiller hjemmekampene sine på Emirates Stadium i Holloway. Holloway er et sted i bydelen Islington som ligger i det nordlige London.",
     "strDescriptionIL": null,
     "strDescriptionPL": null,
     "strGender": "Male",
     "strCountry": "England",
     "strTeamBadge": "https://www.thesportsdb.com/images/media/team/badge/uyhbfe1612467038.png",
     "strTeamJersey": "https://www.thesportsdb.com/images/media/team/jersey/0006oc1626543801.png",
     "strTeamLogo": "https://www.thesportsdb.com/images/media/team/logo/q2mxlz1512644512.png",
     "strTeamFanart1": "https://www.thesportsdb.com/images/media/team/fanart/xyusxr1419347566.jpg",
     "strTeamFanart2": "https://www.thesportsdb.com/images/media/team/fanart/qttspr1419347612.jpg",
     "strTeamFanart3": "https://www.thesportsdb.com/images/media/team/fanart/uwssqx1420884450.jpg",
     "strTeamFanart4": "https://www.thesportsdb.com/images/media/team/fanart/qtprsw1420884964.jpg",
     "strTeamBanner": "https://www.thesportsdb.com/images/media/team/banner/rtpsrr1419351049.jpg",
     "strYoutube": "www.youtube.com/user/ArsenalTour",
     "strLocked": "unlocked"
 },
 */