import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 데이터를 provider에 저장함
// final productPostProvider = FutureProviderFamily<ProductPost, int>((ref, id) async {
//   return await DaangnApi.getPost(id);
// });

// detail에서 호출할 때마다 서버와 통신
class ProductPostNotifier extends AutoDisposeFamilyAsyncNotifier<ProductPost, int> {
  @override
  Future<ProductPost> build(int id) async {
    return await DaangnApi.getPost(id);
  }
}

final productPostProvider = AutoDisposeAsyncNotifierProviderFamily<ProductPostNotifier, ProductPost, int>(() {
  return ProductPostNotifier();
});
