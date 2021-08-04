import 'package:app_tabela_periodica/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';

import 'text_shadow.dart';

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
          color: ColorsUtils.getColorFromString(elemento.cpkHex ?? 'fad96e'),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  children: [
                    for (var i in elemento.shells!) ...{
                      TextShadow(
                        text: i.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        styleShadow: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black,
                        ),
                      ),
                    }
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextShadow(
                        text: elemento.symbol ?? ' ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        styleShadow: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        child: TextShadow(
                          text: elemento.name?.toUpperCase() ?? 'Desconhecido',
                          style: theme.textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.4,
                            color: Colors.white,
                          ),
                          styleShadow: theme.textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.4,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        child: TextShadow(
                          text: "${elemento.atomicMass}",
                          style: theme.textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          styleShadow: theme.textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.5
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
