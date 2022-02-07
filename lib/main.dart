import 'package:flutter/material.dart';
//import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
//import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_blue/flutter_blue.dart';


FlutterBlue flutter_blue = FlutterBlue.instance;
bool _Scanning = false;
List<ScanResult> scan_results = [];
int num_device = 0;

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

    String DeviceId = '34:B1:F7:D5:34:43';//'C31499B1-7E1A-CEDF-2586-2CEFCAB55E53';//'B4:52:A9:13:29:21';//'888D9FAC-0E80-37AF-ED3C-7E58444BBB81';
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan ble'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('BLE Scan'),
              onPressed: (){
                // 블루투스 스캔 후 화면 넘기고 리스트 뷰로 정렬하기

                Navigator.push(// 화면 넘기기
                  context,
                  MaterialPageRoute(builder: (context)=>BluetoothConnectPage()), // 다음 화면을 BluetoothConnectPage()로 구성해라.
                );

              },

              ),
        ],
      ),
    );


  }
}


class BluetoothConnectPage extends StatefulWidget{

  @override

  BluetoothConnectPageState createState() => BluetoothConnectPageState();

}


class BluetoothConnectPageState extends State<BluetoothConnectPage>{

  //final flutterReactiveBle = FlutterReactiveBle();

  Widget widget_list_view(ScanResult r){
    return ListTile(
      onTap: connect_ble(r), // 리스트 타일을 누르면 블루투스 연결
    );
  }

  connect_ble(ScanResult r) async{ // 블루투스 연결
    await r.device.connect();
  }

  @override

  Widget build(BuildContext context){

    flutter_blue.startScan(timeout: Duration(seconds: 3)); // 3초간 ble스캔

    flutter_blue.scanResults.listen((results) {
      scan_results.clear(); // 이전의 블루투스 정보 삭제
      scan_results = results; // 리스트에 스캔한 블루투스 모듈 정보 저장
    }
    );

    flutter_blue.stopScan();
    //var DeviceId = '34:B1:F7:D5:34:43';
    //flutterReactiveBle.scanForDevices(withServices: [], scanMode: ScanMode.lowLatency).listen((device){
      //print(device.id);
    //}, onError: (){

    //});

    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth connect'),
      ),
      body: Center(
        /* 장치 리스트 출력 */

        child: ListView.separated(
            itemBuilder: (context, index){ // 렌더링할 타일 지정하기
              num_device = index;
              return widget_list_view(scan_results[index]);
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: scan_results.length, // listview의 길이 지정
        )

      ),
    );
    //);

    }

}



class ThirdPage extends StatelessWidget{ // control 페이지


  Write_ble(ScanResult r, var a) async{
    var char;
    List<BluetoothService> services = await r.device.discoverServices();
    services.forEach((service) {
      char = service.characteristics;
    });

    await char.write[a]; // 글자 ble로 입력
  }

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
              Write_ble(scan_results[num_device], 'E');
            },
            child: Icon(Icons.replay),
          ),
        ),
        //1

        Container(

        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: (){
            Write_ble(scan_results[num_device], 'U');

          },
          child: Icon(Icons.keyboard_arrow_up),
          ),
        ),//2


        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'B');

            },
            child: Icon(Icons.refresh),
          ),
        ), //3

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'L');
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),

        ), //4

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'F');

            },
            child: Icon(Icons.open_with),
          ),

        ), //5

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'R');

            },
            child: Icon(Icons.keyboard_arrow_right),
          ),
        ), //6

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'A');

            },
            child: Icon(Icons.light),
          ),
        ), // 7

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'D');
            },
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ), //8

        Container(

          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: (){
              Write_ble(scan_results[num_device], 'S');
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

