import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/secure_storage.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/common/small_loading_indicator.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketSelector extends HookWidget {
  final Function(Market)? onSelected;

  const MarketSelector({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nearbyMarketState = useProvider(nearbyMarketsProvider);
    final currentMarket = useProvider(currentMarketProvider).state;
    final activeOrder = useProvider(activeOrderProvider);

    if (activeOrder != null) return _buildActiveOrder();

    return nearbyMarketState.when(
      data: (markets) => markets.isEmpty
          ? _buildEmpty()
          : _buidlDropdown(context, currentMarket, markets),
      loading: () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: const [
            SmallLoadingIndicator(),
            SizedBox(width: 12),
            Text('Mencari Pasar Terdekat...'),
          ],
        ),
      ),
      error: (exception, st) => _buildError(exception as Exception),
    );
  }

  Widget _buildError(Exception exception) {
    if (exception is CustomException && exception.code == 422) {
      return _buildNoGPS();
    }
    return CustomExceptionMessage(exception);
  }

  Widget _buildEmpty() => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.wrong_location_rounded,
              color: ColorPallete.primaryColor,
              size: 88,
            ),
            SizedBox(height: 12),
            Text(
              'Mohon maaf, saat ini belum terdapat pasar yang terdaftar di daerah Anda.',
              textAlign: TextAlign.center,
              style: kTextTheme.titleLarge,
            ),
          ],
        ),
      );

  Widget _buildNoGPS() => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.location_disabled_rounded,
              color: ColorPallete.primaryColor,
              size: 88,
            ),
            SizedBox(height: 12),
            Text(
              'Gagal mendapatkan pasar terdekat, harap pastikan layanan lokasi/GPS Anda menyala.',
              textAlign: TextAlign.center,
              style: kTextTheme.titleLarge,
            ),
          ],
        ),
      );

  Widget _buildActiveOrder() => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.shopping_cart_rounded,
              color: ColorPallete.primaryColor,
              size: 88,
            ),
            SizedBox(height: 12),
            Text(
              'Anda tidak dapat mengganti pasar jika terdapat barang di keranjang.',
              textAlign: TextAlign.center,
              style: kTextTheme.titleLarge,
            ),
          ],
        ),
      );

  DropdownSearch<Market> _buidlDropdown(
    BuildContext context,
    Market? currentMarket,
    List<Market> markets,
  ) {
    return DropdownSearch<Market>(
      compareFn: (item, selectedItem) => item.id == selectedItem.id,
      selectedItem: currentMarket,
      items: markets,
      itemAsString: (Market m) => m.name ?? '-',
      popupProps: PopupProps.menu(
        showSearchBox: true,  
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _buildItem(item),
        menuProps: MenuProps(
          backgroundColor: ColorPallete.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          elevation: 1,
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPallete.lightGray.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2.0,
              color: ColorPallete.primaryColor,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'Pasar',
          suffixIconConstraints: BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
        ),
      ),
      onChanged: (Market? market) async {
        if (market != null) {
          context.read(currentMarketProvider).state = market;

          await SecureStorage().setSelectedMarket(market);

          onSelected?.call(market);
        }
      },
    );
  }

  Padding _buildItem(Market item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.name ?? '-',
              style: kTextTheme.titleLarge,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '${item.distance?.toStringAsFixed(1) ?? '-'}km',
            style: kTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
