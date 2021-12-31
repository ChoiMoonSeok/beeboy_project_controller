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

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Beeboy'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FloatingActionButton(
            onPressed: (){ // 버튼이 눌리어 졌을 떄
            //블루투스를 통해 문자를 전송.
              },
            child: Icon(Icons.arrow_upward_sharp), // 버튼의 모양을 게임패로 설정
            backgroundColor: Colors.cyan, // 버튼의 색을 파랑으로 설정
          ),
          FloatingActionButton(
            onPressed: (){ // 버튼이 눌리어 졌을 떄
              //블루투스를 통해 문자를 전송.
            },
            child: Icon(Icons.arrow_downward_sharp), // 버튼의 모양을 게임패로 설정
            backgroundColor: Colors.cyan, // 버튼의 색을 파랑으로 설정
          ),
          FloatingActionButton(
            onPressed: (){ // 버튼이 눌리어 졌을 떄
              //블루투스를 통해 문자를 전송.
            },
            child: Icon(Icons.arrow_right), // 버튼의 모양을 게임패로 설정
            backgroundColor: Colors.cyan, // 버튼의 색을 파랑으로 설정
          ),
          FloatingActionButton(
            onPressed: (){ // 버튼이 눌리어 졌을 떄
              //블루투스를 통해 문자를 전송.
            },
            child: Icon(Icons.arrow_left), // 버튼의 모양을 게임패로 설정
            backgroundColor: Colors.cyan, // 버튼의 색을 파랑으로 설정
          ),

        ],
      ),
    );
  }
}