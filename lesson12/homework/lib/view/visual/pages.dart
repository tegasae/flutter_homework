import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_generate/random_generate.dart';

import '../../bloc/generate_bloc.dart';

class NameGenerator extends StatelessWidget {
  const NameGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(
      buildWhen: (previous, current) =>
          current.runtimeType == GenerateStateStart,
      builder: (context, state) {
        return Text(Provider.simple().services.currentService().name,
            style: Theme.of(context).textTheme.subtitle1);
      },
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconsRun = Icons.play_arrow;

    return BlocBuilder<GenerateBloc, GenerateState>(
        buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
        builder: (context, state) {
          if (state is GenerateStateStart) {
            iconsRun = Icons.play_arrow;
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: IconButton(
                    iconSize: 70,
                    onPressed: () {
                      if (state is GenerateStateStart) {
                        iconsRun = Icons.pause;
                        context
                            .read<GenerateBloc>()
                            .add(GeneratePlaying(value: state.value));
                        return;
                      }
                      if (state is GenerateStatePlay) {
                        iconsRun = Icons.play_arrow;
                        context
                            .read<GenerateBloc>()
                            .add(const GeneratePausing());
                        return;
                      }
                      if (state is GenerateStatePause) {
                        iconsRun = Icons.pause;
                        context
                            .read<GenerateBloc>()
                            .add(GeneratePlaying(value: state.value));
                      }
                    },
                    icon: Icon(iconsRun)),
              ),
              Container(
                alignment: Alignment.topCenter,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: IconButton(
                    iconSize: 70,
                    onPressed: state is GenerateStateStart
                        ? null
                        : () {
                            context
                                .read<GenerateBloc>()
                                .add(const GenerateStopping());
                          },
                    icon: const Icon(Icons.stop)),
              ),
            ],
          );
        });
  }
}

class RandomView extends StatelessWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.select((GenerateBloc bloc) => bloc.state);
    //getValue(state);

    final value = state.value.value.toString();
    return Text(value, style: Theme.of(context).textTheme.headline1);
  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('123456789');
    return const Text('123');
  }
}
