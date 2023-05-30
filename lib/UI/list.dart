import 'package:flutter/material.dart';
import 'package:responsi/UI/detail.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/matches_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:provider/provider.dart';

class ListPertandingan extends StatefulWidget {
  const ListPertandingan({Key? key}) : super(key: key);

  @override
  State<ListPertandingan> createState() => _ListPertandinganState();
}

class _ListPertandinganState extends State<ListPertandingan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Piala Dunia 2022'),
            backgroundColor: Color.fromRGBO(38, 58, 41, 1),
            foregroundColor: Colors.white,
          ),
          body: _buildListPertandingan(),
        )
    );
  }
}

Widget _buildListPertandingan() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadPertandingan(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildError();
        }
        if (snapshot.hasData) {
          List<dynamic> matchesData = snapshot.data as List<dynamic>;
          return ListView.builder(
            itemCount: matchesData.length,
            itemBuilder: (context, index) {
              MatchesModel listMatches = MatchesModel.fromJson(matchesData[index]);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPertandingan(id: listMatches.id!),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 120,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width: 60,
                                  child: Image.network("https://flagcdn.com/256x192/" + listMatches.homeTeam!.country!.substring(0, 2).toLowerCase() + ".png"),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${listMatches.homeTeam!.name}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${listMatches.homeTeam!.goals}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width: 60,
                                  child: Image.network("https://flagcdn.com/256x192/" + listMatches.awayTeam!.country!.substring(0, 2).toLowerCase() + ".png"),
                                ),
                              ),
                                Center(
                                  child: Text(
                                    '${listMatches.awayTeam!.name}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              Center(
                                child: Text(
                                  '${listMatches.awayTeam!.goals}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return _buildLoad();
      },
    ),
  );
}

Widget _buildError(){
  return Container(
    child: Text('Error Occured'),
  );
}
Widget _buildLoad(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
      ],
    ),
  );
}

