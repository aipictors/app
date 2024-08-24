// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aipictors/fragments/__generated__/follow_notification_fields_fragment.ast.gql.dart'
    as _i2;
import 'package:aipictors/fragments/__generated__/liked_work_notification_fields_fragment.ast.gql.dart'
    as _i4;
import 'package:aipictors/fragments/__generated__/liked_works_summary_notification_fields_fragment.ast.gql.dart'
    as _i6;
import 'package:aipictors/fragments/__generated__/partial_sticker_fields_fragment.ast.gql.dart'
    as _i9;
import 'package:aipictors/fragments/__generated__/partial_user_fields_fragment.ast.gql.dart'
    as _i3;
import 'package:aipictors/fragments/__generated__/partial_work_fields_fragment.ast.gql.dart'
    as _i5;
import 'package:aipictors/fragments/__generated__/work_award_notification_fields_fragment.ast.gql.dart'
    as _i7;
import 'package:aipictors/fragments/__generated__/work_comment_notification_fields_fragment.ast.gql.dart'
    as _i8;
import 'package:aipictors/fragments/__generated__/work_comment_reply_notification_fields_fragment.ast.gql.dart'
    as _i10;
import 'package:gql/ast.dart' as _i1;

const ViewerNotifications = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'ViewerNotifications'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'offset')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'limit')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'viewer'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'notifications'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'offset'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'offset')),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'limit'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'limit')),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'LikedWorkNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'LikedWorkNotificationFields'),
                  directives: [],
                )
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'LikedWorksSummaryNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(
                      value: 'LikedWorksSummaryNotificationFields'),
                  directives: [],
                )
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'WorkAwardNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'WorkAwardNotificationFields'),
                  directives: [],
                )
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'WorkCommentNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'WorkCommentNotificationFields'),
                  directives: [],
                )
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'WorkCommentReplyNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name:
                      _i1.NameNode(value: 'WorkCommentReplyNotificationFields'),
                  directives: [],
                )
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'FollowNotificationNode'),
                isNonNull: false,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'FollowNotificationFields'),
                  directives: [],
                )
              ]),
            ),
          ]),
        )
      ]),
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [
  ViewerNotifications,
  _i2.FollowNotificationFields,
  _i3.PartialUserFields,
  _i4.LikedWorkNotificationFields,
  _i5.PartialWorkFields,
  _i6.LikedWorksSummaryNotificationFields,
  _i7.WorkAwardNotificationFields,
  _i8.WorkCommentNotificationFields,
  _i9.PartialStickerFields,
  _i10.WorkCommentReplyNotificationFields,
]);
