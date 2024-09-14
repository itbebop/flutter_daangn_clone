import 'package:fast_app_base/screen/main/daangn/w_floating_daangn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider = StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  @override
  bool updateShouldNotify(old, current) {
    // statte에 할당할 때 넘겨주는 새로운 state와 기존의 value에 들어있는 state를 비교하는 함수
    return super.updateShouldNotify(old, current); // 같지 않다면 true
    // 이렇게 쓰려면 실제로 다른 값이 내려오게 해야함
    // return true; // 무조건 바뀌었다고 알려주는 것(편법)
  }

  void onTapButton() {
    // state = state
    //   ..isExpanded = !state.isExpanded
    //   ..isSmall = true;

    // 다른 객체를 넣어줌
    // freezed 만들어서 copywith도 쓸 수 있지만
    // 값 2개다 바꿔야하므로 그냥 이렇게 만들어줌
    state = FloatingButtonState(!state.isExpanded, true);
  }

  void changeButtonSize(bool isSmall) {
    // state = state..isSmall = isSmall;

    // state = FloatingButtonState(state.isExpanded, isSmall);

    state = state.copyWith(isSmall: isSmall);
  }
}
