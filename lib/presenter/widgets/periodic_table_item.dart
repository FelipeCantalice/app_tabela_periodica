import 'package:app_tabela_periodica/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';

class PeriodicTableItem extends StatelessWidget {
  final ElementoQuimico elemento;
  const PeriodicTableItem({
    Key? key,
    required this.elemento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: ColorsUtils.getColorFromString(elemento.cpkHexColor),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '${elemento.atomicNumber}',
                style: theme.textTheme.subtitle1,
                textAlign: TextAlign.left,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  elemento.symbol,
                  style: theme.textTheme.headline4,
                ),
                SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    elemento.name.toUpperCase(),
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    elemento.atomicMass,
                    style: theme.textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
