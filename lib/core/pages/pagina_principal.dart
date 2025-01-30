import 'package:flutter/material.dart';
import 'package:gastos_personales_app/core/pages/llenar_datos.dart';
import 'package:gastos_personales_app/models/gasto_personal.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
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
                    return LlenarDatos();
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

  SingleChildScrollView listadoGastosPersonales() {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
