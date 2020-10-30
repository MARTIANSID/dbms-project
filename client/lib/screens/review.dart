import 'package:client/providers/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  final String shopId;
  Review(this.shopId);
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final formKey = GlobalKey<FormState>();
  TextEditingController comment = TextEditingController();
  bool loading = false;
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        loading = true;
      });
      await Provider.of<CustomerView>(context, listen: false)
          .getRevs(widget.shopId);

      setState(() {
        loading = false;
      });
    });
  }

  void addComment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here

            child: Container(
              height: 300,
              width: 300,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: comment,
                      decoration: InputDecoration(hintText: 'Enter the review'),
                    ),
                    RaisedButton(onPressed: () async {
                      await Provider.of<CustomerView>(context, listen: false)
                          .addComment(
                              comment: comment.text,
                              cid: Provider.of<CustomerView>(context,
                                      listen: false)
                                  .cid,
                              shopId: widget.shopId);
                      await Provider.of<CustomerView>(context, listen: false)
                          .getRevs(widget.shopId);
                    })
                  ],
                ),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, i) {
                return Card(
                  child: Text(Provider.of<CustomerView>(context, listen: false)
                      .comments[i]),
                );
              },
              itemCount: Provider.of<CustomerView>(context, listen: true)
                  .comments
                  .length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addComment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
