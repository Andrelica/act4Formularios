import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _claveformulario1 = GlobalKey<FormState>();
  final _claveformulario2 = GlobalKey<FormState>();
  final _claveformulario3 = GlobalKey<FormState>();
  final _claveformulario4 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos enviados'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Declaramos la variable telefono para que al llenar el campo no valide los dijitos diferentes a 10
  bool telefono(String value) {
    if (value.length != 10) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  bool cp(String value) {
    if (value.length != 5) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  bool stock(String value) {
    if (value.length >= 2) {
      return true;
    } else if (value.length <= -1) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camiones Volvo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(icon: Icon(Icons.account_circle)),
              Tab(icon: Icon(Icons.account_box)),
              Tab(icon: Icon(Icons.shopping_bag_outlined)),
              Tab(icon: Icon(Icons.supervised_user_circle)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Form(
                  key: _claveformulario1,
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Usuario - Iniciar Sesion',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Usuario',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Crea tu ID_Usuario ingresando tu curp';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu nombre';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Apellidos',
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tus apellidos.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Direccion',
                          suffixIcon: Icon(Icons.room),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa Tu direccion.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Número de teléfono',
                          suffixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresa tu número de teléfono';
                          }
                          if (!telefono(value)) {
                            return 'Ingresa un número válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          suffixIcon: Icon(Icons.mail),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un correo electrónico';
                          }
                          if (!value.contains('@')) {
                            return 'Ingresa un correo electrónico válido de Gmail';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          suffixIcon: Icon(Icons.password),
                        ),
                        obscureText: true, // Oculta el texto de la contraseña
                        keyboardType: TextInputType
                            .visiblePassword, // Establece el tipo de teclado adecuado para contraseñas
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa una contraseña';
                          }
                          return null;
                        },
                      ),
                      // Resto de los TextFormField
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          child: const Text('Enviar'),
                          onPressed: () {
                            if (_claveformulario1.currentState!.validate()) {
                              _showAlert(
                                context,
                                'Cuenta de Usuario registrada exitosamente (1)',
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //Formulario 2
                Form(
                  key: _claveformulario2,
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Registro Empleado',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Usuario',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tu nombre';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre(s)',
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tu nombre';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Apellidos',
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tus apellidos.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Fecha de ingreso',
                            suffixIcon: Icon(Icons.date_range),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Escribe correctamente la fecha';
                            }
                            // Verificar el formato de la fecha (XX/XX/XXXX)
                            const pattern = r'^\d{2}/\d{2}/\d{4}$';
                            final regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Ingresa una fecha válida en formato DD/MM/YYYY';
                            }
                            // Verificar la validez de la fecha
                            final dateParts = value.split('/');
                            final day = int.tryParse(dateParts[0]);
                            final month = int.tryParse(dateParts[1]);
                            final year = int.tryParse(dateParts[2]);
                            if (day == null || month == null || year == null) {
                              return 'Ingresa una fecha válida';
                            }
                            if (day < 1 ||
                                day > 31 ||
                                month < 1 ||
                                month > 12) {
                              return 'Ingresa una fecha válida';
                            }
                            return null;
                          }),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Puesto de Trabajo',
                          suffixIcon: Icon(Icons.work),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe correctamente el puesto en el que estas.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Número de teléfono',
                          suffixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresa tu número de teléfono';
                          }
                          if (!telefono(value)) {
                            return 'Ingresa un número válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          suffixIcon: Icon(Icons.mail),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un correo electrónico';
                          }
                          if (!value.contains('@')) {
                            return 'Ingresa un correo electrónico válido de Gmail';
                          }
                          return null;
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                      ),
                      // Resto de los TextFormField
                      ElevatedButton(
                        child: const Text('Enviar'),
                        onPressed: () {
                          if (_claveformulario2.currentState!.validate()) {
                            _showAlert(
                              context,
                              'Listo',
                            );
                            _showAlert(
                              context,
                              'Registro de empleado enviado correctamente (2)',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),

                //Formulario 3
                Form(
                  key: _claveformulario3,
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Registro de Ventas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Venta',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe el ID_Venta asignado';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Stock (Cantidad)',
                          suffixIcon: Icon(Icons.add),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Escribe la cantidad de producto(s)';
                          }
                          if (!stock(value)) {
                            return 'Ingresa un número válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Usuario',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tu ID_Usuario ';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Empleado',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe el ID_Empleado que te asignaron';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Precio',
                          suffixIcon: Icon(Icons.attach_money),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el precio';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Departamento',
                          suffixIcon: Icon(Icons.store),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el nombre del departamento';
                          }
                          return null;
                        },
                      ),

                      Container(
                        margin: const EdgeInsets.all(15),
                      ),

                      // Resto de los TextFormField
                      ElevatedButton(
                        child: const Text('Enviar'),
                        onPressed: () {
                          if (_claveformulario3.currentState!.validate()) {
                            _showAlert(
                              context,
                              'Listo',
                            );
                            _showAlert(
                              context,
                              'Formulario "Añadir Productos" enviado correctamente (3)',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),

                //Fomrulario 4
                Form(
                  key: _claveformulario4,
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Container(
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Servicio a Cliente',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Queja',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el ID';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Reporte',
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe la fecha de hoy';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'ID_Usuario',
                          suffixIcon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Escribe tu ID_Usuario';
                          }
                          if (!cp(value)) {
                            return 'Ingresa un número válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre(s)',
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tu nombre';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Número de teléfono',
                          suffixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresa tu número de teléfono';
                          }
                          if (!telefono(value)) {
                            return 'Ingresa un número válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          suffixIcon: Icon(Icons.mail),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un correo electrónico';
                          }
                          if (!value.contains('@')) {
                            return 'Ingresa un correo electrónico válido de Gmail';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Mensaje',
                          suffixIcon: Icon(Icons.message),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Escribe tu nombre';
                          }
                          return null;
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                      ),

                      // Resto de los TextFormField
                      ElevatedButton(
                        child: const Text('Enviar'),
                        onPressed: () {
                          if (_claveformulario4.currentState!.validate()) {
                            _showAlert(
                              context,
                              'Listo',
                            );
                            _showAlert(
                              context,
                              'Tu reporte ha sido enviado correctamente (4)',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
