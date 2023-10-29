import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamtier/services/user_services.dart';
import 'package:dreamtier/utils/file_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PfpUploadScreen extends ConsumerStatefulWidget {
  const PfpUploadScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<PfpUploadScreen> createState() => _PfpUploadScreenState();
}

class _PfpUploadScreenState extends ConsumerState<PfpUploadScreen> {
  File? _imageFile;
  String? _fileRef;
  Future<void> _checkIfExists() async {
    final storage = FirebaseStorage.instance;
    final userRef =
        await UserServices.fetchUserInfo(instance.currentUser!.uid);
    if (userRef == null) return;
    if (userRef['pfp'] == null) return;
    final ref = storage.ref().child(userRef['pfp']);
    final url = await ref.getDownloadURL();
    final file = await fileFromUrl(url);
    if (file == null) return;
    setState(() {
      _imageFile = file;
    });
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    await _uploadImage(File(pickedFile.path));
  }

  final instance = FirebaseAuth.instance;
  bool loading = false;
  Future<void> _uploadImage(File file) async {
    setState(() {
      loading = true;
    });
    final storage = FirebaseStorage.instance;
    _fileRef =
        'profile_pictures/${instance.currentUser!.uid}.${file.path.split('.').last}';
    final ref = storage.ref().child(_fileRef!);
    await UserServices.updateUser(instance.currentUser!.uid, {
      'pfp': _fileRef,
    });
    final uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() {
      debugPrint('Image uploaded to Firebase Cloud Storage');
      setState(() {
        _imageFile = file;
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile picture uploaded successfully'),
        ),
      );
    }).catchError((error) {
      debugPrint(error.toString());
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error uploading profile picture'),
        ),
      );
      throw error;
    });
  }

  Future<void> _removeImage() async {
    setState(() {
      loading = true;
    });
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child(_fileRef!);
    await UserServices.updateUser(instance.currentUser!.uid, {
      'pfp': FieldValue.delete(),
    });
    final uploadTask = ref.delete();
    await uploadTask.whenComplete(() {
      debugPrint('Image deleted from Firebase Cloud Storage');
      setState(() {
        loading = false;
        _imageFile = null;
      });
    });
  }

  @override
  void initState() {
    _checkIfExists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 834 / 667,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/headfinal.png'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          const Text(
            'Upload Profile Picture',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),
          // circular avatar
          InkWell(
            customBorder: const CircleBorder(),
            onTap: _selectImage,
            child: CircleAvatar(
              radius: 70,
              backgroundImage:
                  _imageFile == null ? null : FileImage(_imageFile!),
              child: loading
                  ? const CircularProgressIndicator()
                  : (_imageFile == null
                      ? const Icon(
                          Icons.person,
                          size: 50,
                        )
                      : null),
            ),
          ),
          const SizedBox(height: 20),
          _imageFile == null
              ? ElevatedButton(
                  onPressed: _selectImage, child: const Text('Select Image'))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _removeImage,
                  child: const Text('Remove'),
                )
        ],
      ),
    );
  }
}
