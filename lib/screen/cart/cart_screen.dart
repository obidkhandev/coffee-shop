import 'package:coffee_shop/data/local/local_database.dart';
import 'package:coffee_shop/data/model/coffee_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Stream? stream;
  const CartScreen({super.key, this.stream});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CoffeeModel> coffeeModel = [];

  _init() async {
    coffeeModel = await LocalDatabase.getAllItems();
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    print(coffeeModel.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color:  Theme.of(context).iconTheme.color),),
        title: Text("cart".tr(),style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
      body:
      coffeeModel.length == 0? Center(child: Text("Afsuski hali hech narsa harid qilmadingiz"),):
      ListView.builder(
          itemCount: coffeeModel.length,

          itemBuilder: (context, index) {
        return Container(
          height: 70,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(coffeeModel[index].name,style: Theme.of(context).textTheme.titleMedium),
                  Text(coffeeModel[index].createdAt.toString().substring(0,16),style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(coffeeModel[index].subtitle,style: Theme.of(context).textTheme.titleMedium),
                  Text("price \$${coffeeModel[index].price}",style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
