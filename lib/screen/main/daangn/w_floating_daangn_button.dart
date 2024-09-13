import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingDaangnButton extends ConsumerWidget {
  // 성능적인 이슈가 있을 때는 아래, 성능이슈 없을 때는 가독성을 위해서 위처럼
  FloatingDaangnButton({super.key});
  final duration = 300.ms;
  // const FloatingDaangnButton({super.key});
  // static const duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const isExpanded = true;

    return Stack(
      children: [
        AnimatedContainer(
          duration: duration,
          color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 160,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(right: 15, bottom: 10),
                decoration: BoxDecoration(
                  color: context.appColors.floatingActionLayer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _floatItem('알바', '$basePath/fab/fab_01.png'),
                    _floatItem('과외/클래스', '$basePath/fab/fab_02.png'),
                    _floatItem('농수산물', '$basePath/fab/fab_03.png'),
                    _floatItem('부동산', '$basePath/fab/fab_04.png'),
                    _floatItem('중고차', '$basePath/fab/fab_05.png'),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: duration,
                height: 60,
                decoration: BoxDecoration(
                  color: isExpanded ? context.appColors.floatingActionLayer : const Color(0xffff791f),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  AnimatedRotation(
                    turns: isExpanded ? 0.125 : 0,
                    duration: duration,
                    child: const Icon(Icons.add),
                  ),
                  '글쓰기'.text.make(),
                ]),
              ).pOnly(
                bottom: MainScreenState.bottomNavigationBarHeight + context.viewPaddingBottom + 10,
                right: 20,
              ),
            ],
          ),
        ),
        // padding주니까 위치 변경됨
      ],
    );
  }

  _floatItem(String title, String imagePath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 30,
        ),
        const Width(8),
        title.text.make(),
      ],
    );
  }
}
