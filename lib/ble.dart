import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';

List<int> F = [25,70]; //돌진
List<int> R = [25,82]; // 우회전
List<int> U = [25,85]; // 전진 //
List<int> L = [25,76]; // 좌회전
List<int> D = [25,68]; // 후진
List<int> B = [25,66]; // 오른쪽 제자리
List<int> E = [25,69]; // 왼쪽 제자리
List<int> S = [25,83]; // led off
List<int> A = [25,65]; // led on 71
List<int> stop = [25,67]; // 정지

FlutterBlue flutter_blue = FlutterBlue.instance;
bool Scanning = false;
List<ScanResult> scan_results = [];
List<BluetoothService> services = [];
int num_device = 0;
List<BluetoothCharacteristic> characteristic = [];
var char;

discover_service(ScanResult r) async{ //services 찾기
  services = await r.device.discoverServices();
  services.forEach((service){
    print(service.characteristics);
    characteristic = service.characteristics;
  });
}


Write_ble(List<int> a) async{
  for(BluetoothCharacteristic c in characteristic) {
    await c.write(a);
  }
}

Write_stop() async{
  for(BluetoothCharacteristic c in characteristic) {
    await c.write(stop);
  }
}

connect_ble(ScanResult r) async{
  await r.device.connect();
  discover_service(r);
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