import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingButtonState {
  bool isExpanded;
  bool isSmall;

  FloatingButtonState()
      : isExpanded = false,
        isSmall = false;
}

final floatingButtonStateProvider = StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    FloatingButtonState(),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  @override
  bool updateShouldNotify(old, current) {
    // statte에 할당할 때 넘겨주는 새로운 state와 기존의 value에 들어있는 state를 비교하는 함수
    // return super.updateShouldNotify(old, current);
    return true; // 무조건 바뀌었다고 알려주는 것(편법)
  }

  void onTapButton() {
    state = state
      ..isExpanded = !state.isExpanded
      ..isSmall = true;
  }

  void changeButtonSize(bool isSmall) {
    print(isSmall);
    state = state..isSmall = isSmall;
  }
}
