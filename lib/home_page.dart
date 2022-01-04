import 'package:e47en/cubit/cubit.dart';
import 'package:e47en/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('تدفع', style: TextStyle(fontSize: 30.0)),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: 250.0,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                        controller: cubit.felosController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          cubit.calculateRased(value);
                          debugPrint(rased.toString());
                        },
                        decoration: const InputDecoration(
                          hintText: 'كام جنيه',
                          prefixIcon: Icon(
                            Icons.money,
                            size: 35.0,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    const Text('تشحن', style: TextStyle(fontSize: 30.0)),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: 250.0,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                        controller: cubit.rasedController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          cubit.calculateFelos(value);
                          debugPrint(felos.toString());
                        },
                        decoration: const InputDecoration(
                          hintText: 'رصيد فعلي',
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 35.0,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
