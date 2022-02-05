import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:network_info_plus/network_info_plus.dart';

class AnalyticsController {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  logNetWorkInfo() async {
    final info = NetworkInfo();
    var wifiName = await info.getWifiName();
    var wifiBSSID = await info.getWifiBSSID();
    var wifiIP = await info.getWifiIP();
    var wifiIPv6 = await info.getWifiIPv6();
    var wifiSubmask = await info.getWifiSubmask();
    var wifiBroadcast = await info.getWifiBroadcast();
    var wifiGateway = await info.getWifiGatewayIP();
    analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'wifiName': wifiName,
        'wifiBSSID': wifiBSSID,
        'wifiIP': wifiIP,
        'wifiIPv6': wifiIPv6,
        'wifiSubmask': wifiSubmask,
        'wifiBroadcast': wifiBroadcast,
        "wifiGateway": wifiGateway,
      },
    );
  }
}
