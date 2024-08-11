unit gchecksum;

interface

uses
  common_GLIB, gtypes, garray;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGChecksumType = ^TGChecksumType;
  TGChecksumType = longint;

const
  G_CHECKSUM_MD5 = 0;
  G_CHECKSUM_SHA1 = 1;
  G_CHECKSUM_SHA256 = 2;
  G_CHECKSUM_SHA512 = 3;
  G_CHECKSUM_SHA384 = 4;

type
  TGChecksum = record
  end;
  PGChecksum = ^TGChecksum;

function g_checksum_type_get_length(checksum_type: TGChecksumType): Tgssize; cdecl; external libglib2;
function g_checksum_new(checksum_type: TGChecksumType): PGChecksum; cdecl; external libglib2;
procedure g_checksum_reset(checksum: PGChecksum); cdecl; external libglib2;
function g_checksum_copy(checksum: PGChecksum): PGChecksum; cdecl; external libglib2;
procedure g_checksum_free(checksum: PGChecksum); cdecl; external libglib2;
procedure g_checksum_update(checksum: PGChecksum; Data: Pguchar; length: Tgssize); cdecl; external libglib2;
function g_checksum_get_string(checksum: PGChecksum): Pgchar; cdecl; external libglib2;
procedure g_checksum_get_digest(checksum: PGChecksum; buffer: Pguint8; digest_len: Pgsize); cdecl; external libglib2;
function g_compute_checksum_for_data(checksum_type: TGChecksumType; Data: Pguchar; length: Tgsize): Pgchar; cdecl; external libglib2;
function g_compute_checksum_for_string(checksum_type: TGChecksumType; str: Pgchar; length: Tgssize): Pgchar; cdecl; external libglib2;
function g_compute_checksum_for_bytes(checksum_type: TGChecksumType; Data: PGBytes): Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:21:15 ===


implementation



end.
