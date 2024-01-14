import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("Instrumental.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/me.jpg',width:40,height:40): Image.asset('images/me.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('Instrumental.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('Pianoarr.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('kaf_Instrumental.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('TheEnd.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我從小就對科技和電腦有著濃厚的興趣，所以我選擇了高職讀雄工，希望能學習更多相關的知識和技能。在高職的三年裡，我不僅學習了許多實用的課程，如程式設計、網路、資料庫等，也參與了一些有趣的活動和比賽，如創意程式競賽、電腦組裝大賽等。這些經驗讓我更加確定了我對資訊工程的熱情和志向。'
  '我也很感恩我有一個美滿的家庭，我的父母和兄弟姊妹都很支持我，給我很多鼓勵和幫助。我們之間的關係非常和諧，我們經常一起吃飯、聊天、玩遊戲，享受彼此的陪伴。我知道他們是我最堅強的後盾，無論我遇到什麼困難，他們都會站在我身邊。'
  '在高職畢業後，我決定繼續追求我的夢想，報考了高科資工系。這是一個很艱難的過程，我必須付出很多努力和時間，準備考試和面試，競爭激烈。但是我沒有放棄，我相信自己有能力和潛力，只要努力就有希望。雖然我是依靠登記分發而到了這所學校但我還是覺得在跟雄工的老師練習面試的時候是我這一個高職生涯最後且最重要的一課.最後，我成功地考上了高科資工系，這是我人生中最開心的時刻之一。'
  '我覺得我是一個幸運的人，我有一個我喜歡的專業，一個我愛的家庭，一個我期待的未來。 我覺得我的人生異常順利 因為我遇到了很多 幫助過我的老師 和了解我的家長 我覺得我比一般家庭要幸福很多 謝謝您能到這裡';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('這是我', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/me.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/my_favorite_singer.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/my_favorite_cover.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('這是我到高科第一個專題', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          //放一張照片
          Container(
            child:Image.asset('images/me_project.png'),
          ),
          SizedBox(height: 30),
          Container(
              child:Text('https://github.com/hhhh514/Pet_web/tree/master', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. 組合語言'),
                  Text('3. 網頁設計'),
                  Text('4. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. java'),
                  Text('3. 系統程式'),
                  Text('4. 離散數學'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Text('朝向方向 網頁設計師', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('前端開發：'),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:200,
            width: 200,
            child: ListView(
              children: [
                Text('1. HTML、CSS、JavaScript等前端技術'),
                Text('2. 瀏覽器相容性和性能優化'),
                Text('3. 使用前端框架（如React、Angular、Vue.js）'),
              ],
            ),
          ),
        ],
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('後端開發：'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1.伺服器端語言（如Node.js、Python、Ruby、Java、PHP等）'),
                  Text('2. 資料庫管理和整合'),
                  Text('3. 伺服器配置和部署'),
                ],
              ),
            ),
          ],
        ),
    ]),
    );
  }
}