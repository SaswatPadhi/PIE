open Batteries
open QCheck.Arbitrary
open TestGen
open Escher_types
open Escher_core
open Escher_components
open Escher_synth
open Pie

let extra_comps = default_list @ default_char @ [ str_getc ; str_containsc ]

(*** String.length ***)

let slengthRes = fun ?(pind=(-1)) () ->
let name = "slength" in
let f = String.length in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.get ***)

let sget = (fun (s, i) -> String.get s i)

(* here we learn the precise conditions under which an exception is thrown:  i<0 or len(s) <= i
   however, we have no i<0 predicate, so it's expressed in a more complicated way:
   [Neg "i > 0"; Neg "len(s) > i"]; [Neg "i = 0"; Pos "len(s) = i"]
   they are equivalent given the fact that the length of a string is never negative.
*)

let sgetRes = fun ?(pind=(-1)) () ->
let name = "sget" in
let f = sget in
let arguments = [ "s" ; "i" ] in
let tests = string_int_tests () in
let dumper = string_int_dumper in
let typ = [ TString ; TInt ] in
let tfun = fun (s, i) -> [ of_string s ; of_int i ] in
let def_features = (*PYF:t|T(s:S,i:I)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I)|C*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.set ***)

let sset = (fun (s, i, c) -> let sc = String.copy s in String.set sc i c ; sc)

let ssetRes = fun ?(pind=(-1)) () ->
let name = "sset" in
let f = sset in
let arguments = [ "s" ; "i" ; "c" ] in
let tests = string_int_char_tests () in
let dumper = string_int_char_dumper in
let typ = [ TString ; TInt ; TChar ] in
let tfun = fun (s, i, c) -> [ of_string s ; of_int i ; of_char c ] in
let def_features = (*PYF:t|T(s:S,i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I,c:C)|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.create ***)

let screateRes = fun ?(pind=(-1)) () ->
let name = "screate" in
let f = String.create in
let arguments = [ "i" ] in
let tests = int_tests () in
let dumper = int_dumper in
let typ = [ TInt ] in
let tfun = fun i -> [ of_int i ] in
let def_features = (*PYF:i|I*) in
let my_features = [] in
let def_postconditions = (*PYP:i|I|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.make ***)

let smake = fun (i,c) -> String.make i c;;

let smakeRes = fun ?(pind=(-1)) () ->
let name = "smake" in
let f = smake in
let arguments = [ "i" ; "c" ] in
let tests = int_char_tests () in
let dumper = int_char_dumper in
let typ = [ TInt ; TChar ] in
let tfun = fun (i,c) -> [ of_int i ; of_char c ] in
let def_features = (*PYF:a|T(i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:a|T(i:I,c:C)|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.copy ***)

let scopyRes = fun ?(pind=(-1)) () ->
let name = "scopy" in
let f = String.copy in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.sub ***)

let ssub = (fun (s, i1, i2) -> String.sub s i1 i2)

let ssubRes = fun ?(pind=(-1)) () ->
let name = "ssub" in
let f = ssub in
let arguments = [ "s" ; "i1" ; "i2" ] in
let tests = string_int_int_tests () in
let dumper = string_int_int_dumper in
let typ = [ TString ; TInt ; TInt ] in
let tfun = fun (s, i1, i2) -> [ of_string s ; of_int i1 ; of_int i2 ] in
let def_features = (*PYF:t|T(s:S,i1:I,i2:I)*) in
let my_features = [] in
let def_postconditions =  (*PYP:t|T(s:S,i1:I,i2:I)|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.fill ***)

let sfill = (fun (s,i0,i1,c) -> let sc = String.copy s in String.fill s i0 i1 c ; sc)

let sfillRes = fun ?(pind=(-1)) () ->
let name = "sfill" in
let f = sfill in
let arguments = [ "s" ; "i0" ; "i1" ; "c" ] in
let tests = string_int_int_char_tests () in
let dumper = string_int_int_char_dumper in
let typ = [ TString ; TInt ; TInt ; TChar ] in
let tfun = fun (s,i0,i1,c) -> [ of_string s ; of_int i0 ; of_int i1 ; of_char c ] in
let def_features = (*PYF:a|T(s0:S,i0:I,i1:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s0:S,i0:I,i1:I,c:C)|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.blit ***)

let sblit = (fun (s0,i0,s1,i1,il) -> let sc = String.copy s0 in String.blit s0 i0 s1 i1 il ; sc)

