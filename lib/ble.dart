import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';


FlutterBlue flutter_blue = FlutterBlue.instance;
bool Scanning = false;
List<ScanResult> scan_results = [];
int num_device = 0;



Widget widget_list_view(ScanResult r){
  return ListTile(
    title: Text(r.device.name),
    onTap: connect_ble(r), // 리스트 타일을 누르면 블루투스 연결
    subtitle: Text(r.device.id.toString()),
  );
}

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

