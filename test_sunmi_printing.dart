import 'package:flutter/material.dart';
import 'package:invotek/features/printing/services/sunmi_printer_service.dart';

/// ملف اختبار الطباعة الحقيقية مع طابعات SUNMI
void main() {
  runApp(TestSunmiPrintingApp());
}

class TestSunmiPrintingApp extends StatelessWidget {
  const TestSunmiPrintingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اختبار طابعة SUNMI',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: TestSunmiPrintingScreen(),
    );
  }
}

class TestSunmiPrintingScreen extends StatefulWidget {
  const TestSunmiPrintingScreen({super.key});

  @override
  _TestSunmiPrintingScreenState createState() =>
      _TestSunmiPrintingScreenState();
}

class _TestSunmiPrintingScreenState extends State<TestSunmiPrintingScreen> {
  bool _isConnected = false;
  String _statusMessage = 'جاهز للاختبار';
  String _printerInfo = '';

  @override
  void initState() {
    super.initState();
    _initializePrinter();
  }

  /// تهيئة الطابعة
  Future<void> _initializePrinter() async {
    setState(() {
      _statusMessage = 'جاري تهيئة الطابعة...';
    });

    try {
      final success = await SunmiPrinterService.initializePrinter();

      if (success) {
        final info = await SunmiPrinterService.getPrinterInfo();
        setState(() {
          _isConnected = true;
          _statusMessage = 'الطابعة متصلة ومستعدة';
          _printerInfo =
              'نوع الطابعة: ${info['type']}\nالحالة: ${info['status']}';
        });
      } else {
        setState(() {
          _isConnected = false;
          _statusMessage = 'فشل في تهيئة الطابعة';
          _printerInfo = 'تأكد من اتصال طابعة SUNMI';
        });
      }
    } catch (e) {
      setState(() {
        _isConnected = false;
        _statusMessage = 'خطأ: $e';
        _printerInfo = 'حدث خطأ أثناء التهيئة';
      });
    }
  }

  /// اختبار طباعة بسيطة
  Future<void> _testSimplePrint() async {
    try {
      setState(() {
        _statusMessage = 'جاري الطباعة...';
      });

      final success = await SunmiPrinterService.printTestPage();

      if (success) {
        setState(() {
          _statusMessage = 'تمت الطباعة بنجاح!';
        });
      } else {
        setState(() {
          _statusMessage = 'فشلت الطباعة';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'خطأ في الطباعة: $e';
      });
    }
  }

  /// اختبار طباعة فاتورة كاملة
  Future<void> _testInvoicePrint() async {
    try {
      setState(() {
        _statusMessage = 'جاري طباعة الفاتورة...';
      });

      final success = await SunmiPrinterService.printReceipt(
        invoiceNumber: 'TEST-001',
        date: '2024-01-15',
        customerName: 'عميل تجريبي',
        items: [
          {
            'name': 'منتج تجريبي 1',
            'quantity': 2.0,
            'price': 50.0,
            'total': 100.0,
          },
          {
            'name': 'منتج تجريبي 2',
            'quantity': 1.0,
            'price': 25.0,
            'total': 25.0,
          },
        ],
        subtotal: 125.0,
        tax: 18.75,
        total: 143.75,
      );

      if (success) {
        setState(() {
          _statusMessage = 'تمت طباعة الفاتورة بنجاح!';
        });
      } else {
        setState(() {
          _statusMessage = 'فشلت طباعة الفاتورة';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'خطأ في طباعة الفاتورة: $e';
      });
    }
  }

  /// اختبار طباعة QR Code
  Future<void> _testQRCodePrint() async {
    try {
      setState(() {
        _statusMessage = 'جاري طباعة QR Code...';
      });

      final success = await SunmiPrinterService.printQRCodeData(
        'https://invotek.com',
        'رابط موقع Invotek',
      );

      if (success) {
        setState(() {
          _statusMessage = 'تمت طباعة QR Code بنجاح!';
        });
      } else {
        setState(() {
          _statusMessage = 'فشلت طباعة QR Code';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'خطأ في طباعة QR Code: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختبار طابعة SUNMI'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              color: _isConnected ? Colors.green.shade50 : Colors.red.shade50,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isConnected ? Icons.check_circle : Icons.error,
                          color: _isConnected ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'حالة الطابعة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(_statusMessage),
                    if (_printerInfo.isNotEmpty) ...[
                      SizedBox(height: 8),
                      Text(
                        _printerInfo,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Test Buttons
            if (_isConnected) ...[
              ElevatedButton.icon(
                onPressed: _testSimplePrint,
                icon: Icon(Icons.print),
                label: Text('اختبار طباعة بسيطة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: _testInvoicePrint,
                icon: Icon(Icons.receipt),
                label: Text('اختبار طباعة فاتورة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: _testQRCodePrint,
                icon: Icon(Icons.qr_code),
                label: Text('اختبار طباعة QR Code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ] else ...[
              ElevatedButton.icon(
                onPressed: _initializePrinter,
                icon: Icon(Icons.refresh),
                label: Text('إعادة تهيئة الطابعة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],

            SizedBox(height: 20),

            // Instructions
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تعليمات الاختبار:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('1. تأكد من اتصال طابعة SUNMI بالجهاز'),
                    Text('2. تأكد من منح جميع الصلاحيات المطلوبة'),
                    Text('3. جرب الاختبارات المختلفة'),
                    Text('4. راقب رسائل الحالة'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
