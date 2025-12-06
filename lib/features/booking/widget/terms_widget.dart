
import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/core/utils/keyboard.dart';

class TermsWidget extends StatefulWidget {
  static final GlobalKey<_TermsWidgetState> termsKey = GlobalKey<_TermsWidgetState>();
  final bool initialValue;
  final FormFieldValidator<bool>? validator;
  final FormFieldSetter<bool>? onSaved;

  TermsWidget({
    Key? key,
    required this.initialValue,
    this.validator,
    this.onSaved,
  }) : super(key: termsKey);

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late bool isChecked;

  resetCheckbox() {
    setState(() {
      isChecked = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      validator: widget.validator,
      builder: (FormFieldState<bool> field) {
        // sync values
        if (field.value != isChecked) {
          field.didChange(isChecked);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showTermsDialog(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                        children: [
                          const TextSpan(text: "قوانین برنامه "),
                          TextSpan(
                            text: "هتلینو",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const TextSpan(text: " را خوانده و آنها را میپذیرم."),
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    side: BorderSide(
                      color: field.hasError
                          ? isChecked
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.error
                          : isChecked
                          ? Theme.of(context).colorScheme.primary
                          : AppColors.lightBorder,
                      width: field.hasError ? 1.3 : 2,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                        field.didChange(isChecked);
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                  ),
                ],
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _showTermsDialog(BuildContext context) {
    unfocusEditors(context);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "قوانین برنامه هتلینو",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 16),
              Text(
                "هتلینو یکی از برنامه‌های معتبر از دوره‌ی یاقوت فلاتر است که توسط پیج دانیجت و توسط دانشحو امیرحسین دری توسعه یافته است. این برنامه به شما این امکان را می‌دهد تا به راحتی هتل‌های مختلف را در کشورهای گوناگون جستجو کرده و رزرو کنید\n\n"
                "شما قادر خواهید بود پروفایل شخصی خود را ایجاد کنید و هتل‌هایی که به نیازهای شما نزدیک‌تر هستند را پیدا کنید. توجه داشته باشید که هتل‌های رزرو شده قابل لغو نبوده و پس از انجام رزرو، تغییرات در این زمینه امکان‌پذیر نمی‌باشد\n\n"
                "قیمت‌های هتل‌ها به صورت مقطوع اعلام شده‌اند و هیچ‌گونه تغییر قیمتی پس از رزرو نخواهید داشت. همچنین، اطلاعات هتل‌ها به دقت بررسی و به روزرسانی می‌شوند تا شما تجربه‌ای رضایت‌بخش از اقامت خود داشته باشید",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
