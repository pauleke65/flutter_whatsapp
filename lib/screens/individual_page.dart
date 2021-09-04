import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:emoji_picker/emoji_picker.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/whatback.jpeg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 100,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.chatModel.image),
                  radius: 25,
                )
              ],
            ),
            title: Text(widget.chatModel.name),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (showEmoji) {
                  setState(() {
                    showEmoji = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                      hintText: "Type a Message",
                                      contentPadding: EdgeInsets.all(5),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.emoji_emotions),
                                        onPressed: () {
                                          setState(() {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )),
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, left: 2),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        showEmoji ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
    );
  }
}

Widget bottomSheet() {
  return Container(
    height: 278,
    //width: MediaQuery.of(context).size.width,
    child: Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [],
      ),
    ),
  );
}
