import 'package:flutter/material.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:app_tabela_periodica/presenter/pages/elemento-details/elemento_details_page.dart';
import 'package:app_tabela_periodica/presenter/widgets/periodic_table_item.dart';

class ElementsTablePage extends StatelessWidget {
  final List<ElementoQuimico> elementos;
  ElementsTablePage({
    Key? key,
    required this.elementos,
  }) : super(key: key);

  Widget _buildTable(BuildContext c) {
    List<Widget> widgets = [];
    // cria linhas
    for (var i = 0; i < 10; i++) {
      List<Widget> rowWidgets = [];
      // adiciona itens para a linha
      for (var j = 0; j < 18; j++) {
        // VERIFY: verifica na lista de elementos que veio da API
        // se existe um que se encaixe nesta posição
        var found = false;
        // procura na lista
        for (var elemento in elementos) {
          // encontrou
          if ((elemento.xpos! - 1) == j && (elemento.ypos! - 1) == i) {
            found = true;
            rowWidgets.add(ElementTable(elemento: elemento));
            break;
          }
        }
        // senão encontrou
        if (found == false) {
          rowWidgets.add(ElementTable(elemento: null));
        }
      }
      // adiciona todos os elementos para a linha
      widgets.add(Row(children: rowWidgets));
    }

    return Container(
      child: Column(
        children: widgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: InteractiveViewer(
          maxScale: 10,
          child: FittedBox(child: _buildTable(context)),
        ),
      ),
    );
  }
}

class ElementTable extends StatelessWidget {
  final ElementoQuimico? elemento;
  const ElementTable({
    Key? key,
    required this.elemento,
  }) : super(key: key);

  static const SQUARE_SIZE = 160.0;

  @override
  Widget build(BuildContext context) {
    void _navigate(ElementoQuimico elemento) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (c) => ElementoQuimicDetails(elemento: elemento),
        ),
      );
    }

    if (elemento != null) {
      return InkWell(
        onDoubleTap: () => _navigate(elemento!),
        child: Container(
          width: SQUARE_SIZE,
          height: SQUARE_SIZE,
          margin: const EdgeInsets.all(4),
          child: PeriodicTableItem(
            elemento: elemento!,
          ),
        ),
      );
    }
    return Container(
      width: SQUARE_SIZE,
      height: SQUARE_SIZE,
      margin: const EdgeInsets.all(4),
    );
  }
}
