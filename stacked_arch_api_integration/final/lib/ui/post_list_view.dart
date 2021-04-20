import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:start/datamodel/post.dart';
import 'package:start/ui/post_list_viewmodel.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModelList>.reactive(
        builder: (builder, model, child) =>
            Scaffold(
              appBar: AppBar(title: Text('Stacked')),
              body: model.isBusy ? CircularProgressIndicator() :
              Column(
                children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: model.data.length,
                                itemBuilder: (context, index) {
                                  Post post = model.data[index];
                                  return Card(child: ListTile(title: Text(post.title)));
                                }))
                      ],
              ),
            ), viewModelBuilder: () => PostViewModelList());
  }
}
