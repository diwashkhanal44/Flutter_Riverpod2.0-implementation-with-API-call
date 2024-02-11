import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/provider/data_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataa = ref.watch(dataProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("RiverPod Practice")),
        body: dataa.when(
          data: (dataa) => ListView.builder(
            itemCount: dataa.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("id = ${dataa[index].id.toString()}"),
                    const Spacer(),
                    Text("firstname = ${dataa[index].firstname.toString()}"),
                    const Spacer(),
                    Text("lastname = ${dataa[index].lastname.toString()}"),
                    const Spacer(),
                    Text("email = ${dataa[index].email.toString()}"),
                    const Spacer(),
                    Image.network(dataa[index].avatar),
                  ],
                ),
              );
            },
          ),
          error: (e, s) => Center(child: Text(e.toString())),
          loading: () {
            return (const Center(
              child: CircularProgressIndicator(),
            ));
          },
        ));
  }
}
