import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider : 데이터를 제공하는 역할
final productPostProvider = FutureProviderFamily<ProductPost, int>((ref, id) async {
  return await DaangnApi.getPost(id);
});
