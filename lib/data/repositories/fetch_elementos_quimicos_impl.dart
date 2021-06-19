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
      final httpResponse =
          await httpClient.request(url: url, method: 'get') as List;
      final data = httpResponse.map((e) => ElementoQuimico.fromMap(e)).toList();
      return data;
    } on HttpError catch (error) {
      throw error == HttpError.serverError;
    }
  }
}
