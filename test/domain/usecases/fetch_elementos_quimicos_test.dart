import 'package:app_tabela_periodica/data/http/http_client.dart';
import 'package:app_tabela_periodica/data/repositories/fetch_elementos_quimicos_impl.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/domain/usecases/fetch_elementos_quimicos.dart';
import 'package:app_tabela_periodica/infra/http/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

void main() {
  late FetchElementosQuimicos usecase;
  late HttpClient cliente;

  setUp(() {
    cliente = HttpAdapter(Client());
    usecase = FetchElementosQuimicosImpl(
        httpClient: cliente, url: 'https://neelpatel05.pythonanywhere.com/');
  });

  test('fetch elementos quimicos ...', () async {
    var data = await usecase();

    expect(data, isA<List<ElementoQuimico>>());
  });
}
