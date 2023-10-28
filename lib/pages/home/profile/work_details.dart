import 'package:dreamtier/components/ui/custom_textfield.dart';
import 'package:dreamtier/models/project_model.dart';
import 'package:flutter/material.dart';

class WorkDetailsScreen extends StatefulWidget {
  const WorkDetailsScreen({Key? key}) : super(key: key);
  @override
  State<WorkDetailsScreen> createState() => _WorkDetailsScreenState();
}

class _WorkDetailsScreenState extends State<WorkDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bioController = TextEditingController();
  List<Project> _projects = [
    Project(
        name: 'Drone Flight Controller',
        link: 'link',
        description: 'description'),
    Project(name: 'Ethereum Wallet', link: 'link', description: 'description'),
    Project(
        name: 'Payment Aoplication', link: 'link', description: 'description'),
  ];
  final _fbLinkController = TextEditingController();
  final _instaLinkController = TextEditingController();
  final _linkedInLinkController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    _fbLinkController.dispose();
    _instaLinkController.dispose();
    _linkedInLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bio',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextFormField(
                      controller: _bioController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your bio',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter your bio';
                        }
                        if (value.isEmpty) {
                          return 'Please enter your bio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Projects',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        TextButton(
                            onPressed: () {
                              String name = '';
                              String description = '';
                              String link = '';
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        content: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(3.0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 16.0),
                                              const Text(
                                                'Project Name',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              CustomTextField(
                                                  onChanged: (val) {
                                                    setState(() {
                                                      name = val;
                                                    });
                                                  },
                                                  label: 'Enter project name'),
                                              const SizedBox(height: 16.0),
                                              const Text(
                                                'Project Description',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              CustomTextField(
                                                  onChanged: (val) {
                                                    setState(() {
                                                      description = val;
                                                    });
                                                  },
                                                  label:
                                                      'Enter project description'),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              const Text(
                                                'Project Link',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              CustomTextField(
                                                  onChanged: (val) {
                                                    setState(() {
                                                      link = val;
                                                    });
                                                  },
                                                  label: 'Add Link'),
                                              const SizedBox(
                                                height: 32.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                                _projects.add(Project(
                                                    name: name,
                                                    link: link,
                                                    description: description));
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Add Project')),
                                        ],
                                      )).then((value) {
                                Navigator.pop(context);
                              });
                            },
                            child: const Text('Add Project'))
                      ],
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _projects.length,
                          itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(13),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.all(0.0),
                                              child: AlertDialog(
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Cancel')),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Save')),
                                                ],
                                                content: SingleChildScrollView(
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                            height: 16.0),
                                                        const Text(
                                                          'Project Name',
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        CustomTextField(
                                                            value:
                                                                _projects[index]
                                                                    .name,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                _projects[index]
                                                                    .name = val;
                                                              });
                                                            },
                                                            label:
                                                                'Enter project name'),
                                                        const SizedBox(
                                                            height: 16.0),
                                                        const Text(
                                                          'Project Description',
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        CustomTextField(
                                                            value: _projects[
                                                                    index]
                                                                .description,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                _projects[index]
                                                                        .description =
                                                                    val;
                                                              });
                                                            },
                                                            label:
                                                                'Enter project description'),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        const Text(
                                                          'Project Link',
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        CustomTextField(
                                                            value:
                                                                _projects[index]
                                                                    .link,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                _projects[index]
                                                                    .link = val;
                                                              });
                                                            },
                                                            label: 'Add Link'),
                                                        const SizedBox(
                                                          height: 32.0,
                                                        ),
                                                        Center(
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                OutlinedButton(
                                                                    style: OutlinedButton.styleFrom(
                                                                        fixedSize: const Size(
                                                                            double
                                                                                .infinity,
                                                                            50),
                                                                        foregroundColor:
                                                                            Colors
                                                                                .red,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .transparent),
                                                                    onPressed:
                                                                        () {
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder: (_) =>
                                                                              Container(
                                                                                width: double.infinity,
                                                                                margin: const EdgeInsets.all(0.0),
                                                                                child: AlertDialog(
                                                                                  actions: [
                                                                                    TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: const Text('Cancel')),
                                                                                    TextButton(
                                                                                        onPressed: () {
                                                                                          setState(() {
                                                                                            _projects.removeAt(index);
                                                                                          });
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: const Text('Delete')),
                                                                                  ],
                                                                                  content: const Text('Are you sure you want to delete this project?'),
                                                                                ),
                                                                              )).then(
                                                                          (value) {
                                                                        Navigator.pop(
                                                                            context);
                                                                      });
                                                                    },
                                                                    child: const Text(
                                                                        'Delete Project')),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 13.0,
                                        left: 16.0,
                                        right: 16.0,
                                        bottom: 3),
                                    width: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _projects[index].name,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(_projects[index].description,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                        Text(_projects[index].link,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.blue,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Facebook Profile Link',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextFormField(
                      controller: _fbLinkController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your facebook profile link',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter your link';
                        }
                        if (value.isEmpty) {
                          return 'Please enter your link';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'LinkedIn Profile Link',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextFormField(
                      controller: _linkedInLinkController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your linked in profile link',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter your link';
                        }
                        if (value.isEmpty) {
                          return 'Please enter your link';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Instagram Profile Link',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextFormField(
                      controller: _instaLinkController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your instagram profile link',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter your link';
                        }
                        if (value.isEmpty) {
                          return 'Please enter your link';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 50),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 24, 54, 221)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
