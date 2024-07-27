import 'package:flutter/material.dart';
import 'animal.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _Level1State();
}

int score = 0;
List<Animal> list1 = [];
List<Animal> list2 = [];
void initLevel() {
  score = 0;
  list1 = [
    Animal(name: 'Camel', img: '.idea/assets/camel.png', voice: 'none'),
    Animal(name: 'Cat', img: '.idea/assets/cat.png', voice: 'none'),
    Animal(name: 'Cow', img: '.idea/assets/cow.png', voice: 'none'),
    Animal(name: 'Dog', img: '.idea/assets/dog.png', voice: 'none'),
    Animal(name: 'Fox', img: '.idea/assets/fox.png', voice: 'none'),
    Animal(name: 'Hen', img: '.idea/assets/hen.png', voice: 'none'),
    Animal(name: 'Horse', img: '.idea/assets/horse.png', voice: 'none'),
    Animal(name: 'Lion', img: '.idea/assets/lion.png', voice: 'none'),
    Animal(name: 'Panda', img: '.idea/assets/panda.png', voice: 'none'),
    Animal(name: 'Sheep', img:'.idea/assets/sheep.png', voice: 'none'),
  ];
  list2 = List<Animal>.from(list1);

  list1.shuffle();
  list2.shuffle();
}

class _Level1State extends State<Level1> {
  @override
  void initState() {
    initLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(



        child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Score: ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      score.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                    SizedBox(
                      width: 240,
                    ),
                    IconButton(
                      onPressed: () {
                        initLevel();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 0,
                endIndent: 260,
                color: Colors.orange,
              ),
              Row(
                children: [
                  Column(
                    children: list1.map((animal1) {
                      return Container(

                          child:
                          Draggable<Animal>(
                              data: animal1,
                              childWhenDragging: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(animal1.img),
                                radius: 50,
                              ),
                              feedback:CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(animal1.img),
                                radius: 30,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(animal1.img),
                                radius: 30,
                              )
                          ));
                    }).toList(),
                  ),
                  SizedBox(
                    width: 200,
                  ),

                  Column(
                    children: list2.map((animal2) {
                      return DragTarget<Animal>(
                          onAcceptWithDetails: (animal1) {
                            if (animal1.data.name == animal2.name) {
                              setState(() {
                                list1.remove(animal2);
                                list2.remove(animal2);

                              });
                              score = score + 10;

                            }
                          }, builder: (context, _,__) {
                      return Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child:Text(animal2.name,style: Theme.of(context).textTheme.headlineSmall,),
                      );
                      });
                    }).toList(),

                  ),
                ],
              )

            ]
        )
    );





  }
}