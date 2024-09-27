import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider : 데이터를 제공하는 역할
final remoteNotificationProvider = FutureProvider((ref) async {
  final result = await DaangnApi.getNotification();
  return result.successData;
});
final notificationProvider = StateProvider<List<DaangnNotification>?>((ref) {
  final list = ref.watch(remoteNotificationProvider);
  // AsyncValue<List<DaangnNotification>> list 타입
  // value존재(성공한 경우)
  if (list.hasValue) {
    return list.requireValue;
  }
  return null;
  // 세팅이 안되어있다는 것을 표현하기 위해 []를 돌려주는 대신 nullable로 만들고 null을 반환
});
