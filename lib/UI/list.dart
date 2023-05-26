import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:responsi/UI/detail.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/matches_model.dart';


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
          ),
          body: _buildListPertandingan(),
        )
    );
  }
}
Widget _buildListPertandingan(){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadPertandingan(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        if(snapshot.hasError){
          return _buildError();
        }
        if(snapshot.hasData){
          // ListPertandingan listPertandingan = ListPertandingan.fromJson(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                MatchesModel listMatches = MatchesModel.fromJson(snapshot.data![index]);
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPertandingan(match: listMatches,))
                    );
                  },
                  child: Card(
                      child: Row(
                        children: [
                          // Container(
                          //   child: Text(
                          //     homeTeam.name!.toString(),
                          //   ),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${listMatches.homeTeam!.name}'),
                              Text('${listMatches.homeTeam!.goals}'),
                              SizedBox(height: 10),
                              Text('-'),
                              SizedBox(height: 10),
                              Text('${listMatches.awayTeam!.name}'),
                              Text('${listMatches.awayTeam!.goals}'),
                            ],
                          ),

                        ],
                      ),
                  ),
                );
              }
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

