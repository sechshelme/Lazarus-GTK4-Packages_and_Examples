/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 21-08-2024   19:51                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGNotification = record
  end;
  PGNotification = ^TGNotification;

function g_notification_get_type: TGType; cdecl; external libgio2;
function g_notification_new(title: Pgchar): PGNotification; cdecl; external libgio2;
procedure g_notification_set_title(notification: PGNotification; title: Pgchar); cdecl; external libgio2;
procedure g_notification_set_body(notification: PGNotification; body: Pgchar); cdecl; external libgio2;
procedure g_notification_set_icon(notification: PGNotification; icon: PGIcon); cdecl; external libgio2;
procedure g_notification_set_urgent(notification: PGNotification; urgent: Tgboolean); cdecl; external libgio2;
procedure g_notification_set_priority(notification: PGNotification; priority: TGNotificationPriority); cdecl; external libgio2;
procedure g_notification_set_category(notification: PGNotification; category: Pgchar); cdecl; external libgio2;
procedure g_notification_add_button(notification: PGNotification; _label: Pgchar; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_notification_add_button_with_target(notification: PGNotification; _label: Pgchar; action: Pgchar; target_format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_notification_add_button_with_target(notification: PGNotification; _label: Pgchar; action: Pgchar; target_format: Pgchar); cdecl; external libgio2;
procedure g_notification_add_button_with_target_value(notification: PGNotification; _label: Pgchar; action: Pgchar; target: PGVariant); cdecl; external libgio2;
procedure g_notification_set_default_action(notification: PGNotification; detailed_action: Pgchar); cdecl; external libgio2;
procedure g_notification_set_default_action_and_target(notification: PGNotification; action: Pgchar; target_format: Pgchar; args: array of const); cdecl; external libgio2;
procedure g_notification_set_default_action_and_target(notification: PGNotification; action: Pgchar; target_format: Pgchar); cdecl; external libgio2;
procedure g_notification_set_default_action_and_target_value(notification: PGNotification; action: Pgchar; target: PGVariant); cdecl; external libgio2;

// === Konventiert am: 20-8-24 17:27:36 ===

function G_TYPE_NOTIFICATION: TGType;
function G_NOTIFICATION(obj: Pointer): PGNotification;
function G_IS_NOTIFICATION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_NOTIFICATION: TGType;
begin
  G_TYPE_NOTIFICATION := g_notification_get_type;
end;

function G_NOTIFICATION(obj: Pointer): PGNotification;
begin
  Result := PGNotification(g_type_check_instance_cast(obj, G_TYPE_NOTIFICATION));
end;

function G_IS_NOTIFICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NOTIFICATION);
end;



{$ENDIF read_implementation}
