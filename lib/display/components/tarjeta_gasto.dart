import 'package:flutter/material.dart';
import 'package:gastos_personales_app/data/models/gasto_personal.dart';

class TarjetaGasto extends StatelessWidget {
  const TarjetaGasto({
    super.key,
    required this.gastoPersonal,
  });

  final GastoPersonal gastoPersonal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(gastoPersonal.descripcion),
        subtitle: Text(gastoPersonal.fecha),
        leading: ElevatedButton(
          onPressed: () {},
          child: Text(gastoPersonal.precio),
        ),
      ),
    );
  }
}
