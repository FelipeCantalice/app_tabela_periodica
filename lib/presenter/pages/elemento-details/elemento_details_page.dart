import 'package:app_tabela_periodica/presenter/widgets/details_description.dart';
import 'package:app_tabela_periodica/presenter/widgets/details_graphic.dart';
import 'package:app_tabela_periodica/presenter/widgets/element_shells.dart';
import 'package:app_tabela_periodica/presenter/widgets/eletronic_distribution.dart';
import 'package:app_tabela_periodica/presenter/widgets/section_container.dart';
import 'package:flutter/material.dart';
import 'package:app_tabela_periodica/domain/entities/elemento_quimico.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

    final Widget _eletronicDistribution = EletronicDistribution(
        distribution: element.electronConfiguration ?? '');

    final Widget _elementShells = ElementSheels(
      shells: element.shells,
    );

    void _showModal(Widget widget) {
      final mediaQuery = MediaQuery.of(context);
      showMaterialModalBottomSheet(
        context: context,
        builder: (context) => Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height - 100,
          alignment: Alignment.center,
          child: widget,
        ),
      );
    }

    Widget _itemSpace() {
      return Container(width: 20);
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
      return SectionContainer(
        title: 'Characteristics',
        children: [
          DetailsDescription(
            icon: Icons.bloodtype,
            title: "Atomic mass",
            description: element.atomicMass.toString(),
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.category,
            title: "Category",
            description: element.category,
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.grid_on,
            title: "Number",
            description: element.number.toString(),
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.grid_view_rounded,
            title: "Periodic",
            description: element.period.toString(),
          ),
        ],
      );
    }

    Widget _configurations() {
      return SectionContainer(
        title: 'Configurations',
        children: [
          DetailsDescription(
            icon: Icons.group_work,
            title: "Density",
            description: element.density.toString(),
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.hdr_auto,
            title: "Affinity",
            description: element.electronAffinity.toString(),
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.handyman,
            title: "Melt",
            description: element.melt.toString(),
          ),
          _itemSpace(),
          DetailsDescription(
            icon: Icons.h_plus_mobiledata,
            title: "Molar melt",
            description: element.molarHeat.toString(),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailsGraphic(
                title: 'Eletronic distribution',
                child: _eletronicDistribution,
                onTap: () {
                  _showModal(_eletronicDistribution);
                },
              ),
              _itemSpace(),
              DetailsGraphic(
                title: 'Eletronic configuration',
                child: _elementShells,
                onTap: () {
                  _showModal(_elementShells);
                },
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
              const SizedBox(height: 55),
              _characteriscts(),
              const SizedBox(height: 55),
              _configurations(),
              const SizedBox(height: 55),
              _graphics(),
            ],
          ),
        ),
      ),
    );
  }
}
