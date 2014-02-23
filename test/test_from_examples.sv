//
// test_from_examples.sv - a test generated from code examples
//

import cl::*;

module test_from_examples;
  task automatic test;
    $display( "==========starting test_from_examples==========" );
    // test ../src/cl_text.svh
    begin
      assert( text::capitalize( "capitalize me!" ) == "Capitalize me!" );
    end
    begin
      assert( text::center( "center me", 15 )                 == "   center me   " );
      assert( text::center( "center me", 15, "-" )            == "---center me---" );
      assert( text::center( "center me", 7 )                  ==    "center me"    ); // widened to fit
      assert( text::center( "center me", 7, .trim_ends( 1 ) ) ==     "enter m"     ); // trimmed
    end
    begin
      assert( text::change( "a primary library", "function", .start_pos( 10 ) ) == "a primary function" );
      //                               |---->|
      //                              10
    end
    begin
      assert( text::chomp( "abc"     ) == "abc" );
      assert( text::chomp( "abc\n"   ) == "abc" );
      assert( text::chomp( "abc\n\n" ) == "abc\n" );
    end
    begin
      assert( text::chop( "abc" ) == "c" );
      assert( text::chop( "abc\n" ) == "\n" );
    end
    begin
      $display( text::colorize( "display me in red", FG_RED ) );
    end
    begin
      assert( text::contains( "a primary library", "primary" )                  == 1 );
      assert( text::contains( "a primary library", "primary", .start_pos( 3 ) ) == 0 );
      //                          |----------->|
      //                          3
      assert( text::contains( "a primary library", "primary", .end_pos(  7 ) )  == 0 );
      //                       |----->|
      //                              7
      assert( text::contains( "a primary library", "primary", .end_pos( -9 ) )  == 1 );
      //                       |------>|
      //                              -9
    end
    begin
      assert( text::contains_str( "a primary library", "primary" )                  == "primary" );
      assert( text::contains_str( "a primary library", "primary", .start_pos( 3 ) ) == "" );
      //                              |----------->|
      //                              3
      assert( text::contains_str( "a primary library", "primary", .end_pos(  7 ) )  == "" );
      //                           |----->|
      //                                  7
      assert( text::contains_str( "a primary library", "primary", .end_pos( -9 ) )  == "primary" );
      //                           |------>|
      //                                  -9
    end
    begin
      assert( text::count( "a primary library", "ary" )                  == 2 );
      assert( text::count( "a primary library", "ary", .start_pos( 3 ) ) == 2 );
      //                       |----------->|
      //                       3
      assert( text::count( "a primary library", "ary", .end_pos(  7 ) )  == 0 );
      //                    |----->|
      //                           7
      assert( text::count( "a primary library", "ary", .end_pos( -9 ) )  == 1 );
      //                    |------>|
      //                           -9
    end
    begin
      assert( text::delete( "abcabc", "abc"    ) == "" );
      assert( text::delete( "abcabc", "abc", 1 ) == "abc" );
    end
    begin
      assert( text::ends_with( "a primary library", { "primary", "library" } )                  == 1 );
      assert( text::ends_with( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 1 );
      //                           |----------->|
      //                           3
      assert( text::ends_with( "a primary library", { "primary", "library" }, .end_pos(  7 ) )  == 0 );
      //                        |----->|
      //                               7
      assert( text::ends_with( "a primary library", { "primary", "library" }, .end_pos( -9 ) )  == 1 );
      //                        |------>|
      //                               -9
    end
    begin
      assert( text::find_any( "a primary library", { "primary", "library" } ) ==  2 );
      assert( text::find_any( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 10 );
      //                          |----------->|
      //                          3
      assert( text::find_any( "a primary library", { "primary", "library" }, .end_pos(  7 ) ) == -1 );
      //                       |----->|
      //                              7
      assert( text::find_any( "a primary library", { "primary", "library" }, .end_pos( -9 ) ) ==  2 );
      //                       |------>|
      //                              -9
    end
    begin
      assert( text::hash( "my hash value is" ) == 32'he4260597 );
    end
    begin
      assert( text::index( "a primary library", "ary" )                  ==  6 );
      assert( text::index( "a primary library", "ary", .start_pos( 3 ) ) ==  6 );
      //                       |----------->|
      //                       3  
      assert( text::index( "a primary library", "ary", .end_pos(  7 ) )  == -1 );
      //                    |----->|
      //                           7
      assert( text::index( "a primary library", "ary", .end_pos( -9 ) )  ==  6 );
      //                    |------>|
      //                           -9
    end
    begin
      assert( text::insert( "abc", "XYZ"     ) == "XYZabc" ); // insert "XYZ" before the first character ("a")
      assert( text::insert( "abc", "XYZ",  1 ) == "aXYZbc" ); // insert "XYZ" before the character index 1 ("b")
      assert( text::insert( "abc", "XYZ", -1 ) == "abXYZc" ); // insert "XYZ" before the last character ("c")
    end
    begin
      assert( text::is_alpha( "abc"  ) == 1 );
      assert( text::is_alpha( "abc_" ) == 0 );
    end
    begin
      assert( text::is_digit( "123"  ) == 1 );
      assert( text::is_digit( "123X" ) == 0 );
    end
    begin
      assert( text::is_lower( "abc"   ) == 1 );
      assert( text::is_lower( "abcX"  ) == 0 );
      assert( text::is_lower( "abc!?" ) == 1 ); // all cased characters are lowercase
    end
    begin
      assert( text::is_printable( "!@#$" ) == 1 );
      assert( text::is_printable( "\200" ) == 0 ); // ASCII 'h80 is not printable
    end
    begin
      assert( text::is_single_bit_type( "bit" ) == 1 );
      assert( text::is_single_bit_type( "int" ) == 0 );
    end
    begin
      assert( text::is_space( " \t\n" ) == 1 );
      assert( text::is_space( "X\t\n" ) == 0 );
    end
    begin
      assert( text::is_upper( "ABC"   ) == 1 );
      assert( text::is_upper( "ABCx"  ) == 0 );
      assert( text::is_upper( "ABC!?" ) == 1 ); // all cased characters are uppercase
    end
    begin
      assert( text::join_str( { "abc", "XYZ" }        ) == "abcXYZ"    );
      assert( text::join_str( { "abc", "XYZ" }, "---" ) == "abc---XYZ" );
    end
    begin
      assert( text::lc_first( "Lower CASE first" ) == "lower CASE first" );
    end
    begin
      assert( text::ljust( "ljust me", 15 )                  == "ljust me       " );
      assert( text::ljust( "ljust me", 15, "-" )             == "ljust me-------" );
      assert( text::ljust( "ljust me", 7 )                   == "ljust me"        ); // widened to fit
      assert( text::ljust( "ljust me", 7, .trim_right( 1 ) ) == "ljust m"         ); // trimmed
    end
    begin
      assert( text::lstrip( "      abc" ) == "abc" );
      assert( text::lstrip( "  \t\nabc" ) == "abc" );
      assert( text::lstrip( "aabbcc", "a"  ) == "bbcc" );
      assert( text::lstrip( "aabbcc", "ab" ) == "cc"   );
      assert( text::lstrip( "aabbcc", "ba" ) == "cc"   ); // "b"s and "a"s are stripped
    end
    begin
      assert( text::only( "abc", "abcXYZ" ) == 1 );
      assert( text::only( "abcXYZ", "abc" ) == 0 );
    end
    begin
      assert( text::partition( "abc-XYZ", "-" ) == '{ "abc", "-", "XYZ" } );
      assert( text::partition( "abcabc",  "a" ) == '{ "", "a", "bcabc" } );
      assert( text::partition( "abcabc",  "b" ) == '{ "a", "b", "cabc" } );
      assert( text::partition( "abcabc",  "c" ) == '{ "ab", "c", "abc" } );
      assert( text::partition( "abcabc",  "X" ) == '{ "abcabc", "", "" } );
    end
    begin
      assert( text::replace( "abcabc", "abc", "XYZ"    ) == "XYZXYZ" );
      assert( text::replace( "abcabc", "abc", "XYZ", 1 ) == "XYZabc" );
    end
    begin
      assert( text::reverse( "reverse me!" ) == "!em esrever" );
      assert( text::reverse( "wonton? not now" ) == "won ton ?notnow" );
    end
    begin
      assert( text::rfind_any( "a primary library", { "primary", "library" } )                  == 10 );
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .start_pos( 3 ) ) == 10 );
      //                           |----------->|
      //                           3
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .end_pos(  7 ) )  == -1 );
      //                        |----->|
      //                               7
      assert( text::rfind_any( "a primary library", { "primary", "library" }, .end_pos( -9 ) )  ==  2 );
      //                        |------>|
      //                               -9
    end
    begin
      assert( text::rindex( "a primary library", "ary" )                  == 14 );
      assert( text::rindex( "a primary library", "ary", .start_pos( 3 ) ) == 14 );
      //                        |----------->|
      //                        3
      assert( text::rindex( "a primary library", "ary", .end_pos(  7 ) )  == -1 );
      //                     |----->|
      //                            7
      assert( text::rindex( "a primary library", "ary", .end_pos( -9 ) )  ==  6 );
      //                     |------>|
      //                            -9
    end
    begin
      assert( text::rjust( "rjust me", 15 )                 == "       rjust me" );
      assert( text::rjust( "rjust me", 15, "-" )            == "-------rjust me" );
      assert( text::rjust( "rjust me", 7 )                  ==        "rjust me" ); // widened to fit
      assert( text::rjust( "rjust me", 7, .trim_left( 1 ) ) ==         "just me" ); // trimmed
    end
    begin
      assert( text::rpartition( "abc-XYZ", "-" ) == '{ "abc", "-", "XYZ" } );
      assert( text::rpartition( "abcabc",  "a" ) == '{ "abc", "a", "bc" } );
      assert( text::rpartition( "abcabc",  "b" ) == '{ "abca", "b", "c" } );
      assert( text::rpartition( "abcabc",  "c" ) == '{ "abcab", "c", "" } );
      assert( text::rpartition( "abcabc",  "X" ) == '{ "abcabc", "", "" } );
    end
    begin
      assert( text::rsplit( "  abc  pqr  xyz  "                  ) == '{ "abc", "pqr", "xyz" } );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 1 ) ) == '{ "  abc  pqr", "xyz" } );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 2 ) ) == '{ "  abc", "pqr", "xyz" } );
      assert( text::rsplit( "  abc  pqr  xyz  ", .max_split( 3 ) ) == '{ "abc", "pqr", "xyz" } );
      
      assert( text::rsplit( "--abc--pqr--xyz--", "--"                  ) == '{ "", "abc", "pqr", "xyz", "" } );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 1 ) ) == '{ "--abc--pqr--xyz", "" } );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 2 ) ) == '{ "--abc--pqr", "xyz", "" } );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 3 ) ) == '{ "--abc", "pqr", "xyz", "" } );
      assert( text::rsplit( "--abc--pqr--xyz--", "--", .max_split( 4 ) ) == '{ "", "abc", "pqr", "xyz", "" } );
    end
    begin
      assert( text::rstrip( "abc      " ) == "abc" );
      assert( text::rstrip( "abc  \t\n" ) == "abc" );
      assert( text::rstrip( "aabbcc", "c"  ) == "aabb" );
      assert( text::rstrip( "aabbcc", "bc" ) == "aa"   );
      assert( text::rstrip( "aabbcc", "cb" ) == "aa"   ); // "c"s and "b"s are stripped
    end
    begin
      assert( text::slice( "slice me",  2,  6 ) == "ice m" );
      assert( text::slice( "slice me", -6, -2 ) == "ice m" );
    end
    begin
      assert( text::slice_len( "slice me",  2, 5 ) == "ice m" );
      assert( text::slice_len( "slice me", -6, 5 ) == "ice m" );
    end
    begin
      assert( text::split( "  abc  pqr  xyz  "                  ) == '{ "abc", "pqr", "xyz" } );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 1 ) ) == '{ "abc", "pqr  xyz  " } );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 2 ) ) == '{ "abc", "pqr", "xyz  " } );
      assert( text::split( "  abc  pqr  xyz  ", .max_split( 3 ) ) == '{ "abc", "pqr", "xyz" } );
      
      assert( text::split( "--abc--pqr--xyz--", "--"                  ) == '{ "", "abc", "pqr", "xyz", "" } );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 1 ) ) == '{ "", "abc--pqr--xyz--" } );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 2 ) ) == '{ "", "abc", "pqr--xyz--" } );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 3 ) ) == '{ "", "abc", "pqr", "xyz--" } );
      assert( text::split( "--abc--pqr--xyz--", "--", .max_split( 4 ) ) == '{ "", "abc", "pqr", "xyz", "" } );
    end
    begin
      assert( text::starts_with( "a primary library", { "a primary", "library" } )                   == 1 );
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .start_pos( 10 ) ) == 1 );
      //                                    |---->|
      //                                   10
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .end_pos(  7 ) )  == 0 );
      //                          |----->|
      //                                 7
      assert( text::starts_with( "a primary library", { "a primary", "library" }, .end_pos( -9 ) )  == 1 );
      //                          |------>|
      //                                 -9
    end
    begin
      assert( text::strip( "   abc    " ) == "abc" );
      assert( text::strip( " \t\nabc\n" ) == "abc" );
      assert( text::strip( "aabbcc", "a"  ) == "bbcc" );
      assert( text::strip( "aabbcc", "ab" ) == "cc"   );
      assert( text::strip( "aabbcc", "ac" ) == "bb"   );
    end
    begin
      assert( text::swap_case( "Swap Case Me!" ) == "sWAP cASE mE!" );
    end
    begin
      assert( text::title_case( "title case me!" ) == "Title Case Me!" );
    end
    begin
      assert( text::trim( "trim me!"       ) == "trim me!" );
      assert( text::trim( "trim me!", 1, 2 ) ==  "rim m"   );
      assert( text::trim( "trim me!", 3, 4 ) ==    "m"     );
    end
    begin
      assert( text::uc_first( "upper CASE first" ) == "Upper CASE first" );
    end
    begin
      assert( text::untabify( "AB\tCDE\tFGHI\tJKLMN" ) == "AB      CDE     FGHI    JKLMN" );
      // tab positions: ^       ^       ^       ^
      assert( text::untabify( "AB\tCDE\tFGHI\tJKLMN", 4 ) == "AB  CDE FGHI    JKLMN" );
      // tab positions:    ^   ^   ^   ^   ^   ^
      assert( text::untabify( "AB\nCDE\tFGHI\tJKLMN", 4 ) == "AB\nCDE FGHI    JKLMN" );
      // tab positions:    ^   ^   ^   ^   ^   ^
    end
    // test ../src/cl_pair.svh
    begin
      pair#(int, string) p = new( 1, "apple" );
      assert( p.first == 1 );
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      assert( p.second == "apple" );
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = new( 1, "apple" );
      assert( p.eq( q ) == 1 ); // 1 == 1 && "apple" == "apple"
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = new( 1, "orange" );
      assert( p.ne( q ) == 1 ); // "apple" != "orange"
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = new( 2, "apple" );
      assert( p.lt( q ) == 1 ); // 1 < 2
    end
    begin
      pair#(int, string) p = new( 1, "orange" );
      pair#(int, string) q = new( 1, "apple" );
      assert( p.gt( q ) == 1 ); // "orange" > "apple" by the lexicographical order
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = new( 1, "orange" );
      assert( p.le( q ) == 1 ); // "apple" < "orange" by the lexicographical order
    end
    begin
      pair#(int, string) p = new( 2, "apple" );
      pair#(int, string) q = new( 1, "orange" );
      assert( p.ge( q ) == 1 ); // 2 > 1
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = p.clone();
      assert( p.eq( q ) == 1 );
    end
    begin
      pair#(int, string) p = new( 1, "apple" );
      pair#(int, string) q = new( 2, "orange" );
      p.swap( q );
      assert( p.first == 2 );
      assert( q.first == 1 );
      assert( p.second == "orange" );
      assert( q.second == "apple" );
    end
    // test ../src/cl_tuple.svh
    begin
      tuple#(int,string,bit[7:0]) t = new( 1, "apple", 8'hFF );
      assert( t.first == 1 );
    end
    begin
      tuple#(int,string,bit[7:0]) t = new( 1, "apple", 8'hFF );
      assert( t.second == "apple" );
    end
    begin
      tuple#(int,string,bit[7:0]) t = new( 1, "apple", 8'hFF );
      assert( t.third == 8'hFF );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4 );
      assert( t.fourth == 4 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5 );
      assert( t.fifth == 5 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5, 6 );
      assert( t.sixth == 6 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5, 6, 7 );
      assert( t.seventh == 7 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5, 6, 7, 8 );
      assert( t.eighth == 8 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5, 6, 7, 8, 9 );
      assert( t.ninth == 9 );
    end
    begin
      tuple#() t = new( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );
      assert( t.tenth == 10 );
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple", 8'hFF );
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple", 8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 1, "apple", 8'hFF );
      assert( t.eq( u ) == 1 ); // 1 == 1 && "apple" == "apple" && 8'hFF == 8'hFF
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple",  8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 1, "orange", 8'hFF );
      assert( t.ne( u ) == 1 ); // "apple" != "orange"
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple", 8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 2, "apple", 8'hFF );
      assert( t.lt( u ) == 1 ); // 1 < 2
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "orange", 8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 1, "apple",  8'hFF );
      assert( t.gt( u ) == 1 ); // "orange" > "apple" by the lexicographical order
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple",  8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 1, "orange", 8'hFF );
      assert( t.le( u ) == 1 ); // "apple" < "orange" by the lexicographical order
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 2, "apple",  8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 1, "orange", 8'hFF );
      assert( t.ge( u ) == 1 ); // 2 > 1
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple",  8'hFF );
      tuple#(int, string, bit[7:0]) u = t.clone();
      assert( t.eq( u ) == 1 );
    end
    begin
      tuple#(int, string, bit[7:0]) t = new( 1, "apple",  8'hFF );
      tuple#(int, string, bit[7:0]) u = new( 2, "orange", 8'hAA );
      t.swap( u );
      assert( t.first == 2 );
      assert( u.first == 1 );
      assert( t.second == "orange" );
      assert( u.second == "apple" );
      assert( t.third == 8'hAA );
      assert( u.third == 8'hFF );
    end
    // test ../src/cl_packed_array.svh
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      assert( packed_array#(bit,8)::from_unpacked_array( ua                ) == 8'hD8 ); // bit[7:0]
      assert( packed_array#(bit,8)::from_unpacked_array( ua, .reverse( 1 ) ) == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      assert( packed_array#(bit,8)::to_unpacked_array( pa                ) == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( packed_array#(bit,8)::to_unpacked_array( pa, .reverse( 1 ) ) == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      assert( packed_array#(bit,8)::from_dynamic_array( da                ) == 8'hD8 ); // bit[7:0]
      assert( packed_array#(bit,8)::from_dynamic_array( da, .reverse( 1 ) ) == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      bit da[];
      
      da = packed_array#(bit,8)::to_dynamic_array( pa );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      da = packed_array#(bit,8)::to_dynamic_array( pa, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      assert( packed_array#(bit,8)::from_queue( q                ) == 8'hD8 ); // bit[7:0]
      assert( packed_array#(bit,8)::from_queue( q, .reverse( 1 ) ) == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      bit q[$];
      
      q = packed_array#(bit,8)::to_queue( pa );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      q = packed_array#(bit,8)::to_queue( pa, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit[7:0] pa;
      
      packed_array#(bit,8)::ua_to_pa( ua, pa );
      assert( pa == 8'hD8 ); // bit[7:0]
      
      packed_array#(bit,8)::ua_to_pa( ua, pa, .reverse( 1 ) );
      assert( pa == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      bit ua[8];
      
      packed_array#(bit,8)::pa_to_ua( pa, ua );
      assert( ua == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      packed_array#(bit,8)::pa_to_ua( pa, ua, .reverse( 1 ) );
      assert( ua == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      bit[7:0] pa;
      
      packed_array#(bit,8)::da_to_pa( da, pa );
      assert( pa == 8'hD8 ); // bit[7:0]
      
      packed_array#(bit,8)::da_to_pa( da, pa, .reverse( 1 ) );
      assert( pa == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      bit da[] = new[8]; // set the size of da[]
      
      packed_array#(bit,8)::pa_to_da( pa, da );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      packed_array#(bit,8)::pa_to_da( pa, da, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit[7:0] pa;
      
      packed_array#(bit,8)::q_to_pa( q, pa );
      assert( pa == 8'hD8 ); // bit[7:0]
      
      packed_array#(bit,8)::q_to_pa( q, pa, .reverse( 1 ) );
      assert( pa == 8'h1B );
    end
    begin
      bit[7:0] pa = 8'hD8;
      bit q[$] = { 0, 0, 0, 0, 0, 0, 0, 0 }; // with 8 items
      
      packed_array#(bit,8)::pa_to_q( pa, q );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      packed_array#(bit,8)::pa_to_q( pa, q, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit[7:0] pa;
      packed_array#(bit,8)::init( pa, 1'b1 );
      assert( pa == 8'hFF );
    end
    begin
      bit[7:0] pa = 8'h0F;
      packed_array#(bit,8)::reverse( pa );
      assert( pa == 8'hF0 );
    end
    begin
      bit[15:0] pa = 16'h1234; // 16'b0001_0010_0011_0100
      assert( packed_array#(bit,16)::count_ones( pa ) == 5 );
    end
    begin
      bit[15:0] pa = 16'h1234; // 16'b0001_0010_0011_0100
      assert( packed_array#(bit,16)::count_zeros( pa ) == 11 );
    end
    begin
      logic[15:0] pa = 16'b0000_1111_xxxx_zzzz;
      assert( packed_array#(logic,16)::count_unknowns( pa ) == 4 );
    end
    begin
      logic[15:0] pa = 16'b0000_1111_xxxx_zzzz;
      assert( packed_array#(logic,16)::count_hizs( pa ) == 4 );
    end
    // test ../src/cl_unpacked_array.svh
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      assert( unpacked_array#(bit,8)::from_dynamic_array( da                ) == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( unpacked_array#(bit,8)::from_dynamic_array( da, .reverse( 1 ) ) == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit da[];
      
      da = unpacked_array#(bit,8)::to_dynamic_array( ua );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      da = unpacked_array#(bit,8)::to_dynamic_array( ua, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      assert( unpacked_array#(bit,8)::from_queue( q                ) == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( unpacked_array#(bit,8)::from_queue( q, .reverse( 1 ) ) == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit q[$];
      
      q = unpacked_array#(bit,8)::to_queue( ua );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      q = unpacked_array#(bit,8)::to_queue( ua, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      bit ua[8];
      
      unpacked_array#(bit,8)::da_to_ua( da, ua );
      assert( ua == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      unpacked_array#(bit,8)::da_to_ua( da, ua, .reverse( 1 ) );
      assert( ua == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit da[] = new[8]; // set the size of da[]
      
      unpacked_array#(bit,8)::ua_to_da( ua, da );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      unpacked_array#(bit,8)::ua_to_da( ua, da, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit ua[8];
      
      unpacked_array#(bit,8)::q_to_ua( q, ua );
      assert( ua == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      unpacked_array#(bit,8)::q_to_ua( q, ua, .reverse( 1 ) );
      assert( ua == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit q[$]  =  { 0, 0, 0, 0, 0, 0, 0, 0 }; // with 8 items
      
      unpacked_array#(bit,8)::ua_to_q( ua, q );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      unpacked_array#(bit,8)::ua_to_q( ua, q, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8];
      unpacked_array#(bit,8)::init( ua, 1'b1 );
      assert( ua == '{ 1, 1, 1, 1, 1, 1, 1, 1 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 0, 1, 1, 1, 1 };
      unpacked_array#(bit,8)::reverse( ua );
      assert( ua == '{ 1, 1, 1, 1, 0, 0, 0, 0 } );
    end
    begin
      bit ua1[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 };
      bit ua2[8] = '{ 1, 1, 0, 1, 1, 0, 0, 0 };
      //                    |<------>|
      //                    2        5
      assert( unpacked_array#(bit,8)::compare( ua1, ua2 ) == 0 );
      assert( unpacked_array#(bit,8)::compare( ua1, ua2, 
      .from_index1( 2 ), .to_index1( 5 ), 
      .from_index2( 2 ), .to_index2( 5 ) ) == 1 );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      assert( unpacked_array#(bit,8)::to_string( ua )                    == "0 0 0 1 1 0 1 1" );
      assert( unpacked_array#(bit,8)::to_string( ua, .separator( "-" ) ) == "0-0-0-1-1-0-1-1" );
      assert( unpacked_array#(bit,8)::to_string( ua, .from_index( 4 )  ) ==         "1 0 1 1" );
    end
    // test ../src/cl_dynamic_array.svh
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // same as ua[0:7]
      bit da[];
      
      da = dynamic_array#(bit,8)::from_unpacked_array( ua );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      da = dynamic_array#(bit,8)::from_unpacked_array( ua, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( dynamic_array#(bit,8)::to_unpacked_array( da                ) == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( dynamic_array#(bit,8)::to_unpacked_array( da, .reverse( 1 ) ) == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit da[];
      
      da = dynamic_array#(bit)::from_queue( q );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      da = dynamic_array#(bit)::from_queue( q, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      bit q[$];
      
      q = dynamic_array#(bit)::to_queue( da );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      q = dynamic_array#(bit)::to_queue( da, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit da[] = new[8]; // set the size of da[]
      
      dynamic_array#(bit,8)::ua_to_da( ua, da );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      dynamic_array#(bit,8)::ua_to_da( ua, da, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      bit ua[8];
      
      dynamic_array#(bit,8)::da_to_ua( da, ua );
      assert( ua == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      dynamic_array#(bit,8)::da_to_ua( da, ua, .reverse( 1 ) );
      assert( ua == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit da[] = new[8]; // set the size of da[]
      
      dynamic_array#(bit)::q_to_da( q, da );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      dynamic_array#(bit)::q_to_da( q, da, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      bit q[$]  =  { 0, 0, 0, 0, 0, 0, 0, 0 }; // with 8 items
      
      dynamic_array#(bit)::da_to_q( da, q );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      dynamic_array#(bit)::da_to_q( da, q, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8];
      dynamic_array#(bit)::init( da, 1'b1 );
      assert( da == '{ 1, 1, 1, 1, 1, 1, 1, 1 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 0, 1, 1, 1, 1 } ); // da[0] to da[7]
      dynamic_array#(bit)::reverse( da );
      assert( da == '{ 1, 1, 1, 1, 0, 0, 0, 0 } );
    end
    begin
      bit da[] = new[7]( '{ 0, 0, 0, 1, 1, 0, 1 } ); // da[0] to da[6]
      bit da0[], da1[];
      
      dynamic_array#(bit)::split( da, da0, da1 );
      assert( da0 == '{ 0, 0, 1, 1 } ); // da[0], da[2], da[4], da[6]
      assert( da1 == '{ 0, 1, 0 } );    // da[1], da[3], da[5]
      
      dynamic_array#(bit)::split( da, da0, da1, .pad( 1 ) );
      assert( da0 == '{ 0, 0, 1, 1 } ); // da[0], da[2], da[4], da[6]
      assert( da1 == '{ 0, 1, 0, 0 } ); // da[1], da[3], da[5], 0 (padded with the default value of bit type)
    end
    begin
      int da0[] = new[4]( '{ 0, 0, 0, 0 } );
      int da1[] = new[6]( '{ 1, 2, 3, 4, 5, 6 } );
      int da[];
      
      da = dynamic_array#(int)::merge( da0, da1 );
      assert( da == '{ 0, 1, 0, 2, 0, 3, 0, 4, 5, 6 } );
      
      da = dynamic_array#(int)::merge( da0, da1, .truncate( 1 ) );
      assert( da == '{ 0, 1, 0, 2, 0, 3, 0, 4 } );
    end
    begin
      int da0[] = new[4]( '{ 0, 0, 0, 0 } );
      int da1[] = new[6]( '{ 1, 2, 3, 4, 5, 6 } );
      int da[];
      
      da = dynamic_array#(int)::concat( da0, da1 );
      assert( da == '{ 0, 0, 0, 0, 1, 2, 3, 4, 5, 6 } );
    end
    begin
      int da[] = new[10]( '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 } );
      int extracted[];
      
      extracted = dynamic_array#(int)::extract( da, 3, 7 );
      assert( extracted == '{ 3, 4, 5, 6, 7 } );
      
      extracted = dynamic_array#(int)::extract( da, 3, -3 );
      assert( extracted == '{ 3, 4, 5, 6, 7 } );
    end
    begin
      int da[] = new[10]( '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 } );
      int appended[];
      
      appended = dynamic_array#(int)::append( da, 10 );
      assert( appended == '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } );
      assert( da       == '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 } ); // not modified
    end
    begin
      bit da1[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      bit da2[] = new[8]( '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
      //                           |<------>|
      //                           2        5
      assert( dynamic_array#(bit)::compare( da1, da2 ) == 0 );
      assert( dynamic_array#(bit)::compare( da1, da2, 
      .from_index1( 2 ), .to_index1( 5 ), 
      .from_index2( 2 ), .to_index2( 5 ) ) == 1 );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      bit cloned[] = dynamic_array#(bit)::clone( da );
      assert( cloned == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( dynamic_array#(bit,8)::to_string( da )                    == "0 0 0 1 1 0 1 1" );
      assert( dynamic_array#(bit,8)::to_string( da, .separator( "-" ) ) == "0-0-0-1-1-0-1-1" );
      assert( dynamic_array#(bit,8)::to_string( da, .from_index( 4 )  ) ==         "1 0 1 1" );
    end
    // test ../src/cl_queue.svh
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // same as ua[0:7]
      bit q[$];
      
      q = queue#(bit,8)::from_unpacked_array( ua );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      q = queue#(bit,8)::from_unpacked_array( ua, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      assert( queue#(bit,8)::to_unpacked_array( q                ) == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      assert( queue#(bit,8)::to_unpacked_array( q, .reverse( 1 ) ) == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      bit q[$];
      
      q = queue#(bit)::from_dynamic_array( da );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      q = queue#(bit)::from_dynamic_array( da, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit da[];
      
      da = queue#(bit)::to_dynamic_array( q );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      da = queue#(bit)::to_dynamic_array( q, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit ua[8] = '{ 0, 0, 0, 1, 1, 0, 1, 1 }; // assigned to ua[0:7]
      bit q[$]  =  { 0, 0, 0, 0, 0, 0, 0, 0 }; // with 8 items
      
      queue#(bit,8)::ua_to_q( ua, q );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      queue#(bit,8)::ua_to_q( ua, q, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit ua[8];
      
      queue#(bit,8)::q_to_ua( q, ua );
      assert( ua == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      queue#(bit,8)::q_to_ua( q, ua, .reverse( 1 ) );
      assert( ua == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit da[] = new[8]( '{ 0, 0, 0, 1, 1, 0, 1, 1 } ); // da[0] to da[7]
      bit q[$]  =  { 0, 0, 0, 0, 0, 0, 0, 0 }; // with 8 items
      
      queue#(bit)::da_to_q( da, q );
      assert( q == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      queue#(bit)::da_to_q( da, q, .reverse( 1 ) );
      assert( q == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 }; // q[0] to q[7]
      bit da[] = new[8]; // set the size of da[]
      
      queue#(bit)::q_to_da( q, da );
      assert( da == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
      
      queue#(bit)::q_to_da( q, da, .reverse( 1 ) );
      assert( da == '{ 1, 1, 0, 1, 1, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 0, 0, 0, 0, 0 };
      queue#(bit)::init( q, 1'b1 );
      assert( q == '{ 1, 1, 1, 1, 1, 1, 1, 1 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 0, 1, 1, 1, 1 };
      queue#(bit)::reverse( q );
      assert( q == '{ 1, 1, 1, 1, 0, 0, 0, 0 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1 }; // q[0] to q[6]
      bit q0[$], q1[$];
      
      queue#(bit)::split( q, q0, q1 );
      assert( q0 == '{ 0, 0, 1, 1 } ); // q[0], q[2], q[4], q[6]
      assert( q1 == '{ 0, 1, 0 } );    // q[1], q[3], q[5]
      
      q0.delete();
      q1.delete();
      queue#(bit)::split( q, q0, q1, .pad( 1 ) );
      assert( q0 == '{ 0, 0, 1, 1 } ); // q[0], q[2], q[4], q[6]
      assert( q1 == '{ 0, 1, 0, 0 } ); // q[1], q[3], q[5], 0 (padded with the default value of bit type)
    end
    begin
      int q0[$] = { 0, 0, 0, 0 };
      int q1[$] = { 1, 2, 3, 4, 5, 6 };
      int q[$];
      
      q = queue#(int)::merge( q0, q1 );
      assert( q == '{ 0, 1, 0, 2, 0, 3, 0, 4, 5, 6 } );
      
      q = queue#(int)::merge( q0, q1, .truncate( 1 ) );
      assert( q == '{ 0, 1, 0, 2, 0, 3, 0, 4 } );
    end
    begin
      int q0[$] = { 0, 0, 0, 0 };
      int q1[$] = { 1, 2, 3, 4, 5, 6 };
      int q[$];
      
      q = queue#(int)::concat( q0, q1 );
      assert( q == '{ 0, 0, 0, 0, 1, 2, 3, 4, 5, 6 } );
    end
    begin
      int q[$] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
      int extracted[$];
      
      extracted = queue#(int)::extract( q, 3, 7 );
      assert( extracted == '{ 3, 4, 5, 6, 7 } );
      
      extracted = queue#(int)::extract( q, 3, -3 );
      assert( extracted == '{ 3, 4, 5, 6, 7 } );
    end
    begin
      int q[$] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
      int appended[$];
      
      appended = queue#(int)::append( q, 10 );
      assert( appended == '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } );
      assert( q        == '{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 } ); // not modified
    end
    begin
      bit q1[$] = { 0, 0, 0, 1, 1, 0, 1, 1 };
      bit q2[$] = { 1, 1, 0, 1, 1, 0, 0, 0 };
      //                  |<------>|
      //                  2        5
      assert( queue#(bit)::compare( q1, q2 ) == 0 );
      assert( queue#(bit)::compare( q1, q2, 
      .from_index1( 2 ), .to_index1( 5 ), 
      .from_index2( 2 ), .to_index2( 5 ) ) == 1 );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 };
      bit cloned[] = queue#(bit)::clone( q );
      assert( cloned == '{ 0, 0, 0, 1, 1, 0, 1, 1 } );
    end
    begin
      bit q[$] = { 0, 0, 0, 1, 1, 0, 1, 1 };
      assert( queue#(bit,8)::to_string( q )                    == "0 0 0 1 1 0 1 1" );
      assert( queue#(bit,8)::to_string( q, .separator( "-" ) ) == "0-0-0-1-1-0-1-1" );
      assert( queue#(bit,8)::to_string( q, .from_index( 4 )  ) ==         "1 0 1 1" );
    end
    // test ../src/cl_data_stream.svh
    begin
      bit[7:0] ds[] = new[2]( '{ 8'h0F, 8'hAA } );
      bit bs[];
      
      bs = data_stream#(bit,8)::to_bit_stream( ds );
      assert( bs == '{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0 } );
      
      bs = data_stream#(bit,8)::to_bit_stream( ds, .msb_first( 0 ) );
      assert( bs == '{ 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1 } );
    end
    begin
      bit[7:0] ds[] = new[4]( '{ 8'h00, 8'h01, 8'h02, 8'h03 } );
      bit[7:0] new_ds[];
      
      new_ds = data_stream#(bit,8)::make_divisible( ds, .divisible_by( 3 ), .padding( 8'hFF ) );
      assert( new_ds == '{ 8'h00, 8'h01, 8'h02, 8'h03, 8'hFF, 8'hFF } );
    end
    begin
      bit[7:0] ds[];
      ds = data_stream#(bit,8)::sequential( .length( 8 ), .init_value( 8'hFE ) );
      assert( ds == '{ 8'hFE, 8'hFF, 8'h00, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05 } );
      
      ds = data_stream#(bit,8)::sequential( .length( 8 ), .init_value( 8'hFE ), .step( 2 ) );
      assert( ds == '{ 8'hFE, 8'h00, 8'h02, 8'h04, 8'h06, 8'h08, 8'h0A, 8'h0C } );
      
      ds = data_stream#(bit,8)::sequential( .length( 8 ), .init_value( 8'hFE ), .step( -1 ) );
      assert( ds == '{ 8'hFE, 8'hFD, 8'hFC, 8'hFB, 8'hFA, 8'hF9, 8'hF8, 8'hF7 } );
    end
    begin
      bit[7:0] ds[];
      ds = data_stream#(bit,8)::constant( .length( 8 ), .value( 8'hAB ) );
      assert( ds == '{ 8'hAB, 8'hAB, 8'hAB, 8'hAB, 8'hAB, 8'hAB, 8'hAB, 8'hAB } );
    end
    begin
      bit[7:0] ds[];
      ds = data_stream#(bit,8)::random( .length( 16 ) );
      $display( data_stream#(bit,8)::to_string( ds, .group( 1 ) ) );
    end
    begin
      bit[7:0] ds[] = new[8]( '{ 8'h00, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07 } );
      bit[7:0] scrambled[];
      scrambler_16#(bit) scrblr = new;
      bit[15:0] lfsr = '1;
      
      scrambled = data_stream#(bit,8,16)::scramble( ds, scrblr, lfsr ); // DEGREE=16
      $display( data_stream#(bit,8)::to_string( scrambled, .group( 1 ) ) );
    end
    begin
      bit[15:0] ds16[] = new[7]( '{ 16'h0123, 16'h4567, 16'h89ab, 16'hcdef, 16'h0000, 16'h0001, 16'h1000 } );
      assert( data_stream#(bit,16)::
      to_string( ds16 ) == "0123456789abcdef000000011000" );
      assert( data_stream#(bit,16)::
      to_string( ds16, .group( 1 ) ) == "0123 4567 89ab cdef 0000 0001 1000" );
      assert( data_stream#(bit,16)::
      to_string( ds16, .group( 1 ), .num_head( 2 ), .num_tail( 0 ) ) == "0123 4567 ... " );
      assert( data_stream#(bit,16)::
      to_string( ds16, .group( 1 ), .num_head( 0 ), .num_tail( 2 ) ) == "... 0001 1000" );
      assert( data_stream#(bit,16)::
      to_string( ds16, .group( 1 ), .num_head( 2 ), .num_tail( 2 ) ) == "0123 4567 ... 0001 1000" );
    end
    begin
      bit[7:0] ds8[] = new[10]( '{ 8'h10, 8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16, 8'h17, 8'h18, 8'h19 } );
      bit      en[]  = new[10]( '{ 1'b1,  1'b0,  1'b1,  1'b0,  1'b1,  1'b0,  1'b1,  1'b0,  1'b1,  1'b0  } );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en ) == "10--12--14--16--18--" );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en, .group(1) ) == "10 -- 12 -- 14 -- 16 -- 18 --" );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en, .group(2) ) == "10-- 12-- 14-- 16-- 18--" );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en, .group(1), .group_separator("|") ) == "10|--|12|--|14|--|16|--|18|--" );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en, .group(1), .num_head(2), .num_tail(2) ) == "10 -- ...18 --" );
      assert( data_stream#(bit,8)::
      to_string_with_en( ds8, en, .group(1), .disabled_char("*") ) == "10 ** 12 ** 14 ** 16 ** 18 **" );
    end
    // test ../src/cl_bit_stream.svh
    begin
      bit bs[];
      bs = bit_stream#(bit)::alternate( 8, .init_value( 1 ) );
      assert( bs == '{ 1, 0, 1, 0, 1, 0, 1, 0 } );
    end
    begin
      bit bs[] = new[16]( '{ 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1 } );
      assert( bit_stream#(bit)::count_zeros( bs ) == 8 );
    end
    begin
      bit bs[] = new[16]( '{ 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1 } );
      assert( bit_stream#(bit)::count_ones( bs ) == 8 );
    end
    begin
      logic bs[] = new[16]( '{ 0, 0, 0, 0, 1, 1, 1, 1, 'x, 'x, 'x, 'x, 'z, 'z, 'z, 'z } );
      assert( bit_stream#(logic)::count_unknowns( bs ) == 4 );
    end
    begin
      logic bs[] = new[16]( '{ 0, 0, 0, 0, 1, 1, 1, 1, 'x, 'x, 'x, 'x, 'z, 'z, 'z, 'z } );
      assert( bit_stream#(logic)::count_hizs( bs ) == 4 );
    end
    // test ../src/cl_set_base.svh
    begin
      set#(int) int_set0 = new();
      set#(int) int_set1 = new();
      
      void'( int_set0.add( 123 ) );
      void'( int_set1.add( 123 ) );
      assert( int_set0.equals( int_set1 ) == 1 );
    end
    begin
      set#(int) int_set0 = new();
      set#(int) int_set1 = new();
      
      void'( int_set0.add( 123 ) );
      void'( int_set0.add( 456 ) );
      void'( int_set1.add( 123 ) );
      assert( int_set0.remove_all( int_set1 ) == 1 );
    end
    // test ../src/cl_set.svh
    begin
      set#(int) int_set = new();
    end
    begin
      set#(int) int_set = new();
      
      assert( int_set.add( 123 ) == 1 );
      assert( int_set.add( 123 ) == 0 ); // 123 is already in the set
    end
    begin
      set#(int) int_set = new();
      
      int_set.clear();
    end
    begin
      set#(int) int_set = new();
      collection#(int) cloned;
      
      cloned = int_set.clone();
    end
    begin
      set#(int) int_set = new();
      
      void'( int_set.add( 123 ) );
      assert( int_set.contains( 123 ) == 1 );
      assert( int_set.contains( 456 ) == 0 );
    end
    begin
      set#(int) int_set = new();
      
      assert( int_set.is_empty() == 1 );
      void'( int_set.add( 123 ) );
      assert( int_set.is_empty() == 0 );
    end
    begin
      set#(int) int_set = new();
      iterator#(int) it;
      
      void'( int_set.add( 123 ) );
      void'( int_set.add( 456 ) );
      it = int_set.get_iterator();
      while ( it.has_next() ) $display( it.next() ); // 123 456
    end
    begin
      set#(int) int_set = new();
      
      void'( int_set.add( 123 ) );
      assert( int_set.remove( 123 ) == 1 );
      assert( int_set.remove( 123 ) == 0 ); // already removed
    end
    begin
      set#(int) int_set = new();
      
      void'( int_set.add( 123 ) );
      assert( int_set.size() == 1 );
    end
    // test ../src/cl_deque.svh
    begin
      deque#(int) int_dq = new();
    end
    begin
      deque#(int) int_dq = new();
      
      assert( int_dq.add( 123 ) == 1 );
    end
    begin
      deque#(int) int_dq = new();
      
      int_dq.add_first( 123 );
    end
    begin
      deque#(int) int_dq = new();
      
      int_dq.add_last( 123 );
    end
    begin
      deque#(int) int_dq = new();
      
      int_dq.clear();
    end
    begin
      deque#(int) int_dq = new();
      collection#(int) cloned;
      
      cloned = int_dq.clone();
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.contains( 123 ) == 1 );
      assert( int_dq.contains( 456 ) == 0 );
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.get( i ) == 1 );
      assert( i == 123 );
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.get_first( i ) == 1 );
      assert( i == 123 );
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.get_last( i ) == 1 );
      assert( i == 123 );
    end
    begin
      deque#(int) int_dq = new();
      iterator#(int) it;
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      it = int_dq.get_iterator();
      while ( it.has_next() ) $display( it.next() ); // 123 456
    end
    begin
      deque#(int) int_dq = new();
      iterator#(int) it;
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      it = int_dq.get_descending_iterator();
      while ( it.has_next() ) $display( it.next() ); // 456 123
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.peek( i ) == 1 );
      assert( i == 123 );
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.peek_first( i ) == 1 );
      assert( i == 123 );
    end
    begin
      deque#(int) int_dq = new();
      int i;
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.peek_last( i ) == 1 );
      assert( i == 456 );
    end
    begin
      deque#(int) int_dq = new();
      
      int_dq.push( 123 );
      int_dq.push( 456 );
      assert( int_dq.pop() == 456 );
    end
    begin
      deque#(int) int_dq = new();
      
      int_dq.push( 123 );
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.remove( 123 ) == 1 );
      assert( int_dq.remove( 789 ) == 0 );
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.remove_first() == 1 );
      assert( int_dq.remove_first() == 0 ); // deque is empty
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.remove_last() == 1 );
      assert( int_dq.remove_last() == 0 ); // deque is empty
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.remove_first_occurrence( 123 ) == 1 );
      assert( int_dq.remove_first_occurrence( 789 ) == 0 );
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      void'( int_dq.add( 456 ) );
      assert( int_dq.remove_last_occurrence( 123 ) == 1 );
      assert( int_dq.remove_last_occurrence( 789 ) == 0 );
    end
    begin
      deque#(int) int_dq = new();
      
      void'( int_dq.add( 123 ) );
      assert( int_dq.size() == 1 );
    end
    // test ../src/cl_kitchen_timer.svh
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      @kt.ring;
      assert( kt.get_elapsed() == 100 );
    end
    begin
      kitchen_timer kt = new();
      time random_delay = kt.set_random_delay( 100, 200 );
      kt.start();
      @kt.ring;
      assert( kt.get_elapsed() == random_delay );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      @kt.ring;
      assert( kt.get_elapsed() == 100 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #50 kt.stop();
      assert( kt.get_elapsed() == 50 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #50 kt.pause();
      assert( kt.get_elapsed() == 50 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #30 kt.pause();
      assert( kt.get_elapsed() == 30 );
      kt.resume();
      @kt.ring;
      assert( kt.get_elapsed() == 70 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      @kt.ring;
      assert( kt.get_elapsed() == 100 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #30;
      assert( kt.get_remaining() == 70 );
      @kt.ring;
      assert( kt.get_remaining() == 0 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #30;
      assert( kt.is_stopped() == 0 );
      @kt.ring;
      assert( kt.is_stopped() == 1 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #30;
      assert( kt.is_running() == 1 );
      @kt.ring;
      assert( kt.is_running() == 0 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #50 kt.pause();
      assert( kt.is_paused() == 1 );
      kt.resume();
      #10;
      assert( kt.is_paused() == 0 );
    end
    begin
      kitchen_timer kt = new();
      kt.set_delay( 100 );
      kt.start();
      #50 kt.pause();
      assert( kt.get_state() == kitchen_timer::PAUSED );
      kt.resume();
      #10;
      assert( kt.get_state() == kitchen_timer::RUNNING );
    end
    // test ../src/cl_journal.svh
    begin
      journal::log( "request", "master", "slave" );
      #100;
      journal::log( "response", "slave", "master" );
      
      /* the journal file */
      // master->slave: @0 request
      // slave->master: @100 response
    end
    // test ../src/cl_choice.svh
    begin
      assert( choice#(int)::min( 1, 2 ) == 1 );
    end
    begin
      assert( choice#(int)::max( 1, 2 ) == 2 );
    end
    // test ../src/cl_putil.svh
    begin
      int x = 0;
      int y = 1;
      putil#(int)::swap( x, y );
      assert( x == 1 );
      assert( y == 0 );
    end
    // test ../src/cl_util.svh
    begin
      assert( util::num_oct_digits( 3 ) == 1 ); //  3'b111 -> 1'o7
      assert( util::num_oct_digits( 4 ) == 2 ); // 4'b1111 -> 2'o17
    end
    begin
      assert( util::num_dec_digits( 3 ) == 1 ); //  3'b111 -> 1'd7
      assert( util::num_dec_digits( 4 ) == 2 ); // 4'b1111 -> 2'd15
    end
    begin
      assert( util::num_hex_digits( 3 ) == 1 ); //  3'b111 -> 1'h7
      assert( util::num_hex_digits( 4 ) == 1 ); // 4'b1111 -> 1'hF
    end
    $display( "==========finished test_from_examples==========" );
  endtask: test

  initial test();
endmodule: test_from_examples