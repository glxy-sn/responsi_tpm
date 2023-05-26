import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/detail_matches_model.dart';
import 'package:responsi/matches_model.dart';
import 'package:responsi/matches_model.dart';

class DetailPertandingan extends StatefulWidget {
  final MatchesModel match;
  const DetailPertandingan({Key? key, required this.match}) : super(key: key);

  @override
  State<DetailPertandingan> createState() => _DetailPertandinganState();
}

class _DetailPertandinganState extends State<DetailPertandingan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.match.id!),
      ),
      body: _buildDetail(),
    ));
  }
}

Widget _buildDetail(){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadDetail(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        if(snapshot.hasError){
          return _buildErrorSection();
        }
        if(snapshot.hasData){
          DetailMatchesModel detailModel = DetailMatchesModel.fromJson(snapshot.data);
          return _buildSuccessSection(context, detailModel);
        }
        return _buildLoadingSection();
      },
    ),
  );
}
Widget _buildErrorSection(){
  return Container(
    child: Text('Error Occured'),
  );
}

Widget _buildLoadingSection() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
      ],
    ),
  );
}
Widget _buildSuccessSection(BuildContext context, DetailMatchesModel data) {
return Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text('${data.awayTeam!.name}',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    ],
  ),
  );
}