let sblitRes = fun ?(pind=(-1)) () ->
let name = "sblit" in
let f = sblit in
let arguments = [ "s0" ; "i0" ; "s1" ; "i1" ; "il" ] in
let tests = string_int_string_int_int_tests () in
let dumper = string_int_string_int_int_dumper in
let typ = [ TString ; TInt ; TString ; TInt ; TInt ] in
let tfun = fun (s0,i0,s1,i1,il) -> [ of_string s0 ; of_int i0 ; of_string s1 ; of_int i1 ; of_int il ] in
let def_features = (*PYF:a|T(s0:S,i0:I,s1:S,i1:I,il:I)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s0:S,i0:I,s1:S,i1:I,il:I)|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.concat ***)

let sconcat = (fun (s,sl) -> String.concat s sl)

let sconcatRes = fun ?(pind=(-1)) () ->
let name = "sconcat" in
let f = sconcat in
let arguments = [ "s" ; "sl" ] in
let tests = string_stringList_tests () in
let dumper = string_stringList_dumper in
let typ = [ TString ; TList ] in
let tfun = fun (s, sl) -> [ of_string s ; of_list of_string sl ] in
let def_features = (*PYF:t|T(s:S,sl:L(S))*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,sl:L(S))|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.trim ***)

let strimRes = fun ?(pind=(-1)) () ->
let name = "strim" in
let f = String.trim in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.escaped ***)

let sescapedRes = fun ?(pind=(-1)) () ->
let name = "sescaped" in
let f = String.escaped in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.index ***)

let sindex = (fun (s,c) -> String.index s c)

let sindexRes = fun ?(pind=(-1)) () ->
let name = "sindex" in
let f = sindex in
let arguments = [ "s" ; "c" ] in
let tests = string_char_tests () in
let dumper = string_char_dumper in
let typ = [ TString ; TChar ] in
let tfun = fun (s, c) -> [ of_string s ; of_char c ] in
let def_features = (*PYF:t|T(s:S,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,c:C)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.rindex ***)

let srindex = (fun (s,c) -> String.rindex s c)

let srindexRes = fun ?(pind=(-1)) () ->
let name = "srindex" in
let f = srindex in
let arguments = [ "s" ; "c" ] in
let tests = string_char_tests () in
let dumper = string_char_dumper in
let typ = [ TString ; TChar ] in
let tfun = fun (s, c) -> [ of_string s ; of_char c ] in
let def_features = (*PYF:t|T(s:S,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,c:C)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.index_from ***)

let sindex_from = (fun (s,i,c) -> String.index_from s i c)

let sindex_fromRes = fun ?(pind=(-1)) () ->
let name = "sindex_from" in
let f = sindex_from in
let arguments = [ "s" ; "i" ; "c" ] in
let tests = string_int_char_tests () in
let dumper = string_int_char_dumper in
let typ = [ TString ; TInt; TChar ] in
let tfun = fun (s, i, c) -> [ of_string s ; of_int i; of_char c ] in
let def_features = (*PYF:t|T(s:S,i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I,c:C)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.rindex_from ***)

let srindex_from = (fun (s,i,c) -> String.rindex_from s i c)

let srindex_fromRes = fun ?(pind=(-1)) () ->
let name = "srindex_from" in
let f = srindex_from in
let arguments = [ "s" ; "i" ; "c" ] in
let tests = string_int_char_tests () in
let dumper = string_int_char_dumper in
let typ = [ TString ; TInt; TChar ] in
let tfun = fun (s, i, c) -> [ of_string s ; of_int i; of_char c ] in
let def_features = (*PYF:t|T(s:S,i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I,c:C)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.contains ***)

let scontains = (fun (s,c) -> String.contains s c)

let scontainsRes = fun ?(pind=(-1)) () ->
let name = "scontains" in
let f = scontains in
let arguments = [ "s" ; "c" ] in
let tests = string_char_tests () in
let dumper = string_char_dumper in
let typ = [ TString ; TChar ] in
let tfun = fun (s, c) -> [ of_string s ; of_char c ] in
let def_features = (*PYF:t|T(s:S,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,c:C)|B*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.contains_from ***)

let scontains_from = (fun (s,i,c) -> String.contains_from s i c)

let scontains_fromRes = fun ?(pind=(-1)) () ->
let name = "scontains_from" in
let f = scontains_from in
let arguments = [ "s" ; "i" ; "c" ] in
let tests = string_int_char_tests () in
let dumper = string_int_char_dumper in
let typ = [ TString ; TInt; TChar ] in
let tfun = fun (s, i, c) -> [ of_string s ; of_int i; of_char c ] in
let def_features = (*PYF:t|T(s:S,i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I,c:C)|B*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.rcontains_from ***)

