import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';

abstract class FetchElementosQuimicos {
  Future<List<ElementoQuimico>> call();
}
