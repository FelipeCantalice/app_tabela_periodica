import 'package:app_tabela_periodica/data/repositories/fetch_elementos_quimicos_impl.dart';
import 'package:app_tabela_periodica/infra/http/http_adapter.dart';
import 'package:app_tabela_periodica/presenter/pages/home/home_controller.dart';
import 'package:app_tabela_periodica/presenter/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(
          usecase: FetchElementosQuimicosImpl(
            httpClient: HttpAdapter(
              Client(),
            ),
            url:
                'https://raw.githubusercontent.com/Bowserinator/Periodic-Table-JSON/master/PeriodicTableJSON.json',
          ),
        ),
        child: HomeView(),
      );
  }
}