let srcontains_from = (fun (s,i,c) -> String.rcontains_from s i c)

let srcontains_fromRes = fun ?(pind=(-1)) () ->
let name = "srcontains_from" in
let f = srcontains_from in
let arguments = [ "s" ; "i" ; "c" ] in
let tests = string_int_char_tests () in
let dumper = string_int_char_dumper in
let typ = [ TString ; TInt; TChar ] in
let tfun = fun (s, i, c) -> [ of_string s ; of_int i; of_char c ] in
let def_features = (*PYF:t|T(s:S,i:I,c:C)*) in
let my_features = [] in
let def_postconditions = (*PYP:t|T(s:S,i:I,c:C)|B*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;



(*** String.uppercase ***)

let suppercaseRes = fun ?(pind=(-1)) () ->
let name = "suppercase" in
let f = String.uppercase in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.lowercase ***)

let slowercaseRes = fun ?(pind=(-1)) () ->
let name = "slowercase" in
let f = String.lowercase in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.capitalize ***)

let scapitalizeRes = fun ?(pind=(-1)) () ->
let name = "scapitalize" in
let f = String.capitalize in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.uncapitalize ***)

let suncapitalizeRes = fun ?(pind=(-1)) () ->
let name = "suncapitalize" in
let f = String.uncapitalize in
let arguments = [ "s" ] in
let tests = string_tests () in
let dumper = string_dumper in
let typ = [ TString ] in
let tfun = fun s -> [ of_string s ] in
let def_features = (*PYF:s|S*) in
let my_features = [] in
let def_postconditions = (*PYP:s|S|S*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


(*** String.compare ***)

let scompare = fun (s0,s1) -> String.compare s0 s1;;

let scompareRes = fun ?(pind=(-1)) () ->
let name = "scompare" in
let f = scompare in
let arguments = [ "s0" ; "s1" ] in
let tests = string_string_tests () in
let dumper = string_string_dumper in
let typ = [ TString ; TString ] in
let tfun = fun (s0, s1) -> [ of_string s0 ; of_string s1 ] in
let def_features = (*PYF:a|T(s0:S,s1:S)*) in
let my_features = [] in
let def_postconditions = (*PYP:a|T(s0:S,s1:S)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, dumper) ~record:name ~comps:extra_comps
                           ~arg_names:arguments f tests features
                           (if pind = (-1) then postconds else [List.nth postconds pind]) trans
;;


let () =
    test_size := __TEST_SIZE__ ;
    max_conflict_set_size := __MAX_CONFLICT_SET_SIZE__ ;
    let run = (fun ((s, f) : (string * (?pind:int -> unit -> 'a))) ->
                  output_string stderr ("\n\n=== (" ^ (string_of_int __FUNCTION_INDEX__) ^ ") " ^ s ^ " ===\n") ;
                  print_specs stderr (f ~pind:__POST_INDEX__ ())) in
    run (List.nth [ ("String.length(s)", slengthRes) ;
                    ("String.get(s, i)", sgetRes) ;
                    ("String.set(s, i, c)", ssetRes) ;
                    ("String.create(i)", screateRes) ;
                    ("String.make(i,c)", smakeRes) ;
                    ("String.copy(s)", scopyRes) ;
                    ("String.sub(s,i1,i2)", ssubRes) ;
                    ("String.fill(s, i0, i1, c)", sfillRes) ;
                    ("String.blit(s0, i0, s1, i1, il)", sblitRes) ;
                    ("String.concat(s, sl)", sconcatRes) ;
                    ("String.trim(s)", strimRes) ;
                    ("String.escaped(s)", sescapedRes) ;
                    ("String.index(s, c)", sindexRes) ;
                    ("String.rindex(s, c)", srindexRes) ;
                    ("String.index_from(s, i, c)", sindex_fromRes);
                    ("String.rindex_from(s, i, c)", srindex_fromRes);
                    ("String.contains(s, c)", scontainsRes) ;
                    ("String.contains_from(s, i, c)", scontains_fromRes);
                    ("String.rcontains_from(s, i, c)", srcontains_fromRes) ;
                    ("String.uppercase(s)", suppercaseRes);
                    ("String.lowercase(s)", slowercaseRes) ;
                    ("String.capitalize(s)", scapitalizeRes) ;
                    ("String.uncapitalize(s)", suncapitalizeRes) ;
                    ("String.compare(s0, s1)", scompareRes) ] __FUNCTION_INDEX__)
