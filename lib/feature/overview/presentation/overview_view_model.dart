import '../../../base/view_model.dart';
import '../data/repository/overview_repository.dart';
import '../domain/model/overview_results.dart';

class OverviewViewModel extends ViewModel {
  final OverviewRepository _repository;

  OverviewViewModel(this._repository);

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  List<OverviewResults> _overviewResults = [];

  List<OverviewResults> get overviewResult => _overviewResults;

  Future<void> onInit() => load();

  Future<void> load() async {
    setLoading();
    try {
      _overviewResults = await _repository.getOverviewRestaurants();
      setIdle();
    } catch (_) {
      setError();
    }
  }

  void setSelectedItem(int? index) {
    _selectedIndex = index;
    update();
  }
}
