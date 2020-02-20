import 'package:flutter/material.dart';

/*A clase Search Delegate, obriga a passar alguns métodos para
* fazer as customizações
* Cada um dos métodos é responsavél por construir determinada estrutura
* da pesquisa
* OBS: os retornos dos métodos não podem estar nulos*/

class CustomSearchDelegate extends SearchDelegate<String>{

  /*Definição das ações que o usuário pode utilizar*/
  @override
  List<Widget> buildActions(BuildContext context) {

    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          /*com query é possivel pegar o atributo que captura oq está
          * sendo digitado*/

          query = "";

        },
      ),

    ];
  }

  /*Define o botão de voltar */
  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        /*quando fechamos uma tela podemos passar parâmetros
        * o showSearch vai abri uma nova tela por cima da home
        * e a partir do showSearch é possivél captruar um valor que é passado aqui*/
        close(context, "");
      },
    );
  }

  /*Constrói os resultados do que foi pesquisado*/
  @override
  Widget buildResults(BuildContext context) {

    close(context, query);
    return Container();
  }
  /*Define sugestões de pesquisa*/
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();

    //maneira de ir fazendo sugestões, quando o usuario estiver digitando a pesquisa
    /*
   List<String> lista = List();

   if(query.isNotEmpty){

     lista = [
       "Android", "IOS", "Android navegação"
     ].where(
             (texto)=> texto.toLowerCase().startsWith(query)
     ).toList();
     return ListView.builder(
       itemCount: lista.length,
       itemBuilder: (contex, index){
         return ListTile(
           onTap: (){
            close(context, lista[index]);
           },
           title: Text(lista[index]),
         );
       },

     );

   } else{
     return Center(
       child: Text("Nenhum resultado para a pesquisa"),
     );
   }

  }

     */
  }
}