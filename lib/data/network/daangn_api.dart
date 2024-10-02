import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/screen/notification/vo/notification_dummies.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  // 성공하면 List<DaangnNotification>, 실패하면 ApiError 타입의 결과 반환하도록
  static Future<SimpleResult<List<DaangnNotification>, ApiError>> getNotification() async {
    await sleepAsync(3000.ms);
    return SimpleResult.success(notificationList);
    // 에러 반환하진 않음
    // 일반적으론 Singleton, 편의를 위해서 static함수로 만듬
  }

  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(500.ms);
    return ProductPost(simpleProductPost: post1, content: '깨끗하게 잘 쓰던 물건이에요');
  }
}
