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
        mainAxisAlignment:  MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(
              '   click the bluetooth to connect',
              style: TextStyle(fontSize: 20.0),
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