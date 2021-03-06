import 'package:flutter/material.dart';
import 'package:homework/common/get_data.dart';
import 'package:homework/main.dart';

import 'dart:convert';

import 'package:homework/models/hotel_json.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //int crossAxisCount=1;
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    //int count=1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    counterNotifier.value = 1;
                  },
                  icon: const Icon(Icons.list)),
              IconButton(
                  onPressed: () {
                    counterNotifier.value = 2;
                  },
                  icon: const Icon(Icons.grid_view_sharp)),
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: InheritedDataProvider<ValueNotifier<int>>(
                child: const SingleChildScrollView(child: ListHotels()),
                data: counterNotifier),
          )),
    );
  }
}

class ListHotels extends StatefulWidget {
  const ListHotels({Key? key}) : super(key: key);

  @override
  _ListHotelsState createState() => _ListHotelsState();
}

class _ListHotelsState extends State<ListHotels> {
  late Future<List<Hotel>> hotels;
  FetchHttp fetchHttp =
      FetchHttp('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

  @override
  void initState() {
    super.initState();

    hotels = fetchHttp.get((String responseBody) =>
        (json.decode(responseBody) as List)
            .map((i) => Hotel.fromJson(i))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hotel>>(
      future: hotels,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return Text(snapshot.data!.toString());
          return Hotels(listHotels: snapshot.data!);
        } else if (snapshot.hasError) {
          //return Text('${snapshot.error}');
          return const Text('???????????????????? ?????????????????? ????????????');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class Hotels extends StatelessWidget {
  final List<Hotel> listHotels;

  const Hotels({Key? key, required this.listHotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final int crossAxisCount=InheritedDataProvider.of<int>(context)?.data;
    final ValueNotifier<int> countValueNotifier =
        InheritedDataProvider.of<ValueNotifier<int>>(context)?.data;

    //print(countValueNotifier.value);

    final _scrollController = ScrollController();

    return ValueListenableBuilder<int>(
        valueListenable: countValueNotifier,
        builder: (context, value, child) {
          //int countColumns = countValueNotifier.value;
          double aspectRatio = 1.0;
          double height = MediaQuery.of(context).size.height;
          //double width = MediaQuery.of(context).size.width;

          double heightImage = height / 7;
          double heightButton = height / 21;
          //print('height: ' + height.toString());
          //print('width: ' + width.toString());

          if (value == 1) {
            //print('value');
            aspectRatio = 1.5;
            heightImage = height / 5;
            heightButton = height / 19;
          }
          //print(heightImage);

          Widget text = const Text('??????????????????',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold));

          return GridView.count(
              crossAxisCount: value,
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              childAspectRatio: aspectRatio,
              //physics: AlwaysScrollableScrollPhysics(),

              children: [
                for (var hotel in listHotels)
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, routeHotel.routeName,
                            arguments: [hotel.uuid, hotel.name]);
                      },
                      //    //Image.asset('assets/images/' + listHotels[index].poster,height: 100)
                      child: Card(
                          semanticContainer: true,
                          elevation: 15,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Ink.image(
                                  image: AssetImage(
                                      'assets/images/' + hotel.poster),
                                  height: heightImage,
                                  fit: BoxFit.cover,
                                ),
                                if (value == 2) ...[
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        padding:
                                            const EdgeInsetsDirectional.all(10),
                                        child: Text(hotel.name)),
                                  )),
                                  Container(
                                      height: heightButton,
                                      color: Colors.blue,
                                      child: text,
                                      alignment: Alignment.center)
                                ] else
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            padding:
                                                const EdgeInsetsDirectional.all(
                                                    10),
                                            child: Text(hotel.name)),
                                      )),
                                      Container(
                                        child: text,
                                        padding:
                                            const EdgeInsetsDirectional.all(15),
                                        color: Colors.blue,
                                        margin:
                                            const EdgeInsetsDirectional.all(10),
                                      )
                                    ],
                                  ),
                              ])))
              ]);
        });
  }
}

class InheritedDataProvider<T> extends InheritedWidget {
  final T data;

  const InheritedDataProvider({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) =>
      data != oldWidget.data;

  static InheritedDataProvider? of<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataProvider<T>>();
  }
}
