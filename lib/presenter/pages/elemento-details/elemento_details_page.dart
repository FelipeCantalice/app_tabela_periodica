import 'package:app_tabela_periodica/presenter/widgets/details_description.dart';
import 'package:app_tabela_periodica/presenter/widgets/eletronic_distribution.dart';
import 'package:flutter/material.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';

class ElementoQuimicDetails extends StatefulWidget {
  final ElementoQuimico elemento;
  const ElementoQuimicDetails({
    Key? key,
    required this.elemento,
  }) : super(key: key);

  @override
  _ElementoQuimicDetailsState createState() => _ElementoQuimicDetailsState();
}

class _ElementoQuimicDetailsState extends State<ElementoQuimicDetails> {
  @override
  Widget build(BuildContext context) {
    final element = widget.elemento;
    final theme = Theme.of(context);

    Widget _itemSpace() {
      return Container(height: 80, child: VerticalDivider(color: Colors.blue));
    }

    Widget _header() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            color: Colors.blue,
            child: Text(
              element.symbol ?? ' ',
              style: theme.textTheme.headline3,
            ),
          ),
          const SizedBox(width: 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element.name ?? ' ',
                style: theme.textTheme.headline5,
              ),
              Text(
                element.name != null
                    ? 'Discovered by ${element.name}'
                    : 'Não identificado',
                style: theme.textTheme.subtitle1,
              ),
              Text(
                element.appearance != null
                    ? 'Appearance,  ${element.appearance}'
                    : 'Não identificado',
                style: theme.textTheme.subtitle2,
              ),
            ],
          ),
        ],
      );
    }

    Widget _characteriscts() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Characteristics', style: theme.textTheme.headline5),
          const SizedBox(height: 20),
          Container(
            width: double.maxFinite,
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    DetailsDescription(
                      title: "Atomic mass",
                      description: element.atomicMass.toString(),
                    ),

                    _itemSpace(),
                    DetailsDescription(
                      title: "Category",
                      description: element.category,
                    ),
                    _itemSpace(),
                    DetailsDescription(
                      title: "Number",
                      description: element.number.toString(),
                    ),

                    _itemSpace(),
                    DetailsDescription(
                      title: "Periodic",
                      description: element.period.toString(),
                    ),
                    _itemSpace(),
                    // DetailsDescription(
                    //   title:"Phase",
                    //   description:,
                    // ),
                    // _itemSpace(),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget _configurations() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Configurations', style: theme.textTheme.headline5),
          const SizedBox(height: 20),
          Container(
            width: double.maxFinite,
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    DetailsDescription(
                      title: "Density",
                      description: element.density.toString(),
                    ),
                    _itemSpace(),
                    DetailsDescription(
                      title: "Affinity",
                      description: element.electronAffinity.toString(),
                    ),
                    _itemSpace(),
                    DetailsDescription(
                      title: "Melt",
                      description: element.melt.toString(),
                    ),
                    _itemSpace(),
                    DetailsDescription(
                      title: "Periodic",
                      description: element.period.toString(),
                    ),
                    _itemSpace(),
                    DetailsDescription(
                      title: "Molar melt",
                      description: element.molarHeat.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget _graphics() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Visualizations', style: theme.textTheme.headline5),
          const SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EletronicDistribution(
                    distribution: element.electronConfiguration ?? '',
                  ),
                  // Text('Eletronic distribution'),
                  // Text(
                  //   element.electronConfiguration ?? '',
                  // ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _header(),
                      const SizedBox(height: 15),
                      Text(
                        element.summary ?? '',
                        style: theme.textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 45),
              _characteriscts(),
              const SizedBox(height: 45),
              _configurations(),
              const SizedBox(height: 45),
              _graphics(),
            ],
          ),
        ),
      ),
    );
  }
}
