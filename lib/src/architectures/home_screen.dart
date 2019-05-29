import 'package:flutter/material.dart';
import 'package:flutter_architecture_comparison/src/core/services/repository.dart';
import 'package:flutter_architecture_comparison/src/architectures/bloc/posts_bloc_screen.dart';
import 'package:flutter_architecture_comparison/src/architectures/scoped_model/views/post_view.dart';
import 'package:flutter_architecture_comparison/src/architectures/vanilla/vanilla_view.dart';
import 'package:flutter_architecture_comparison/src/architectures/provider/views/posts_provider_view.dart';

class HomeScreen extends StatelessWidget {
  final Repository _repository;
  HomeScreen(this._repository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
            title: Text('Flutter Architecture Comparison',
                style: TextStyle(color: Colors.black87)),
            backgroundColor: Colors.tealAccent),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.black87,
                  color: Colors.redAccent,
                  onPressed: () => openVanilla(context),
                  child: Text('Vanilla'),
                ),
                RaisedButton(
                  textColor: Colors.black87,
                  color: Colors.amberAccent,
                  child: Text('Scoped Model'),
                  onPressed: () => openScopedModel(context),
                ),
                RaisedButton(
                    textColor: Colors.black87,
                    color: Colors.lightBlueAccent,
                    child: Text('BLoC'),
                    onPressed: () => openBloc(context)),
                RaisedButton(
                    textColor: Colors.black87,
                    color: Colors.tealAccent,
                    child: Text('Provider'),
                    onPressed: () => openProvider(context))
              ],
            )));
  }

  void openVanilla(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VanillaScreen(_repository)));
  }

  void openScopedModel(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostsScopedView()));
  }

  void openBloc(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostsBlocScreen()));
  }

  void openProvider(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostsProviderView()));
  }
}
