import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';


FlutterBlue flutter_blue = FlutterBlue.instance;
bool Scanning = false;
List<ScanResult> scan_results = [];
int num_device = 0;


connect_ble(ScanResult r) async{
  await r.device.connect();
}

@override
initState(){
  initState();

  initBle();
}

initBle(){
  flutter_blue.isScanning.listen((isScanning) {
    Scanning = isScanning;
  });
}

scan_ble() async {// 블루투스 스캔 함
  if (!Scanning) {
    scan_results.clear(); // 블루투스 모듈 리스트 초기화

    flutter_blue.startScan(timeout: Duration(seconds: 4)); // 블루투스를 1초간 탐색

    flutter_blue.scanResults.listen((results) {
      for (ScanResult r in results){
        print(r.device.name);
        scan_results.add(r);
      }
    }
    );
  }
}

Widget widget_list_view(ScanResult r) {
  return ListTile(
    title: Text(r.device.name),
    onTap: () {
      connect_ble(r);
    }, // 리스트 타일을 누르면 블루투스 연결
    subtitle: Text(r.device.id.toString()),
  );
}