import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/presenter/pages/elemento-details/elemento_details_page.dart';
import 'package:app_tabela_periodica/presenter/pages/elements-table/ElementsTablePage.dart';
import 'package:app_tabela_periodica/presenter/widgets/periodic_table_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);

    void _navigate(ElementoQuimico elemento) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (c) => ElementoQuimicDetails(elemento: elemento),
        ),
      );
    }

    void _navigateToTable() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (c) => ElementsTablePage(
            elementos: controller.elementos,
          ),
        ),
      );
    }

    Widget _gridView() {
      final elements = controller.filtedredElementos.isNotEmpty
          ? controller.filtedredElementos
          : controller.elementos;
      return GridView.builder(
        padding: const EdgeInsets.only(top: 20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170,
          mainAxisExtent: 140,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: elements.length,
        itemBuilder: (ctx, i) {
          final elemento = elements.elementAt(i);
          return InkWell(
            onTap: () => _navigate(elemento),
            child: PeriodicTableItem(
              elemento: elemento,
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: controller.isLoading
            ? Center(
                child: Text("Loading..."),
              )
            : Column(
                children: [
                  TextField(
                    onChanged: (String v) => controller.filterElementos(v),
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Expanded(
                    child: _gridView(),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToTable(),
        child: Icon(
          Icons.view_carousel,
        ),
      ),
    );
  }
}
