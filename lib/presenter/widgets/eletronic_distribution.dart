import 'package:flutter/material.dart';

class EletronicDistribution extends StatelessWidget {
  final String distribution;
  EletronicDistribution({
    Key? key,
    required this.distribution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var splited = distribution.split(' ');
    Map<String, String> _contains = {};
    var table = [
      ['1s', ' ', ' ', ' '],
      ['2s', '2p', ' ', ' '],
      ['3s', '3p', '3d', ' '],
      ['4s', '4p', '4d', '4f'],
      ['5s', '5p', '5d', '5f'],
      ['6s', '6p', '6d', ' '],
      ['7s', ' ', ' ', ' '],
    ];

    Widget _rows() {
      for (var element in splited) {
        int? index = int.tryParse(element.substring(0, 1));
        String id = element.substring(0, 2);
        if (index is int) {
          final exists = table[index - 1].contains(id);

          if (exists) _contains[id] = element;
        }
      }

      Text verify(String hash) {
        final exists = _contains.containsKey(hash);

        final texto = '${exists ? _contains[hash]! : hash}';
        int space = 4 - texto.length;
        return Text(
          "$texto" + " " * space,
          textAlign: TextAlign.start,
          style: theme.textTheme.bodyText1?.copyWith(
            fontSize: 16,
            color: exists ? Colors.black : Colors.grey[300],
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < table.length; i++) ...{
            Row(
              children: [
                for (int j = 0; j < table[i].length; j++) ...{
                  Container(
                    width: 50,
                    child: verify(table[i][j]),
                  ),
                }
              ],
            ),
          }
        ],
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rows(),
        ],
      ),
    );
  }
}
