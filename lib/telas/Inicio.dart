import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/model/Video.dart';

import '../API.dart';

class TelaInicio extends StatefulWidget {
  String pesquisa;

  TelaInicio(this.pesquisa);

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Chamado 1 - Chamado uma Unica vez");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Chamado 2 - Construir A interface com dependencias (Carregar dados da listagem)");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3");
    return FutureBuilder<List<Video>>(
      builder: (context, snapchot) {
        switch (snapchot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapchot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapchot.data;
                  Video video = videos![index];
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(height: 2, color: Colors.red),
                itemCount: snapchot.data!.length,
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser Exibido!"),
              );
            }
            break;
        }
      },
      future: _listarVideos(widget.pesquisa),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Chamado 4- Descarte de itens");
  }

  @override
  void didUpdateWidget(covariant TelaInicio oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 - Update");
  }
}
