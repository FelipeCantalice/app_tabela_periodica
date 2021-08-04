import 'package:app_tabela_periodica/data/http/http_client.dart';
import 'package:app_tabela_periodica/data/http/http_error.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/domain/usecases/fetch_elementos_quimicos.dart';

class FetchElementosQuimicosImpl implements FetchElementosQuimicos {
  final HttpClient httpClient;
  final String url;
  FetchElementosQuimicosImpl({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<List<ElementoQuimico>> call() async {
    try {
      final http = await httpClient.request(url: url, method: 'get')
          as Map<String, dynamic>;
      final data = http['elements'] as List;
      final elements = data.map((e) => ElementoQuimico.fromMap(e)).toList();
      return elements;
    } on HttpError catch (error) {
      print(error.toString());
      throw error == HttpError.serverError;
    }
  }
}
