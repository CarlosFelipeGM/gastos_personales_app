import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gastos_personales_app/display/components/input_custom.dart';
import 'package:gastos_personales_app/data/models/gasto_personal.dart';
import 'package:uuid/uuid.dart';

class LlenarDatos extends StatefulWidget {
  const LlenarDatos({
    super.key,
    required this.alAgregar,
    required this.gastosPersonales,
  });

  final List<GastoPersonal> gastosPersonales;
  final void Function(GastoPersonal) alAgregar;

  @override
  State<LlenarDatos> createState() => _LlenarDatosState();
}

class _LlenarDatosState extends State<LlenarDatos> {
  final _idForm = GlobalKey<FormState>();
  final _fechaController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();
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
              InputCustom(
                label: 'Fecha',
                controller: _fechaController,
                validator: (valor) =>
                    RequiredValidator(errorText: 'La fecha es requerida')
                        .call(valor),
              ),
              // descripcion
              InputCustom(
                label: 'Descripcion',
                controller: _descripcionController,
                validator: (valor) =>
                    RequiredValidator(errorText: 'La descripcion es requerida')
                        .call(valor),
              ),
              // monto
              InputCustom(
                label: 'Precio',
                controller: _precioController,
                keyboardType: TextInputType.number,
                validator: (valor) =>
                    RequiredValidator(errorText: 'El precio es requerido')
                        .call(valor),
              ),
              // boton
              ElevatedButton.icon(
                onPressed: () {
                  _agregarGasto();
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

  void _agregarGasto() {
    final esValido = _idForm.currentState?.validate() ?? false;
    if (esValido) {
      final id = Uuid().v1();
      final descripcion = _descripcionController.text;
      final fecha = _fechaController.text;
      final precio = _precioController.text;
      final gastoPersonal = GastoPersonal(
        id: id,
        descripcion: descripcion,
        fecha: fecha,
        precio: precio,
      );

      widget.alAgregar(gastoPersonal);

      _fechaController.clear();
      _descripcionController.clear();
      _precioController.clear();
    }
  }

  @override
  void dispose() {
    _fechaController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }
}
