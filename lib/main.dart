import 'package:flutter/material.dart';

void main() => runApp(start());

class start extends StatelessWidget{ // 초기화면 구성
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Beeboy', //앱의 제목
      home: FirstPage(), // 앱의 화면을 FirstPage() 함수로 구성함
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Beeboy Controller Main'), // 화면 맨위의 바에 적힌 내용
      ),
      body: Row(

        mainAxisAlignment:  MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


            FloatingActionButton(
              onPressed: (){ // 버튼이 눌리어 졌을 떄
                // 블루투스 연결 화면으로 이동
                Navigator.push(  // 화면을 변경하는 함수
                  context,
                  MaterialPageRoute(builder: (context)=>SecondPage()),
                );
              },
              child: Icon(Icons.bluetooth), // 버튼의 모양을 블루투스로 설정
              backgroundColor: Colors.blue, // 버튼의 색을 파랑으로 설정
            ),

            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(30),
            ),

            FloatingActionButton(
              onPressed: (){ // 버튼이 눌리어 졌을 떄
                // 블루투스 연결 화면으로 이동
                  Navigator.push(  // 화면을 변경하는 함수
                    context,
                    MaterialPageRoute(builder: (context)=>ThirdPage()),
                  );
                },
              child: Icon(Icons.gamepad), // 버튼의 모양을 게임패로 설정
              backgroundColor: Colors.cyan, // 버튼의 색을 파랑으로 설정
            ),

          ],
      ),

    );
  }


}


class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect ble'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('BLE Scan'),
              onPressed: (){
                // ble scan
              }
              ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget{ // control 페이지
  @override

  GridView Grid_9(){

    return GridView.count(
      crossAxisCount: 3, // 1줄에 몇개의 위젯이 들어가는지 결정
      crossAxisSpacing: 0, // 가로 간격
      mainAxisSpacing: 35, // 세로 간격

      children: <Widget>[

        Container(

        ),

        Container(

        ),

        Container(

        ),


        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.atm),
          ),
        ),
        //1

        Container(

        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.arrow_upward),
          ),
        ),//2


        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.atm),
          ),
        ), //3

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.arrow_left),
          ),

        ), //4

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.atm),
          ),

        ), //5

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.arrow_right),
          ),
        ), //6

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.light),
          ),
        ), // 7

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.arrow_downward),
          ),
        ), //8

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.speaker),
          ),

        ), // 9

      ],

    );
  }



  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Beeboy'),
      ),
      body: Grid_9(),
      );


  }
}