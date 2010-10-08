


The README file                                                  M. Rose
                                            Dover Beach Consulting, Inc.
                                                               B. Fenner
                                                   Arista Networks, Inc.
                                                               C. Levert
                                                            October 2009


                           xml2rfc v1.35pre1


Table of Contents

   1.      Introduction . . . . . . . . . . . . . . . . . . . . . . .  2
   2.      Requirements . . . . . . . . . . . . . . . . . . . . . . .  3
   3.      Testing  . . . . . . . . . . . . . . . . . . . . . . . . .  4
   3.1.    Testing under a windowing system . . . . . . . . . . . . .  4
   3.2.    Testing without a windowing system . . . . . . . . . . . .  4
   4.      Next steps . . . . . . . . . . . . . . . . . . . . . . . .  5
   4.1.    Processing Instructions  . . . . . . . . . . . . . . . . .  5
   4.1.1.  Option Settings  . . . . . . . . . . . . . . . . . . . . .  5
   4.1.2.  Include Files  . . . . . . . . . . . . . . . . . . . . . . 10
   5.      The Page Model . . . . . . . . . . . . . . . . . . . . . . 12
   6.      Additions to RFC 2629  . . . . . . . . . . . . . . . . . . 13
   6.1.    Extra Attributes . . . . . . . . . . . . . . . . . . . . . 13
   6.2.    Typed-Artwork Interpretation . . . . . . . . . . . . . . . 14
   7.      Limitations of xml2rfc . . . . . . . . . . . . . . . . . . 16
   8.      References . . . . . . . . . . . . . . . . . . . . . . . . 17
   A.      MacOS 9 Installation (courtesy of Ned Freed) . . . . . . . 18
   B.      rfc2629.xslt (courtesy of Julian Reschke)  . . . . . . . . 19
   C.      MS-Windows XP/Cygwin Installation (courtesy of Joe
           Touch) . . . . . . . . . . . . . . . . . . . . . . . . . . 20
   D.      A Special Thanks . . . . . . . . . . . . . . . . . . . . . 21
   E.      Copyrights . . . . . . . . . . . . . . . . . . . . . . . . 22
           Authors' Addresses . . . . . . . . . . . . . . . . . . . . 23
















Rose, et al.                                                    [Page 1]

README                      xml2rfc v1.35pre1               October 2009


1.  Introduction

   This is a package to convert memos written in XML to the RFC format.

   If you don't want to install any software, you can use the web-based
   service [4].













































Rose, et al.                                                    [Page 2]

README                      xml2rfc v1.35pre1               October 2009


2.  Requirements

   You need to have Tcl/Tk version 8 running on your system.  Tcl is a
   scripting language, Tk is Tcl with support for your windowing system.

   To get a source or binary distribution for your system, go to the Tcl
   Developer Xchange website [5] and install it.  If you get the binary
   distribution, this is pretty simple.

   Of course, you may already have Tcl version 8.  To find out, try
   typing this command from the shell (or the "MS-DOS Prompt"):

       % tclsh

   If the program launches, you're good to go with Tcl version 8.

   If you are running under a windowing system (e.g., X or MS-Windows),
   you can also try:

       % wish

   If a new window comes up along with a "Console" window, then you're
   good to go with Tk version 8.

   Finally, you may notice a file called "xml2sgml.tcl" in the
   distribution.  It contains some extra functionality for a few special
   users -- so, if you don't know what it is, don't worry about it...
























Rose, et al.                                                    [Page 3]

README                      xml2rfc v1.35pre1               October 2009


3.  Testing

   Now test your installation.

3.1.  Testing under a windowing system

   Type this command from the shell:

       % xml2rfc.tcl

   A new window should come up that looks like this:

       +------------------------------------------------------------+
       |                     Convert XML to RFC                     |
       |                                                            |
       |  Select input file: ____________________________  [Browse] |
       |                                                            |
       | Select output file: ____________________________  [Browse] |
       |                                                            |
       |               [Convert]               [Quit]               |
       |                                                            |
       +------------------------------------------------------------+

   Fill-in the blanks and click on [Convert].

