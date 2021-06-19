import 'package:flutter/cupertino.dart';

import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/domain/usecases/fetch_elementos_quimicos.dart';

class HomeController with ChangeNotifier {
  final FetchElementosQuimicos usecase;

  HomeController({
    required this.usecase,
  });

  Future<void> fetchElementos() async {
    var data = await usecase();
    _elementos = data;
    return;
  }

  List<ElementoQuimico> _elementos = [];

  List<ElementoQuimico> get elementos => [..._elementos];
}
