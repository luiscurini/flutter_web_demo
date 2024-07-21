import 'package:flutter/widgets.dart';
import 'package:flutter_web/base/view_state.dart';

/// If a function for initialization is needed, please name it `onInit();`.
/// Parameters should be named and required.
/// For example:
/// ```dart
/// Future<void> onInit({@required VoidCallback registerSuccess}) async {
///    assert(registerSuccess != null);
/// }
/// ```
abstract class ViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  bool _mounted = true;

  ViewState get state => _state;

  void _setState(ViewState viewState) {
    // safeguard here against callbacks that might trigger state changes after
    // the model was already disposed.
    if (_mounted) {
      _state = viewState;
      notifyListeners();
    }
  }

  void update() {
    if (_mounted) {
      notifyListeners();
    }
  }

  void setLoading() => _setState(ViewState.loading);

  void setIdle() => _setState(ViewState.idle);

  void setError() => _setState(ViewState.error);

  bool get isLoading => _state == ViewState.loading;

  bool get isIdle => _state == ViewState.idle;

  bool get hasError => _state == ViewState.error;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
