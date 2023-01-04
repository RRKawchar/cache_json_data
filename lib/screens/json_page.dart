import 'package:cache_json_data/provider/json_provider.dart';
import 'package:cache_json_data/screens/details_page.dart';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        title:const Text("Flutter json App"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        key: _refreshIndicatorKey,
        onRefresh: (){
          setState(() {

          });

          return ApiProvider().getData();
        },
        child: FutureBuilder(
          future: ApiProvider().getData(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              var rndItem=snapshot.data!.shuffle();
              print(snapshot.data);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:(context,index){
                    var data=snapshot.data[index];
                    final body =data['body'];
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsPage(body: body,)));
                      },
                      title: Text(data['name']),
                      subtitle: Text(data['email']),
                    );
                  }
              );
            }
          },
        ),
      ),
    );
  }
  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {

            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