3.2.  Testing without a windowing system

   Type this command from the shell:

       % tclsh

   If the program launches, type this command to it:

       % source xml2rfc.tcl

   and you should see these five lines:

       invoke as "xml2rfc   input-file output-file"
              or "xml2txt   input-file"
              or "xml2html  input-file"
              or "xml2nroff input-file"
              or "xml2unpg  input-file"









Rose, et al.                                                    [Page 4]

README                      xml2rfc v1.35pre1               October 2009


4.  Next steps

   Read the 2629bis [6] document.  In particular, Section 3 has some
   good information.

4.1.  Processing Instructions

   A _processing instruction_ contains directives to an XML application.
   If you want to give directives to *xml2rfc*, the processing
   instructions (PIs) look like this:

       <?rfc keyword='value'?>

   Of course, if you like the default behavior, you don't need any
   behavior-modifying directives in your input file!  Although *xml2rfc*
   supports putting several attribute-like directives in one PI, be
   warned that there are issues in doing this for a non-include-file
   directive following an include-file directive (Section 4.1.2).  It is
   good practice to always surround the value with either single or
   double quotes.

4.1.1.  Option Settings

   The list of valid keywords are:

   +---------------------+--------------+------------------------------+
   |             keyword |    default   | meaning                      |
   +---------------------+--------------+------------------------------+
   |    artworkdelimiter |      ""      | when producing txt or nroff  |
   |                     |              | files, use this string to    |
   |                     |              | delimit artwork              |
   |                     |              |                              |
   |        artworklines |       0      | when producing txt or nroff  |
   |                     |              | files, add this many blank   |
   |                     |              | lines around artwork         |
   |                     |              |                              |
   |          authorship |      yes     | render author information    |
   |                     |              |                              |
   |          autobreaks |      yes     | automatically force page     |
   |                     |              | breaks to avoid widows and   |
   |                     |              | orphans (not perfect)        |
   |                     |              |                              |
   |          background |      ""      | when producing a html file,  |
   |                     |              | use this image               |
   |                     |              |                              |
   |          colonspace |      no      | put two spaces instead of    |
   |                     |              | one after each colon (":")   |
   |                     |              | in txt or nroff files        |



Rose, et al.                                                    [Page 5]

README                      xml2rfc v1.35pre1               October 2009


   |            comments |      no      | render <cref> information    |
   |                     |              |                              |
   |             compact | (rfcedstyle) | when producing a txt/nroff   |
   |                     |              | file, try to conserve        |
   |                     |              | vertical whitespace (the     |
   |                     |              | default value is the current |
   |                     |              | value of the rfcedstyle PI)  |
   |                     |              |                              |
   |          docmapping |      no      | use hierarchical tags (e.g., |
   |                     |              | <h1>, <h2>, etc.) for        |
   |                     |              | (sub)section titles          |
   |                     |              |                              |
   |             editing |      no      | insert editing marks for     |
   |                     |              | ease of discussing draft     |
   |                     |              | versions                     |
   |                     |              |                              |
   |          emoticonic |      no      | automatically replaces input |
   |                     |              | sequences such as "|*text|"  |
   |                     |              | by, e.g.,                    |
   |                     |              | "<strong>text</strong>" in   |
   |                     |              | html output                  |
   |                     |              |                              |
   |              footer |      ""      | override the center footer   |
   |                     |              | string                       |
   |                     |              |                              |
   |              header |      ""      | override the leftmost header |
   |                     |              | string                       |
   |                     |              |                              |
   |             include |      n/a     | see Section 4.1.2            |
   |                     |              |                              |
   |              inline |      no      | if comments is "yes", then   |
   |                     |              | render comments inline;      |
   |                     |              | otherwise render them in an  |
   |                     |              | "Editorial Comments" section |
   |                     |              |                              |
   |         iprnotified |      no      | include boilerplate from     |
   |                     |              | Section 10.4(d) of [1]       |
   |                     |              |                              |
   |          linkmailto |      yes     | generate mailto: URL, as     |
   |                     |              | appropriate                  |
   |                     |              |                              |
   | notedraftinprogress |      yes     | generates "(work in          |
   |                     |              | progress)", as appropriate   |
   |                     |              |                              |







