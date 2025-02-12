import 'package:flutter/material.dart';
import 'package:gastos_personales_app/display/components/tarjeta_gasto.dart';
import 'package:gastos_personales_app/display/pages/llenar_datos.dart';
import 'package:gastos_personales_app/data/models/gasto_personal.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({
    super.key,
  });

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal>
    with SingleTickerProviderStateMixin {
  final gastosPersonales = <GastoPersonal>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Gastos Personales'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return LlenarDatos(
                      alAgregar: (gastoPersonal) {
                        setState(() {
                          gastosPersonales.add(gastoPersonal);
                        });
                      },
                      gastosPersonales: gastosPersonales,
                    );
                  },
                );
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: gastosPersonales.isNotEmpty
          ? listadoGastosPersonales()
          : listaVacia(),
    );
  }

  Center listaVacia() {
    return Center(
      child: Image.asset(
        'assets/images/hoja_lapiz.png',
        height: 250,
      ),
    );
  }

  ListView listadoGastosPersonales() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      children: gastosPersonales.map((gastoPersonal) {
        return Slidable(
          key: ValueKey(gastoPersonal.id),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  setState(() {
                    gastosPersonales.removeWhere(
                        (elemento) => elemento.id == gastoPersonal.id);
                  });
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Borrar',
              ),
            ],
          ),
          child: TarjetaGasto(gastoPersonal: gastoPersonal),
        );
      }).toList(),
    );
  }
}
