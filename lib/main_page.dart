import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int count = 0;

  @override
  void initState() {
    super.initState();
    //test();
    countControl();
  }

  Future<void> countControl () async{
    var sp = await SharedPreferences.getInstance();
    count = sp.getInt("count") ?? 0;
    setState(() {
      count = count + 3;
    });
    sp.setInt("count", count);
  }

  Future<void> test ()async{
    var sp =  await SharedPreferences.getInstance();

    //value register
    sp.setString("name", "Osman");
    sp.setInt("age", 28);
    sp.setDouble("height", 1.9);
    sp.setBool("car", true);
    
    var spList = <String>[];
    spList.add("Orhan");
    spList.add("Suat");
    spList.add("Cemil");
    sp.setStringList("spList", spList);

    //value delete
    //sp.remove("name");
    //value read

    String returnName = sp.getString("name") ?? "no name";
    int returnAge = sp.getInt("age") ?? 0;
    double returnHeight = sp.getDouble("height") ?? 0.0;
    bool returnCar = sp.getBool("car") ?? false;
    print("Return Name : $returnName}");
    print("Return Age : $returnAge}");
    print("Return Height : $returnHeight}");
    print("Return Car : $returnCar}");

    var returnSpList = sp.getStringList("spList") ?? <String>[];

    if(returnSpList != null){
      for(var  a in returnSpList){
        print("Return Sp List : $a");
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHARED PREFERENCES"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Count : $count",style: TextStyle(fontSize: 36),)
          ],
        ),
      ),
    );
  }
}
