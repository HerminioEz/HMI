import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VinylCustomizationScreen(),
    );
  }
}

class VinylCustomizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personalizar Disco de Vinilo'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.image), text: 'Cargar Imagen'),
              Tab(icon: Icon(Icons.edit), text: 'Editar Diseño'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Primera pestaña: Cargar Imagen
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/R.jpg'),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para cargar una nueva imagen
                    },
                    child: Text('Cargar Nueva Imagen'),
                  ),
                ],
              ),
            ),
            // Segunda pestaña: Editar Diseño
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Herramientas de Edición'),
                  // Aquí puedes agregar widgets para editar el diseño del vinilo
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}