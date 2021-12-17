import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:invoiceninja/models/product.dart';
import 'package:login_example/components/blog.dart';
import 'package:login_example/helpers/global.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoicePage extends StatefulWidget {
  static const routeName = '/invoice';

  InvoicePage({Key? key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> with WidgetsBindingObserver {
  List<Product> _products = [];

  String _email = '';
  Product? _product;
  Invoice? _invoice;
  List<Product> prod = [];

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);

    InvoiceNinja.configure(
      'fh8ZYxNpDAWIRhojs3ZGQh3eI7d1WR96',
      url: 'https://kathiravanrs.invoicing.co', // Set your selfhost app URL
      debugEnabled: true,
    );

    InvoiceNinja.products.load().then((products) {
      setState(() {
        _products = products;
      });
    });
  }

  void _createInvoice() async {
    var client = Client.forContact(
        firstName: "Kathiravan", email: "Kathiravanrs@hotmail.com");
    client = await InvoiceNinja.clients.save(client);

    insuranceCount.forEach((key, value) {
      if (value > 0) {
        print(value.toString() + " " + key.toString());
        prod.add(Product(
          productKey: key,
          cost: double.parse(insuranceCost[key].toString()),
          notes: insuranceDesc[key].toString(),
          quantity: value,
          price: double.parse(insuranceCost[key].toString()),
        ));
      }
    });
    print(prod.toString());

    var invoice = Invoice.forClient(client, products: prod);
    invoice = await InvoiceNinja.invoices.save(invoice);

    setState(() {
      _invoice = invoice;
    });
  }

  void _viewPdf() {
    if (_invoice == null) {
      return;
    }

    launch(
      'https://docs.google.com/gview?embedded=true&url=${_invoice!.pdfUrl}',
      forceWebView: true,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }

    final invoice = await InvoiceNinja.invoices.findByKey(_invoice!.key);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      return const Center(
          child: Text(
        "Please Log In To Continue",
        style: TextStyle(
            fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
      ));
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MenuBar(),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: const Text('Create Invoice'),
                      onPressed: () {
                        _createInvoice();
                      },
                    ),
                    divider,
                    divider,
                    ElevatedButton(
                      child: const Text('View PDF'),
                      onPressed: () {
                        _viewPdf();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
