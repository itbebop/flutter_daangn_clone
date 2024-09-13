import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/daangn/w_floating_daagn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final isSmall = ref.read(FloatingActionButtonIsSmallProvider);

      if (scrollController.position.pixels > 100 && !isSmall) {
        ref.read(FloatingActionButtonIsSmallProvider.notifier).state = true;
      } else if (scrollController.position.pixels < 100 && isSmall) {
        ref.read(FloatingActionButtonIsSmallProvider.notifier).state = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(height: 500, color: Colors.red),
        Container(height: 500, color: Colors.blue),
        Container(height: 500, color: Colors.green),
        Container(height: 500, color: Colors.yellow),
      ],
    );
  }
}
