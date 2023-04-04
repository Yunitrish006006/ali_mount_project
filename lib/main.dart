import 'dart:async';
import 'dart:math';
import 'package:ali_mount_project/ImageMap.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const LoadPage(),
    );
  }
}

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});
  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  bool darkTheme = true;
  @override
  Widget build(BuildContext context) {
    const List<String> content = [
      "洋館01-主玄關\n由於日本傳統文化中階級分明，因此該玄關於日治時期功能為提供重要貴賓直接出入，服務人員並不會由此出入。",
      "洋館02-交誼廳\n依據該空間的尺度、以及壁爐設施等配置來推斷，原來應該是以西式宴會、作為設計的考量，使用之傢俱應為可收納的西式長餐桌；一般用膳時，長桌會被擺設在空間中心處，但在立式宴會招開時，該桌就會被搬移到其他位置。",
      "洋館03-蔣夫人寢室\n原本兼具的「半公開」招待功能，對外走廊的開口大且多，利用門扇的開關變化創造具私密與公共的屬性，可引入足夠的室外景致來擴展室內的視野。1949年、1951年 、1958年，蔣中正總統與蔣宋美齡夫人遊歷阿里山時住宿處。因為蔣宋美齡夫人對於梳粧臺與衣櫃的使用需求，致使空間成為私密性較重的幽暗空間。",
      "洋館04-會客室\n原來設計給皇族使用溫暖又寬敞的【洋館04】當臥室，而小間的【洋館05】則由隨侍身邊的護衛或女官使用；當夜裡尊貴的訪客有任何的臨時需要時，護衛便會快速的由連通門進入【洋館04】來服務。對於蔣中正總統而言，一個能夠辦公與會見客人的場所才是他生活的主體。雖空間僅有一向對外開門採光，但煙囪式壁爐及典雅的燈具，使整體呈現幽靜的氣氛。",
      "洋館05-蔣公寢室\n1949年、1951年、1958年，蔣中正總統與蔣宋美齡夫人遊歷阿里山時住宿處。除兩向對外開通門扇採光，又有一道直立窗的存在，整體空間氣氛因此較為舒適、乾爽。",
      "洋館06-隨扈寢室\n該空間使用者的動線被控制於一定的範圍之中，目的應該是為了使隨從、侍衛的工作動線能夠與皇族、貴客有所區分，彼此互不干擾。此空間出口也接近洋館的中心處，因此無論通達哪一個洋館空間，都極為方便快速，是最能滿足機動服務工作需求的空間",
      "洋館07-浴室\n採用乾溼分離的手法，這裡裝設了兩個洗手臺與鏡子，提供晨昏的盥洗梳妝；而再往內走去便是設有浴缸的溼式空間，以臺灣日治時期建築中即為罕見的「砂摺り」工法來做內側牆面的材料，貴客們的沐浴、泡澡，便是在這一個以水泥地坪打底舖設磁磚的空間中進行。日治時期，洋館浴室原本裝設一個尺寸為104.5cm*124.5cm的半身浴缸，今日現場的浴缸卻是 82.5cm*181cm的全身式浴缸。",
      "洋館08-廁所\n分別裝設小便斗與座式馬桶的兩個空間。牆面採用「櫛引仕上」的漆喰技法施作，成為本建築重要的特色之一。",
      "洋館09-廁所\n分別裝設小便斗與座式馬桶的兩個空間。牆面採用「櫛引仕上」的漆喰技法施作，成為本建築重要的特色之一。",
      "洋館10-鍋爐間\n在日治時期尾聲時，為了【洋館 07】浴室使用熱水的需求，而於此處增加了一間小鍋爐室，以便利燃料、設備的存放及工作人員的作業空間，外觀上刻意的延續原有建築物的石基礎、圓木短柱、雨淋板之三段建築立面構成。",
      "洋館11-內走廊\n內側走廊同時兼具兩種功能，其一是供貴賓由玄關「跨越」走廊進入居室，另外一個功能是作為服務人員快速「穿梭」於建築物的縱向路徑。內走廊挑高 360～365cm，是全棟建築中天花高度最高的一條走廊，目的應在 於塑造進入建築時的氣派感受。",
      "洋館12-內走廊\n1958 年的修復工程圖面中才出現的空間，原有【洋館11】內走廊新築一道牆將內走廊一分為二。這道牆面存在的目的，是希望能將浴廁空間獨立成一個小區塊，而不會影響其他區塊的環境，確保蔣中正總統一家人沐浴與如廁的隱私。",
      "洋館13-外走廊\n一條圍繞洋館三居室的外走廊，只是分為右、左、中三個部分而已。提供給居室內的貴客自然採光、庭園景致的一個視覺走廊。因為高山氣候寒冷又多雲霧，並不適合西洋建築引入外氣與日光的欄杆走廊，只有裝設大面的玻璃窗才能夠確保日光、景致的進入與寒氣的阻隔，可以說是此類型洋館的特例。",
      "洋館14-外走廊\n一條圍繞洋館三居室的外走廊，只是分為右、左、中三個部分而已。提供給居室內的貴客自然採光、庭園景致的一個視覺走廊。因為高山氣候寒冷又多雲霧，並不適合西洋建築引入外氣與日光的欄杆走廊，只有裝設大面的玻璃窗才能夠確保日光、景致的進入與寒氣的阻隔，可以說是此類型洋館的特例。",
      "洋館15-外走廊\n一條圍繞洋館三居室的外走廊，只是分為右、左、中三個部分而已。提供給居室內的貴客自然採光、庭園景致的一個視覺走廊。因為高山氣候寒冷又多雲霧，並不適合西洋建築引入外氣與日光的欄杆走廊，只有裝設大面的玻璃窗才能夠確保日光、景致的進入與寒氣的阻隔，可以說是此類型洋館的特例。",
      "和館01-座敷\n在日治時期應該是皇族與貴賓招開日本傳統茶會的重要所在，擁有全貴賓館最為細緻、且多元的裝修，圓形並以竹枝構成圖樣的下地窗，漆喰工法採用砂壁、京壁，欄間板分別有角柄欄間與彫刻欄間兩種，以組子入施作的書院，還有繪製觀世水紋式的襖門等等構件，將空間妝點的豐富有趣。 ",
      "和館02-主居室\n日本傳統建築中的書院造建築配置，其內涵是以一個含有書院的座敷為核心，與鄰旁的主要居間及緣側三者形成一個基本單元組合，再向外擴張配置其他的次要居間、玄關、台所（廚房）、便所等空間，成為一棟完整的建築。",
      "和館03-座敷\n此空間組的位階較低，因此並非皇族、貴賓與貼身隨扈所使用的空間，而是更次一階級的隨從居所。現場木桁殘留的貼紙「殿下ヨリ」與「御用掛室ヨリ」為皇族與貼身隨扈房間的電鈴標示，於這兩張貼紙的下方，現今也還保有舊有應答鈴拆除的痕跡，顯示該空間使用者的身分是服務皇族與貼身隨扈的其他服務人員。",
      "和館04-次居室\n由一間座敷【和館03】組合居間【和館04】，再於旁側設置緣側【和館13】形成獨立的一個空間組合。襖門上貼附了精美的和紙，圖樣分為了五三桐花與松樹兩種；而欄間板也有角柄欄間與波濤紋樣的彫刻欄間等。",
      "和館05-廚房\n日治時期是一個由木地板平台圍繞的浴場，因為蔣家生活有設置廚房的需求，導致這一個空間被大幅度的改造，更衣室的木板地坪與原有分隔的牆面被拆除，原本由儲物、更衣、玄關、沐浴的四個小空間組成的浴場，被整併為一間廚房。其內裝設了「上海茂大鐵灶製造廠臺北分場」出產的爐灶與英國「TWYFORDS」公司出產的洗手臺，可作為時代變遷的證物。",
      "和館06-儲藏室\n該空間應該是【洋館02】的儲藏空間。配合【洋館02】使用型態分析，戰前【和館06】最大的功能可能有兩個，分別是「存放【洋館02】不需要使用的傢俱」與「作為【洋館02】的配膳室」。此空間只有與【和館10】走廊連接，所以能在不干擾洋館作息的狀況下，完成所有服務的幕後準備工作。",
      "和館07-浴室\n原本是一間約 250cm*450cm的廁所，內部包含三間蹲式馬桶、四個小便斗與一個洗手臺，戰後【和館05】由浴場變成廚房，使得沐浴需求搬移至他處。於是，巧妙的延長既有廁所牆面成為現今浴室【和館07】與廁所【和館08】之間的牆面。",
      "和館08-廁所\n戰後將小便斗拆除、蹲式馬桶改為座式馬桶、新增洗手臺，同時從後門玄關【和館11】處，自行新增一樘門扇進出。牆面白色磁磚及轉角收頭的地面，讓空間感受放大，沒有壓迫感。其外牆處，裝設了專門對應馬桶的化糞池。",
      "和館09-副玄關\n洋館通常配置主要入口，而和館配置附屬入口，之所以區分為主、附，原因並不在於功能性，而是在於使用者的地位。此空間，在功能上，隨扈人員一進入建築就可以透過中央走廊【和館10】快速的移動到建築物的各處，也可以在離開時早於貴賓一步做準備。在意象上，由本空間進入面對的就是【和館01】的優美下地園窗，無需刻意裝飾就能塑造「適當」的入口意象。",
      "和館10-內走廊\n是貫穿和館的主要動線，不但和館所有的空間都依賴著這條走廊互通，它更重要的意義在於它也是唯一一條聯繫與分隔和、洋館的「室內通路」，巧妙的同時扮演連續與分隔的角色。",
      "和館11-內走廊\n原始的設計上，【洋館01】、【和館09】、【和館05】與【和館11】，分別有貴賓館的四個對外玄關，各自有不同的功能與屬性。此空間在最初的設計目的上，並不是為了讓「人」進入貴賓館，而是為了從外側運送物品才設置。",
      "和館12-緣側\n緣側面對的是全棟建築之後最主要的後庭，除了提供【和館 01】、【和館 02】兩個室內空間採光，更重要的是引入特別規劃的後庭景觀，提供於此的貴客有最好的視覺饗宴。",
      "和館13-緣側\n緣側除了提供【和館 03】、【和館 04】兩個室內空間採光，更重要的是引入面對山石造景為主的前庭。",
    ];
    const List<List<Offset>> points = [
      [
        Offset(800, 980),
        Offset(800, 1260),
        Offset(1070, 1260),
        Offset(1070, 980)
      ],
      [
        Offset(1080, 980),
        Offset(1080, 1600),
        Offset(1560, 1600),
        Offset(1560, 980)
      ],
      [
        Offset(1080, 360),
        Offset(1080, 780),
        Offset(1560, 780),
        Offset(1560, 360)
      ],
      [
        Offset(600, 360),
        Offset(600, 780),
        Offset(1080, 780),
        Offset(1080, 360)
      ],
      [
        Offset(250, 360),
        Offset(250, 780),
        Offset(600, 780),
        Offset(600, 360)
      ],
      [
        Offset(450, 980),
        Offset(450, 1340),
        Offset(800, 1340),
        Offset(800, 980)
      ],
      [
        Offset(260, 980),
        Offset(260, 1340),
        Offset(450, 1340),
        Offset(450, 980)
      ],
      [
        Offset(110, 910),
        Offset(110, 1040),
        Offset(260, 1040),
        Offset(260, 910)
      ],
      [
        Offset(110, 1040),
        Offset(110, 1130),
        Offset(260, 1130),
        Offset(260, 1040)
      ],
      [
        Offset(110, 1130),
        Offset(110, 1330),
        Offset(260, 1330),
        Offset(260, 1130)
      ],
      [
        Offset(450,780),
        Offset(450,980),
        Offset(1560,980),
        Offset(1560,780)
      ],
      [
        Offset(110,780),
        Offset(110,910),
        Offset(260,910),
        Offset(260,980),
        Offset(450,980),
        Offset(450,780)
      ],
      [
        Offset(1560, 230),
        Offset(1560, 640),
        Offset(1690, 640),
        Offset(1690, 230)
      ],
      [
        Offset(110, 230),
        Offset(110, 780),
        Offset(250, 780),
        Offset(250, 230)
      ],
      [
        Offset(250, 160),
        Offset(250, 360),
        Offset(1560, 360),
        Offset(1560, 160)
      ],
    //  ===============
      [
        Offset(2110, 770),
        Offset(2110, 1060),
        Offset(1770, 1060),
        Offset(1770, 770)
      ],
      [
        Offset(2390, 770),
        Offset(2390, 1060),
        Offset(2110, 1060),
        Offset(2110, 770)
      ],
      [
        Offset(2250, 1190),
        Offset(2250, 1470),
        Offset(1980, 1470),
        Offset(1980, 1190)
      ],
      [
        Offset(2450, 1190),
        Offset(2450, 1470),
        Offset(2250, 1470),
        Offset(2250, 1190)
      ],
      [
        Offset(2570, 1260),
        Offset(2570, 1475),
        Offset(2520, 1475),
        Offset(2520, 1750),
        Offset(2940, 1750),
        Offset(2940, 1475),
        Offset(2940, 1260)
      ],
      [
        Offset(1770, 1190),
        Offset(1770, 1470),
        Offset(1560, 1470),
        Offset(1560, 1190)
      ],
      [
        Offset(2620, 830),
        Offset(2620, 1060),
        Offset(2460, 1060),
        Offset(2460, 830)
      ],
      [
        Offset(2800, 830),
        Offset(2800, 1060),
        Offset(2620, 1060),
        Offset(2620, 830)
      ],
      [
        Offset(1910, 1190),
        Offset(1910, 1470),
        Offset(1770, 1470),
        Offset(1770, 1190)
      ],
      [
        Offset(1560, 640),
        Offset(1560, 1190),
        Offset(2660, 1190),
        Offset(2660, 1050),
        Offset(1700, 1050),
        Offset(1700, 640)
      ],
      [
        Offset(2810, 1050),
        Offset(2810, 1190),
        Offset(2660, 1190),
        Offset(2660, 1050)
      ],
      [
        Offset(1770, 640),
        Offset(1770, 780),
        Offset(2450, 780),
        Offset(2450, 640),
      ],
      [
        Offset(1910, 1470),
        Offset(1910, 1550),
        Offset(2520, 1550),
        Offset(2520, 1470),
      ],
      // [
      //   Offset(2900, 980),
      //   Offset(2900, 1260),
      //   Offset(3070, 1260),
      //   Offset(3070, 980),
      // ],
      // [
      //   Offset(2900, 640),
      //   Offset(2900, 880),
      //   Offset(3070, 880),
      //   Offset(3070, 640),
      // ],
      // [
      //   Offset(3070, 640),
      //   Offset(3070, 1260),
      //   Offset(3220, 1260),
      //   Offset(3220, 640),
      // ],
    ];
    final List<Path> polygonRegions = points.map((e) {
      Path p = Path();
      p.addPolygon(e, true);
      return p;
    }).toList();
    final List<Color> colors = List.generate(points.length, (index) => Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.2));
    return Scaffold(
        backgroundColor: darkTheme ? null : Colors.white,
        body: Container (
            color: Colors.white,
            child:Center(
              child: ImageMap(
                imagePath: 'assets/map.png',
                imageSize: const Size(3309, 1861),
                onTap: (i) {
                  colors[i] = colors[i] == const Color.fromRGBO(50, 50, 200, 0.5) ? const Color.fromRGBO(50, 200, 50, 0.5) : const Color.fromRGBO(50, 50, 200, 0.5);
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black12.withOpacity(0.9), // Background color
                    barrierDismissible: false,
                    barrierLabel: 'Dialog',
                    transitionDuration: const Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 24,
                              child: SizedBox.expand(child:
                              Image.asset(
                                i<15 ? "assets/west/${i+1}.jpg" : "assets/east/${i-14}.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(),
                            ),
                            Expanded(
                              flex: 12,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 12.0,
                                  ),
                                  child: Text(
                                    content[i],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(),
                            )
                          ],
                        ),
                      );
                    },
                  );
                  setState(() {});
                },
                regions: polygonRegions,
                regionColors: colors,
              ),
            )
        ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoadPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}