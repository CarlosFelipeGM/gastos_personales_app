import 'package:flutter/material.dart';
import 'package:gastos_personales_app/models/gasto_personal.dart';

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
        subtitle: Text(gastoPersonal.precio),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