Rose, et al.                                                    [Page 6]

README                      xml2rfc v1.35pre1               October 2009


   |            linefile |      n/a     | a string like "35:file.xml"  |
   |                     |              | or just "35" (file name then |
   |                     |              | defaults to the containing   |
   |                     |              | file's real name or to the   |
   |                     |              | latest linefile              |
   |                     |              | specification that changed   |
   |                     |              | it) that will be used to     |
   |                     |              | override *xml2rfc*'s         |
   |                     |              | reckoning of the current     |
   |                     |              | input position (right after  |
   |                     |              | this PI) for warning and     |
   |                     |              | error reporting purposes     |
   |                     |              | (line numbers are 1-based)   |
   |                     |              |                              |
   |           needLines |      n/a     | an integer hint indicating   |
   |                     |              | how many contiguous lines    |
   |                     |              | are needed at this point in  |
   |                     |              | the output                   |
   |                     |              |                              |
   |             private |      ""      | produce a private memo       |
   |                     |              | rather than an RFC or        |
   |                     |              | Internet-Draft               |
   |                     |              |                              |
   |           refparent | "References" | title of the top-level       |
   |                     |              | section containing all       |
   |                     |              | references                   |
   |                     |              |                              |
























Rose, et al.                                                    [Page 7]

README                      xml2rfc v1.35pre1               October 2009


   |          rfcedstyle |      no      | attempt to closely follow    |
   |                     |              | finer details from the       |
   |                     |              | latest observable RFC-Editor |
   |                     |              | style so as to minimize the  |
   |                     |              | probability of being sent    |
   |                     |              | back corrections after       |
   |                     |              | submission; this directive   |
   |                     |              | is a kludge whose exact      |
   |                     |              | behavior is likely to change |
   |                     |              | on a regular basis to match  |
   |                     |              | the current flavor of the    |
   |                     |              | month; presently, it will    |
   |                     |              | capitalize the adjective     |
   |                     |              | "This" in automatically      |
   |                     |              | generated headings, use the  |
   |                     |              | variant "acknowledgement"    |
   |                     |              | spelling instead of Merriam  |
   |                     |              | Webster's main               |
   |                     |              | "acknowledgment" dictionary  |
   |                     |              | entry, use the "eMail"       |
   |                     |              | spelling instead of Knuth's  |
   |                     |              | more modern "email"          |
   |                     |              | spelling, only put one blank |
   |                     |              | line instead of two before   |
   |                     |              | top sections, omit           |
   |                     |              | "Intellectual Property and   |
   |                     |              | Copyright Statements" and    |
   |                     |              | "Author's Address" from the  |
   |                     |              | table of content, and not    |
   |                     |              | limit the indentation to a   |
   |                     |              | maximum tag length in        |
   |                     |              | <references> sections.       |
   |                     |              |                              |
   |          rfcprocack |      no      | if there already is an       |
   |                     |              | automatically generated      |
   |                     |              | Acknowledg(e)ment section,   |
   |                     |              | pluralize its title and add  |
   |                     |              | a short sentence             |
   |                     |              | acknowledging that *xml2rfc* |
   |                     |              | was used in the document's   |
   |                     |              | production to process an     |
   |                     |              | input XML source file in     |
   |                     |              | RFC-2629 format              |
   |                     |              |                              |
   |              slides |      no      | when producing a html file,  |
   |                     |              | produce multiple files for a |
   |                     |              | slide show                   |
   |                     |              |                              |



Rose, et al.                                                    [Page 8]

