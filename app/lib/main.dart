import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> messages = [
    {
      "text": "Hello!",
      "sender": "user",
      "name": "You",
      "time": "09:00 AM",
    },
    {
      "text":
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iusto nihil totam, ipsam illo, hic ut esse eos officia cupiditate accusamus animi doloremque, quo consectetur temporibus sint placeat. Accusantium, ut quidem.",
      "sender": "other",
      "name": "Appex Network",
      "time": "09:23 AM",
    },
    {
      "text":
          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iusto nihil totam, ipsam illo,",
      "sender": "user",
      "name": "You",
      "time": "10:00 AM",
    },
    {
      "text": "I am doing well, thanks!",
      "sender": "other",
      "name": "Appex Network",
      "time": "10:30 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.keyboard_backspace),
        title: Row(
          children: [
            CircleAvatar(),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Siti Munaroh'),
                  Text(
                    'Online',
                    style: TextStyle(color: Colors.green[300]),
                  )
                ],
              ),
            )
          ],
        ),
        actions: [
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: CircleBorder(),
                side: BorderSide(color: Colors.grey),
              ),
              child: Icon(Icons.videocam_sharp)),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: CircleBorder(),
                side: BorderSide(color: Colors.grey),
              ),
              child: Icon(Icons.more_vert_rounded)),
        ],
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message["sender"] == "user";
                return MessageBubble(
                  text: message["text"]!,
                  isUserMessage: isUserMessage,
                  name: message["name"]!,
                  time: message["time"]!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefix: Icon(Icons.add_circle_outline, color: Colors.black,),
                      hintText: 'Write a reply...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add your send message logic here
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isUserMessage;
  final String name;
  final String time;

  MessageBubble({
    required this.text,
    required this.isUserMessage,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            // width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: isUserMessage ? Colors.pink[200] : Colors.grey[200],
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0, color: isUserMessage?Colors.white:Colors.black),
            ),
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: isUserMessage? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10.0,),
              Text(
                time,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
