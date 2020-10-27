import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class TestBlocUI extends StatefulWidget {
  @override
  _TestBlocUIState createState() => _TestBlocUIState();
}

class _TestBlocUIState extends State<TestBlocUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Bloc'),
        actions: [
          NombreAdd(), NombreRemove()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NombreInfo(),
            SizedBox(height: 20.0),
            NombreInfo(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NombreAdd(),
          SizedBox(height: 10.0),
          NombreRemove()
        ],
      ),
    );
  }
}

class NombreInfo extends StatelessWidget {

  const NombreInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, ValueState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre', style: TextStyle(fontSize: 30.0)),
            SizedBox(height: 20),
            Text('${state.value}', style: TextStyle(fontSize: 30.0)),
          ],
        );
      }
    );
  }
}

class NombreAdd extends StatelessWidget {

  const NombreAdd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => context.bloc<TestBloc>().increment(),
    );
  }
}

class NombreRemove extends StatelessWidget {

  const NombreRemove({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () => context.bloc<TestBloc>().decrement(),
    );
  }
}
