import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

var loadedImage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Color Blindness Photo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Background(),
        ChooseImage(),
      ],
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.orange[600], Colors.orange[300]],
          begin: const FractionalOffset(1, 0.1),
          end: const FractionalOffset(1.0, 0.9),
        ),
      ),
    );
  }
}

class ChooseImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              VoidContainer(),
              Expanded(
                child: Container(
                  child: FittedBox(
                    child: TakeAPictureButton(),
                  ),
                ),
              ),
              VoidContainer(),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              VoidContainer(),
              Expanded(
                child: Container(
                  child: FittedBox(
                    child: SearchImageButton(),
                  ),
                ),
              ),
              VoidContainer(),
            ],
          ),
        ),
      ],
    );
  }
}

class TakeAPictureButton extends StatefulWidget {
  @override
  _TakeAPictureButtonState createState() => _TakeAPictureButtonState();
}

class _TakeAPictureButtonState extends State<TakeAPictureButton> {
  loadPhoto() async {
    loadedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Material(
      color: Colors.transparent,
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.orange[700],
        color: Colors.black,
        icon: Icon(Icons.camera_alt),
        tooltip: 'Take a picture',
        onPressed: () {
          loadPhoto();
        },
      ),
    );
  }
}

class SearchImageButton extends StatefulWidget {
  @override
  _SearchImageButtonState createState() => _SearchImageButtonState();
}

class _SearchImageButtonState extends State<SearchImageButton> {
  loadGalleryPhoto() async {
    loadedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Material(
      color: Colors.transparent,
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.orange[700],
        color: Colors.black,
        icon: Icon(Icons.image),
        tooltip: 'Choose from gallery',
        onPressed: () {
          loadGalleryPhoto();
        },
      ),
    );
  }
}

class VoidContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(),
    );
  }
}

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  Widget loadedWidget =
      loadedImage == null ? Text('No image to show') : Image.file(loadedImage);
  var state = 0;

  changeImageFilter() {
    if (loadedImage == null) {
      loadedWidget = Text('No image to show');
    } else {
      state = (state + 1) % 5;
      switch (state) {
        case 0:
          this.setState(() {
            loadedWidget = Image.file(loadedImage);
          });
          break;
        case 1:
          this.setState(() {
            loadedWidget = Image.file(
              loadedImage,
              color: Colors.red[900],
              colorBlendMode: BlendMode.hue,
            );
          });
          break;
        case 2:
          this.setState(() {
            loadedWidget = Image.file(
              loadedImage,
              color: Colors.green,
              colorBlendMode: BlendMode.saturation,
            );
          });
          break;
        case 3:
          this.setState(() {
            loadedWidget = Image.file(
              loadedImage,
              color: Colors.blue[900],
              colorBlendMode: BlendMode.exclusion,
            );
          });
          break;
        case 4:
          this.setState(() {
            loadedWidget = Image.file(
              loadedImage,
              color: Colors.black,
              colorBlendMode: BlendMode.color,
            );
          });
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: new Text("Make this image fantastic!"),
      ),
      body: new Container(
        child: Center(
          child: loadedWidget,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[700],
        child: Icon(Icons.filter),
        onPressed: () {
          changeImageFilter();
          debugPrint('Estado: $state');
        },
      ),
    );
  }
}