README                      xml2rfc v1.35pre1               October 2009


   |            sortrefs |      no      | sort references              |
   |                     |              |                              |
   |              strict |      no      | try to enforce the ID-nits   |
   |                     |              | conventions and DTD validity |
   |                     |              |                              |
   |          subcompact |   (compact)  | if compact is "yes", then    |
   |                     |              | you can make things a little |
   |                     |              | less compact by setting this |
   |                     |              | to "no" (the default value   |
   |                     |              | is the current value of the  |
   |                     |              | compact PI)                  |
   |                     |              |                              |
   |             symrefs |      yes     | use anchors rather than      |
   |                     |              | numbers for references       |
   |                     |              |                              |
   |                 toc |      no      | generate a table-of-contents |
   |                     |              |                              |
   |         tocappendix |      yes     | control whether the word     |
   |                     |              | "Appendix" appears in the    |
   |                     |              | table-of-content             |
   |                     |              |                              |
   |            tocdepth |       3      | if toc is "yes", then this   |
   |                     |              | determines the depth of the  |
   |                     |              | table-of-contents            |
   |                     |              |                              |
   |           tocindent |      yes     | if toc is "yes", then        |
   |                     |              | setting this to "yes" will   |
   |                     |              | indent subsections in the    |
   |                     |              | table-of-contents            |
   |                     |              |                              |
   |           tocnarrow |      yes     | affects horizontal spacing   |
   |                     |              | in the table-of-content      |
   |                     |              |                              |
   |           tocompact |      yes     | if toc is "yes", then        |
   |                     |              | setting this to "no" will    |
   |                     |              | make it a little less        |
   |                     |              | compact                      |
   |                     |              |                              |
   |            topblock |      yes     | put the famous header block  |
   |                     |              | on the first page            |
   |                     |              |                              |
   |             typeout |      n/a     | during processing pass 2,    |
   |                     |              | print the value to standard  |
   |                     |              | output at that point in      |
   |                     |              | processing                   |
   |                     |              |                              |





Rose, et al.                                                    [Page 9]

README                      xml2rfc v1.35pre1               October 2009


   |           useobject |      no      | when producing a html file,  |
   |                     |              | use the "<object>" html      |
   |                     |              | element with inner           |
   |                     |              | replacement content instead  |
   |                     |              | of the "<img>" html element, |
   |                     |              | when a source xml element    |
   |                     |              | includes an "src" attribute  |
   +---------------------+--------------+------------------------------+

   Remember that, as with everything else in XML, keywords and values
   are case-sensitive.

   With the exception of the "needLines", "typeout", and "include"
   directives, you normally put all of these processing instructions at
   the beginning of the document (right after the XML declaration).

4.1.2.  Include Files

   *xml2rfc* has an include-file facility, e.g.,

       <?rfc include='file'?>

   *xml2rfc* will consult the "XML_LIBRARY" environment variable for a
   search path of where to look for files.  (If this environment
   variable isn't set, the directory containing the file that contains
   the include-file directive is used.)  The file's contents are
   inserted right after the PI.  Putting non-include-file directives
   (especially needLines ones) after an include-file one in the same PI
   may not work as expected because of this.  Remember that file names
   are generally case-sensitive and that an input file that is
   distributed to the outside world may be processed on a different
   operating system than that used by its author.



















Rose, et al.                                                   [Page 10]

