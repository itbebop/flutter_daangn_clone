import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

String picSum(int id) => 'https://picsum.photos/id/$id/200/200';
final user1 = User(
  id: 1,
  nickname: '홍길동',
  temperature: 36.5,
  profileUrl: picSum(1010),
);
final user2 = User(
  id: 2,
  nickname: '공스킨',
  temperature: 36.5,
  profileUrl: picSum(900),
);
final user3 = User(
  id: 3,
  nickname: '칭키스칸',
  temperature: 36.5,
  profileUrl: picSum(700),
);
final product1 = Product(
  user1,
  '아이폰13',
  70000,
  '깨끗해요',
  ProductStatus.normal,
  [
    picSum(400),
    picSum(401),
    picSum(402),
    picSum(403),
  ],
);
final product2 = Product(
  user2,
  '아이폰5',
  50000,
  '지저분해요',
  ProductStatus.booked,
  [
    picSum(500),
    picSum(501),
    picSum(502),
    picSum(503),
  ],
);
final post1 = ProductPost(product1.user, product1, '글의 내용1', '서울시 관악구1', 3, 2, DateTime.now().subtract(30.minutes));
final post2 = ProductPost(product2.user, product2, '글의 내용2', '서울시 관악구2', 2, 3, DateTime.now().subtract(5.minutes));
final post3 = ProductPost(product2.user, product2, '글의 내용3', '서울시 관악구3', 1, 1, DateTime.now().subtract(10.seconds));

final postList = [
  post1,
  post2,
  post3,
  post1,
  post2,
  post3,
];
