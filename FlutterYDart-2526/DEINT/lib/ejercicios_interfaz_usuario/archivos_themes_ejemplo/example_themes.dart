import 'package:flutter/material.dart';

class ExampleThemes extends StatelessWidget {
  const ExampleThemes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      backgroundColor: Colors.red[100],
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/first'),
            child: Text('FIRST')),
      ),
    );
  }
}

class ScreenFirst extends StatelessWidget {
  const ScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIRST'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/second'),
          child: Text('SECOND', style: Theme.of(context).textTheme.headlineLarge,),
        ),
      ),
    );
  }
}

class ScreenSecond extends StatelessWidget {
  const ScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SECOND'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              headlineLarge: TextStyle(color: Colors.green,),
            ),),
        child: Center(
          child: Builder(
            builder: (context) {
              return TextButton(
                //Se envia como parámetro el contexto actual para hacer una prueba
                onPressed: () => Navigator.pushNamed(context, '/third', arguments: context),
                child: Text('Third', style: Theme.of(context).textTheme.headlineLarge,)
              );
            }
          ),
        ),
      ),
    );
  }
}

class ScreenThird extends StatelessWidget {
  const ScreenThird({super.key});

  @override
  Widget build(BuildContext context) {
    //Recibimos a modo de prueba, es algo que no se suele hacer, para ver los contextos.
    BuildContext previousContext = ModalRoute.of(context)?.settings.arguments as BuildContext;

    return Scaffold(
      appBar: AppBar(
        title: Text('THIRD'),
      ),
      body: Center(
        child: TextButton(

          onPressed: () => Navigator.pushNamed(context, '/second'),
          child: Text('BACK', style: Theme.of(previousContext).textTheme.headlineLarge,),
        ),
      ),
    );
  }
}