README                      xml2rfc v1.35pre1               October 2009


   You can also have *xml2rfc* set the "XML_LIBRARY" environment
   variable directly, by creating a file called ".xml2rfc.rc" in the
   directory where your main file is, e.g.,

   global env tcl_platform

   if {![string compare $tcl_platform(platform) windows]} {
       set sep ";"
   } else {
       set sep ":"
   }

   if {[catch { set env(XML_LIBRARY) } library]} {
       set library ""
       foreach bibxmlD [lsort -dictionary \
                              [glob -nocomplain $HOME/rfcs/bibxml/*]] {
           append library $sep$bibxmlD
       }
   }

   set nativeD [file nativename $inputD]
   if {[lsearch [split $library $sep] $nativeD] < 0} {
       set library "$nativeD$sep$library"
   }

   set env(XML_LIBRARY) $library

   There are links to various bibliographic databases (RFCs, I-Ds, and
   so on) on the *xml2rfc* homepage [4].






















Rose, et al.                                                   [Page 11]

README                      xml2rfc v1.35pre1               October 2009


5.  The Page Model

   The *html* rendering engine does not need to have a tightly defined
   page model.

   The *txt* and *nr* rendering engines assume the following page model.

   Each line has at most 72 columns from the left edge, including any
   left margin, but excluding the line terminator.  Every output
   character is from the ASCII repertoire and the only control character
   used is the line-feed (LF); the character-tabulation (HT) character
   is never used.

   Each page has the following lines (in 1-based numbering, as reported
   to the user, but contrary to *xml2rfc*'s internal 0-based numbering):

       1: header line (blank line on first page)

       2: blank line

       3: blank line

       4: 1st line of content

      ...

      51: 48th line of content

      52: blank line

      53: blank line

      54: blank line

      55: footer line

      56: form-feed character (followed by line terminator)

   Once processed through *nroff* and the "fix.sh" script (from
   2-nroff.template [7]), the *nr* output differs from this in two ways.
   It has three extra blank lines (that could be numbered -2, -1, and 0,
   for a total of six) at the very beginning of the document (so the
   first page is that much longer).  It also has no line terminator
   following the very last form-feed character of the file.  These
   differences originate in the design of the "fix.sh" script.

   Header and footer lines each have three parts: left, center, and
   right.



Rose, et al.                                                   [Page 12]

README                      xml2rfc v1.35pre1               October 2009


6.  Additions to RFC 2629

   A few additions have been made to the format originally defined in
   RFC 2629.  In particular, Appendix C of the 2629bis document
   enumerates the additions.

6.1.  Extra Attributes

   In addition, *xml2rfc* recognizes the undocumented "src", "alt",
   "width", and "height" attributes in the "figure" and "artwork"
   elements, but only if HTML is being generated.  Here are two
   examples, one for each case.

   Here, the attributes are added to the "artwork" element.

             <figure>
                 <preamble>This is the preamble.</preamble>
                 <artwork src='layers.png'
                          alt='[picture of layers only]'>
             .-----------.
             | ASCII art |
             `-----------'
             </artwork>
                 <postamble>This is the postamble.</postamble>
             </figure>

   In this case, the "preamble" and "postamble" elements are kept and an
   "img" tag is placed in the HTML output to replace the whole "artwork"
   element and its textual drawing, which are ignored.

   Here, the attributes are added to the "figure" element.

             <figure src='layers.png'
                     alt='[picture of layers and explanation]'>
                 <preamble>This is the preamble.</preamble>
                 <artwork>
             .-----------.
             | ASCII art |
             `-----------'
             </artwork>
                 <postamble>This is the postamble.</postamble>
             </figure>

   In this case, an "img" tag is placed in the HTML output to replace
   the whole contents of the "figure" element (the "preamble",
   "artwork", and "postamble" inner elements and the textual drawing
   itself) which are ignored.




Rose, et al.                                                   [Page 13]

README                      xml2rfc v1.35pre1               October 2009


   *xml2rfc* also recognizes an undocumented "align" attribute (with
   possible values "left", "center", or "right") in the "figure" and
   "artwork" elements.  It affects the whole content of the targeted
   element for all types of generated output.  Its default is inherited
   from the parent of its element.

6.2.  Typed-Artwork Interpretation

   The "artwork" element from RFC 2629 supports an optional "type"
   attribute.  While most possible values are just ignored, including
   the special case where the attribute is unspecified or just empty,
   some values are recognized.  In particular, "type='abnf'" can be used
   if the "artwork" contains an Augmented Backus-Naur Form (ABNF) syntax
   specification [3].  As a special extension in its _behavior_,
   *xml2rfc* will attempt to validate the syntax and colorize the HTML
   output of ABNF, since it is so widely used in RFCs.  It does this
   colorizing by relying on the full parsing it does right before, not
   on a quick and partial (e.g., line-by-line) pattern-based hack.  ABNF
   is the only artwork type to benefit from this kind of internal
   support at this time.  If the "strict" rfc-PI directive is activated,
   invalid ABNF content will cause *xml2rfc* to abort with an error
   message.  Omitting the "type" attribute altogether is the obvious way
   to avoid having this validation and colorizing performed.




























Rose, et al.                                                   [Page 14]

README                      xml2rfc v1.35pre1               October 2009


   For example (to be viewed in HTML):

         char-val       =  DQUOTE *(%x20-21 / %x23-7E) DQUOTE
                                ; quoted string of SP and VCHAR
                                   without DQUOTE

         num-val        =  "%" (bin-val / dec-val / hex-val)

         bin-val        =  "b" 1*BIT
                           [ 1*("." 1*BIT) / ("-" 1*BIT) ]
                                ; series of concatenated bit values
                                ; or single ONEOF range

         dec-val        =  "d" 1*DIGIT
                           [ 1*("." 1*DIGIT) / ("-" 1*DIGIT) ]

         hex-val        =  "x" 1*HEXDIG
                           [ 1*("." 1*HEXDIG) / ("-" 1*HEXDIG) ]

         prose-val      =  "<" *(%x20-3D / %x3F-7E) ">"
                                ; bracketed string of SP and VCHAR
                                   without angles
                                ; prose description, to be used as
                                   last resort

   This is from the original RFC on ABNF [2], with its minor mistakes in
   manually folded comment lines purposely left intact, for
   illustration.  Since the result is still valid ABNF (but incorrect
   with respect to what was intended), this showcases how colorizing
   might give a human author (or editor or reader) a better chance to
   spot the three mistakes (and correct them, e.g., with extra
   semicolons, as has been done in a more recent version [3] of the ABNF
   specification).  Note that it is the white space characters at the
   beginning of the subsequent lines (including the commented ones) that
   conspire to extend the reach of those rules across several lines.
















Rose, et al.                                                   [Page 15]

README                      xml2rfc v1.35pre1               October 2009


7.  Limitations of xml2rfc

   o  The "figure" element's "title" attribute is ignored, except when
      generating HTML.

   o  The "xref" element's "pageno" attribute is ignored.













































Rose, et al.                                                   [Page 16]

README                      xml2rfc v1.35pre1               October 2009


8.  References

   [1]  Bradner, S., "The Internet Standards Process -- Revision 3",
        BCP 9, RFC 2026, October 1996.

   [2]  Crocker, D., Ed. and P. Overell, "Augmented BNF for Syntax
        Specifications: ABNF", RFC 2234, November 1997.

   [3]  Crocker, D. and P. Overell, "Augmented BNF for Syntax
        Specifications: ABNF", RFC 4234, October 2005.

   [4]   <http://xml.resource.org/>

   [5]   <http://www.tcl.tk/software/tcltk/8.4.html>

   [6]   <draft-mrose-writing-rfcs.html>

   [7]   <ftp://ftp.rfc-editor.org/in-notes/rfc-editor/2-nroff.template>

   [8]   <http://greenbytes.de/tech/webdav/rfc2629.xslt>

   [9]   <http://greenbytes.de/tech/webdav/rfc2629xslt.zip>

   [10]  <http://greenbytes.de/tech/webdav/rfc2629xslt/rfc2629xslt.html>

   [11]  <http://www.cygwin.com/>

   [12]  <http://wiki.tcl.tk/2?cygwin>























Rose, et al.                                                   [Page 17]

README                      xml2rfc v1.35pre1               October 2009


Appendix A.  MacOS 9 Installation (courtesy of Ned Freed)

   1.  Install Tcl/Tk 8.3.4

   2.  When you performed Step 1, a folder in your "Extensions" folder
       called "Tool Command Language" was created.  Create a new folder
       under "Extensions", with any name you like.

   3.  Drag the file "xml2rfc.tcl" onto the "Drag & Drop Tclets"
       application that was installed in Step 1.

   4.  When asked for an appropriate "wish" stub, select "Wish 8.3.4".

   5.  The "Drag & Drop Tclets" application will write out an executable
       version of *xml2rfc*.




































Rose, et al.                                                   [Page 18]

README                      xml2rfc v1.35pre1               October 2009


Appendix B.  rfc2629.xslt (courtesy of Julian Reschke)

   The file "rfc2629.xslt" can be used with an XSLT-capable formatter
   (e.g., Saxon, Xalan, xsltproc, and most browsers) to produce HTML.  A
   word of warning though: the XSLT script only supports a limited
   subset of the processing instruction directives discussed earlier
   (Section 4.1).  The latest version [8] (and full distribution ZIP
   file [9]) can be downloaded from the original site which also hosts
   its documentation [10].










































Rose, et al.                                                   [Page 19]

README                      xml2rfc v1.35pre1               October 2009


Appendix C.  MS-Windows XP/Cygwin Installation (courtesy of Joe Touch)

   1.  install Cygwin: follow instructions at the Cygwin website [11]
       (also visit the Cygwin pages on the Tcl Wiki [12]), make sure to
       select "tcltk" in "Libs"

   2.  place a copy of xml2rfc files on a local drive, e.g., in
       "C:\xml2rfc" NOTE: for xml2rfc-1.26 and earlier, see NOTE below.

   3.  place a copy of bibxml* files on a local drive, e.g., in
       "C:\xmlbib\"

   4.  edit ".xml2rfc.rc" to indicate the "bibxml*" library path, e.g.,
       as per Step 3, change "~/rfca/bibxml/*" to "/cygdrive/c/xmlbib/*"

   5.  run xml2rfc as follows: "tclsh /cygdrive/c/xml2rfc/xml2rfc.tcl"

   NOTE: for xml2rfc-1.26 and earlier ONLY, add an additional
   modification in Step 3:

      Patch ".xml2rfc.rc" (xml2rfc-1.26 and earlier).  The purpose of
      the patch is to append library names in a format compatible with
      the OS; on MS-Windows XP, this replaces the Cygwin's "/" with MS-
      Windows' "\".


--- .xml2rfc.rc.orig    Thu Jul 24 13:58:00 2003
+++ .xml2rfc.rc    Wed Oct 20 10:59:02 2004
@@ -9,7 +9,8 @@
 if {[catch { set env(XML_LIBRARY) } library]} {
     set library ""
     foreach bibxmlD [lsort -dictionary [glob -nocomplain ~/rfcs/bibxml/*]] {
-        append library $sep$bibxmlD
+        set natbibD [file nativename $bibxmlD]
+        append library $sep$natbibD
     }
 }














Rose, et al.                                                   [Page 20]

README                      xml2rfc v1.35pre1               October 2009


Appendix D.  A Special Thanks

   A special thanks to Charles Levert for the v1.29 release, which
   includes many internal improvements made to the rendering engines.















































Rose, et al.                                                   [Page 21]

README                      xml2rfc v1.35pre1               October 2009


Appendix E.  Copyrights

   Copyright (C) 2003-2008 Marshall T. Rose

   Hold harmless the author, and any lawful use is allowed.














































Rose, et al.                                                   [Page 22]

README                      xml2rfc v1.35pre1               October 2009


Authors' Addresses

   Marshall T. Rose
   Dover Beach Consulting, Inc.
   POB 255268
   Sacramento, CA  95865-5268
   US

   Phone: +1 916 483 8878
   Email: mrose@dbc.mtview.ca.us


   Bill Fenner
   Arista Networks, Inc.
   275 Middlefield Rd, Suite 50
   Menlo Park, CA  94025
   US

   Phone: +1 650 924-2455
   Email: fenner@gmail.com


   Charles Levert
   Montreal, QC
   Canada

   Email: charles.levert@gmail.com
























Rose, et al.                                                   [Page 23]

