MODULE StreamsTest;  (** StreamsTest.Run: a file stream written and read back, a text written through TextStreams; needs the desktop's display *)

IMPORT Files, Texts, Streams, TextStreams, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR f: Files.File; S: Streams.Stream; s: ARRAY 16 OF CHAR; x: LONGINT; T: Texts.Text;
BEGIN
  fails := 0; checks := 0;
  f := Files.New("zq_test.bin"); S := Streams.OpenFileWriter(f, 0);
  Streams.WriteString(S, "hello"); Streams.WriteLInt(S, 123456789); Files.Register(f);
  f := Files.Old("zq_test.bin"); Check("the file written", f # NIL);
  IF f # NIL THEN
    S := Streams.OpenFileReader(f, 0); Streams.ReadString(S, s); Streams.ReadLInt(S, x);
    Check("read back", (s = "hello") & (x = 123456789))
  END;
  NEW(T); Texts.Open(T, ""); S := TextStreams.OpenWriter(T);
  TextStreams.WriteString(S, "abc"); TextStreams.WriteInt(S, 42, 0); TextStreams.WriteLn(S); S.Flush(S);
  Check("a text written", T.len >= 5);
  Out.String("StreamsTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END StreamsTest.
