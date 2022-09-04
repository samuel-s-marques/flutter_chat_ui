import 'package:flutter/material.dart';

import '../state/inherited_chat_theme.dart';

class EmojiButton extends StatelessWidget {
  const EmojiButton({
    super.key,
    this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  /// Callback for emoji button tap event.
  final VoidCallback? onPressed;

  /// Padding around the button.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: InheritedChatTheme.of(context).theme.emojiButtonMargin ??
            const EdgeInsetsDirectional.fromSTEB(
              8,
              0,
              0,
              0,
            ),
        child: IconButton(
          constraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          onPressed: onPressed,
          splashRadius: 24,
          padding: padding,
          tooltip: 'Emoji',
          icon: InheritedChatTheme.of(context).theme.emojiButtonIcon ??
              Icon(
                Icons.emoji_symbols_outlined,
                color: InheritedChatTheme.of(context).theme.inputTextColor,
              ),
        ),
      );
}
