import 'package:flutter/material.dart';

class CarregandoWidget extends StatelessWidget {
  final String mensagem;

  CarregandoWidget({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            this.mensagem,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
