import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isFavourite = false;
  int _quantity = 1;

  Product get p => widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFF1A1A1A), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          p.category,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF888880),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                _isFavourite = !_isFavourite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0EFE9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      p.emoji,
                      style: const TextStyle(fontSize: 72),
                    ),
                  ),
                ),
              ),
            ),

            // Details card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE8E8E4), width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & price row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          p.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '₹${p.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Rating row
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        final full = i < p.rating.floor();
                        final half =
                            !full && i < p.rating && p.rating - i > 0.3;
                        return Icon(
                          full
                              ? Icons.star_rounded
                              : half
                                  ? Icons.star_half_rounded
                                  : Icons.star_outline_rounded,
                          color: const Color(0xFFEF9F27),
                          size: 18,
                        );
                      }),
                      const SizedBox(width: 6),
                      Text(
                        '${p.rating}  ·  ${p.reviews} reviews',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF888880),
                        ),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                        height: 1, thickness: 0.5, color: Color(0xFFE8E8E4)),
                  ),

                  // Description
                  const Text(
                    'About this product',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF555550),
                      height: 1.6,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                        height: 1, thickness: 0.5, color: Color(0xFFE8E8E4)),
                  ),

                  // Quantity selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      Row(
                        children: [
                          _QtyButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (_quantity > 1) {
                                setState(() => _quantity--);
                              }
                            },
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                '$_quantity',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                            ),
                          ),
                          _QtyButton(
                            icon: Icons.add,
                            onTap: () => setState(() => _quantity++),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF888880),
                        ),
                      ),
                      Text(
                        '₹${(p.price * _quantity).toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Specs row
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  const _SpecBadge(
                      icon: Icons.local_shipping_outlined,
                      label: 'Free shipping'),
                  const SizedBox(width: 10),
                  const _SpecBadge(
                      icon: Icons.autorenew_outlined, label: '30-day returns'),
                  const SizedBox(width: 10),
                  const _SpecBadge(icon: Icons.verified_outlined, label: 'Authentic'),
                ],
              ),
            ),

            const SizedBox(height: 100), // space for FAB
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '${p.name} added to cart ($_quantity item${_quantity > 1 ? 's' : ''})'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.all(16),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined,
                color: Colors.white, size: 20),
            label: const Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFF0EFE9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF1A1A1A)),
      ),
    );
  }
}

class _SpecBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SpecBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE8E8E4), width: 0.5),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF555550)),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF555550),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
