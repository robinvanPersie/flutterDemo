import 'package:flutter/material.dart';

/**
 * startActivityForResult
 */
void main() => runApp(MaterialApp(
  title: 'navigator with data',
  home: ListNavigator(
    products:List.generate(20, (i) => Product('商品 $i', '商品detail，编号：$i')),
  ),
));

class ListNavigator extends StatelessWidget {

  final List<Product> products;

  ListNavigator({Key key, @required this.products}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product list'),),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return _buildItem(ctx, index);
        },
      ),
    );
  }

  // build list item widget
  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(products[index].title),
      onTap: () {
        _navigatorToDetailAsync(context, index);
      },
    );
  }

  // intent
  _navigatorToDetailAsync(BuildContext context, int index) async {
    final result = Navigator.push(context, MaterialPageRoute(
        builder: (ctx) {
          return ProductDetail(product: products[index]);
        }
    ));
    result.then((r) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(r)));
    });
  }
}

class Product {
  final String title; //
  final String description; //

  Product(this.title, this.description);
}

// detail page
class ProductDetail extends StatelessWidget {

  ProductDetail({Key key, this.product}):super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${product.title}'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, '把desc返回给你：${product.description}');
          },
          child: Text('${product.description} 返回一个参数给previous page', style: TextStyle(fontSize: 40.0),),
        ),
      ),
    );
  }
}

