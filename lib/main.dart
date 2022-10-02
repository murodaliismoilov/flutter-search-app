import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Users> _founders = [];
  @override
  void initState() {
    _founders = users;
    super.initState();
  }

  search(String? text) {
    setState(() {
      _founders = users
          .where(
              (user) => user.name.toLowerCase().contains(text!.toLowerCase()))
          .toList();
    });
  }

  _delete(int index) {
    setState(() {
      _founders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: SizedBox(
            height: 40,
            child: TextField(
              onChanged: search,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                fillColor: Color.fromARGB(255, 221, 212, 212),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 131, 131, 131),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 245, 245, 245),
          child: _founders.isEmpty
              ? const Center(
                  child: Text('Users not found!'),
                )
              : ListView.builder(
                  itemCount: _founders.length,
                  itemBuilder: (context, index) => Slidable(
                    child: userComponents(
                      _founders[index],
                    ),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.share,
                          label: 'Share',
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          onPressed: (context) => _delete(index),
                          icon: Icons.delete,
                          label: 'Remove',
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  userComponents(Users user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    user.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      user.nickName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    user.followerd = !user.followerd;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: user.followerd
                              ? Colors.transparent
                              : Colors.grey),
                      color: user.followerd ? Colors.blue : Colors.white),
                  child: Center(
                    child: Text(
                      user.followerd ? 'Unfollow' : 'Follow',
                      style: TextStyle(
                          color: user.followerd ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
