import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/domain/usecases/fetch_elementos_quimicos.dart';
import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  final FetchElementosQuimicos usecase;
  bool isLoading = true;
  bool showSearch = false;

  HomeController({
    required this.usecase,
  }) {
    fetchElementos();
  }
  List<ElementoQuimico> _elementos = [];

  List<ElementoQuimico> _filtedredElementos = [];

  List<ElementoQuimico> get elementos => [..._elementos];

  List<ElementoQuimico> get filtedredElementos => [..._filtedredElementos];

  void fetchElementos() async {
    try {
      var data = await usecase();
      _elementos = data;
      isLoading = !isLoading;
      notifyListeners();
      return;
    } catch (e) {
      print(e);
    }
  }

  void filterElementos(String search) {
    if (search.isEmpty || search.length < 3) {
      _filtedredElementos = [];
      notifyListeners();
      return;
    }

    _filtedredElementos = _elementos
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void toggleSearch() {
    showSearch = !showSearch;
    notifyListeners();
  }
}
