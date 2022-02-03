import 'package:flutter/material.dart';

class CustomSearhDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) { //Método Chamado para quando apertar btão pesquisa Esquerdo
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return
      IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {


    List<String> lista = [];

    if(query.isNotEmpty){
      lista = ["nova vida", "mobile", "teste"].where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
      return ListView.builder(itemBuilder: (context,index) {
        return ListTile(
          onTap: (){
            close(context, lista[index]);
          },
          title: Text(lista[index]),
        );
      },itemCount: lista.length,);
    } else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }


  }
}
