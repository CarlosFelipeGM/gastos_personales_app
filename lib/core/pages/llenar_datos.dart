import 'package:flutter/material.dart';
import 'package:gastos_personales_app/core/components/input_custom.dart';

class LlenarDatos extends StatefulWidget {
  const LlenarDatos({super.key});

  @override
  State<LlenarDatos> createState() => _LlenarDatosState();
}

class _LlenarDatosState extends State<LlenarDatos> {
  final _idForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _idForm,
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // fecha
              // descripcion
              InputCustom(
                label: 'Descripcion',
              ),
              // monto
              // boton
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.add),
                label: Text('Agregar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
