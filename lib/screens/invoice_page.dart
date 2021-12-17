import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:invoiceninja/models/product.dart';
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
    if (_product == null) {
      return;
    }

    var client = Client.forContact(
        firstName: "Kathiravan", email: "Kathiravanrs@hotmail.com");
    client = await InvoiceNinja.clients.save(client);

    var invoice = Invoice.forClient(client, products: [
      Product(
          productKey: "teal", notes: "hello", cost: 20, quantity: 5, price: 30)
    ]);
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

  void _viewPortal() {
    if (_invoice == null) {
      return;
    }

    final invitation = _invoice!.invitations.first;
    launch(invitation.url);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }

    final invoice = await InvoiceNinja.invoices.findByKey(_invoice!.key);

    if (invoice.isPaid) {
      // ...
    }
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
        appBar: AppBar(
          title: const Text('Invoice Ninja Example'),
        ),
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
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                      onChanged: (value) => setState(() => _email = value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    DropdownButtonFormField<Product>(
                      decoration: const InputDecoration(
                        labelText: 'Product',
                      ),
                      onChanged: (value) => setState(() => _product = value),
                      items: _products
                          .map((product) => DropdownMenuItem(
                                child: Text(product.productKey),
                                value: product,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    OutlineButton(
                      child: const Text('Create Invoice'),
                      onPressed: (_email.isNotEmpty && _product != null)
                          ? () => _createInvoice()
                          : null,
                    ),
                    OutlineButton(
                      child: const Text('View PDF'),
                      onPressed: (_invoice != null) ? () => _viewPdf() : null,
                    ),
                    OutlineButton(
                      child: const Text('View Portal'),
                      onPressed:
                          (_invoice != null) ? () => _viewPortal() : null,
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
