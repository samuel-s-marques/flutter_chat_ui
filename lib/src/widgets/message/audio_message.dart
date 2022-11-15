import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../util.dart';
import '../state/inherited_chat_theme.dart';
import '../state/inherited_l10n.dart';
import '../state/inherited_user.dart';

/// A class that represents file message widget.
class AudioMessage extends StatelessWidget {
  /// Creates a file message widget based on a [types.AudioMessage].
  const AudioMessage({
    super.key,
    required this.message,
  });

  /// [types.AudioMessage].
  final types.AudioMessage message;

  @override
  Widget build(BuildContext context) {
    final user = InheritedUser.of(context).user;
    final color = user.id == message.author.id
        ? InheritedChatTheme.of(context).theme.sentMessageAudioIconColor
        : InheritedChatTheme.of(context).theme.receivedMessageAudioIconColor;

    return Semantics(
      label: InheritedL10n.of(context).l10n.fileButtonAccessibilityLabel,
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(
          InheritedChatTheme.of(context).theme.messageInsetsVertical,
          InheritedChatTheme.of(context).theme.messageInsetsVertical,
          InheritedChatTheme.of(context).theme.messageInsetsHorizontal,
          InheritedChatTheme.of(context).theme.messageInsetsVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(21),
              ),
              height: 42,
              width: 42,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InheritedChatTheme.of(context).theme.audioIcon != null
                      ? InheritedChatTheme.of(context).theme.audioIcon!
                      : Image.asset(
                          'assets/icon-microphone.png',
                          color: color,
                          package: 'flutter_chat_ui',
                        ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                  start: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.name,
                      style: user.id == message.author.id
                          ? InheritedChatTheme.of(context).theme.sentMessageBodyTextStyle
                          : InheritedChatTheme.of(context).theme.receivedMessageBodyTextStyle,
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text(
                        formatBytes(message.size.truncate()),
                        style: user.id == message.author.id
                            ? InheritedChatTheme.of(context).theme.sentMessageCaptionTextStyle
                            : InheritedChatTheme.of(context).theme.receivedMessageCaptionTextStyle,
                      ),
                    ),
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
