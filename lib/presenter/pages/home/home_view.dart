import 'package:app_tabela_periodica/presenter/widgets/periodic_table_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);

    Widget _gridView() {
      return GridView.builder(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130,
          mainAxisExtent: 130,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: controller.elementos.length,
        itemBuilder: (ctx, i) {
          final elemento = controller.elementos[i];
          return PeriodicTableItem(
            elemento: elemento,
          );
        },
      );
    }

    return Container(
      child: FutureBuilder<void>(
          future: controller.fetchElementos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Text("Loading tasks...");
            }

            return _gridView();
          }),
    );
  }
}
