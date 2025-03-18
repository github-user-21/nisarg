import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _postController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitPost() {
    final text = _postController.text.trim();
    if (text.isEmpty && _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add text or an image')),
      );
      return;
    }

    // Handle the post submission logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Post Submitted')),
    );
    _postController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: NeumorphicAppBar(
          title: Text('Create Post', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildUserHeader(),
              SizedBox(height: 16),
              _buildPostInput(),
              SizedBox(height: 10),
              if (_image != null) _buildImagePreview(),
              SizedBox(height: 16),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            depth: 4,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/user.jpg'), // Add your profile image
          ),
        ),
        SizedBox(width: 12),
        Text('EcoWarrior123',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildPostInput() {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -4,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: _postController,
        maxLines: 5,
        decoration: InputDecoration.collapsed(
          hintText: 'Share your climate action...',
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(_image!, height: 200, fit: BoxFit.cover),
        ),
        SizedBox(height: 8),
        NeumorphicButton(
          style: NeumorphicStyle(depth: 2, color: Colors.redAccent),
          onPressed: () {
            setState(() {
              _image = null;
            });
          },
          child: Text('Remove Image', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeumorphicButton(
          onPressed: _pickImage,
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            depth: 2,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.image, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text('Add Image'),
            ],
          ),
        ),
        NeumorphicButton(
          onPressed: _submitPost,
          style: NeumorphicStyle(
            depth: 2,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            color: Colors.green,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text('Post', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
