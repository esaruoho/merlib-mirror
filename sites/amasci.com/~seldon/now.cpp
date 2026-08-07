/***************************************************************************\
            Now.cpp - Will Mengarini - Version 1.00 - Mo 23 Jan 95

This is the implementation of the interface defined in now.h. You should've
read that file before trying to read this.

Approximately the bottom half of this file is the unit-test code.
\***************************************************************************/

#include "WM-Root.h"
#include "Now.h"

//In now.h, references to REGION_NOW_LEVEL are surrounded by tests of whether
//the user has #defined it so now[123]() will generate no code. In here we
//must actually define (not #define) REGION_NOW_LEVEL. We can't just leave
//the definition unprotected, since "volatile I 0 = 0" is illformed; but if
//instead of conditioning out the definition, we #undef it here, we can allow
//a hacker in the middle of a bug war to reenable its use (because it will
//still have been defined) by recompiling only the compilation units
//participating in the war, without needing to remember about now.cpp.

#ifdef REGION_NOW_LEVEL
  #undef REGION_NOW_LEVEL
#endif

volatile I REGION_NOW_LEVEL = 0;

//Note that "#if UNIT_TEST" in now.cpp & now.h mean two completely
//different things. In now.h, it means that some module that uses the
//Now module is being unit tested; in now.cpp, it means that the Now
//module itself is being unit tested by a main() coded below.

//In the latter case, not only does our normal code need to output the
//ostreams userLog & debugLog, our test code needs to suck them back in.
//The class hierarchy of stream objects makes this easy; a strstream is
//an iostream, which is both an istream & an ostream.

#if UNIT_TEST
  strstream ss;
  ostream &userLog = ss, &debugLog = ss;
#endif

//ErrorLog::writeLog{Head,Foot}er*() should only give verbose output
//on the first event in a cascade. This global starts as 0 & will be set to 1
//below by ErrorLog::writeLogFooterAndFlagCascade(), which is the method
//called by class ErrorLog's destructor. If the cascade is caught by the
//programmer before the program abends, ::clearNow() resets everything
//to normal.

I cascadeOfNowsInProgress = 0;
V clearNow(){ cascadeOfNowsInProgress = 0; }

//The unary "+ nul" needs to be defined here; the binary was defined in
//the header file because it's a template function.

C *operator + ( Nul ){
  errorMsgNonemptyInCallOfNOW = 0;
  return "";
}

//The user is required to define C[] buffers shipCodeNowFailureHeader &
//shipCodeNowFailureFooter. Corresponding declarations are needed in here;
//they weren't put in now.h since only this .cpp needs to also see them.

extern C *shipCodeNowFailureHeader, *shipCodeNowFailureFooter;

//class ErrorLog is defined at the end of now.h; its ctor respectively dtor
//call its writeLogHeader() respectively writeLogFooter(). class ErrorLog is
//used in NOW() in a manner that causes writeLog{Header,Footer}()'s output
//to surround the errorMsg that's the third arg to the now#() macros, or
//to constitute the entire diagnostic output if errorMsg is empty.

//In the 3 possible compilation environments, we want writeLog*() to do
//3 different things.

//#if SHIP, it should send stuff like the location & text of the failed
//assertion to debugLog, & *shipCodeNowFailure{Header,Footer} to userLog.

//#if SYSTEM_TEST, it should do the same thing with debugLog, but since
//userLog will probably refer to the same ostream as debugLog, it should
//skip the ship-code boilerplate. However, it should ensure that the
//boilerplate is defined; we don't want to first discover that omission
//when building ship code.

//#if UNIT_TEST, we're running a main() coded below that checks whether
//all the syntactic shenanigans etc actually work. That main() will
//deliberately produce now() failures, & check that the {user,debug}Log
//were correctly written; but since that check is a slow strcmp(), the
//header should be as concise as possible. "[HEAD]" will do.

V ErrorLog::writeLogHeader (
  K C *errorFile, K I errorLine, K C *condition
)K{

  #if SHIP || SYSTEM_TEST

    //We'll do the userLog boilerplate first in the header but last in the
    //footer just in case SHIP userLog & debugLog refer to the same ostream.

    #if SHIP
      if( !cascadeOfNowsInProgress ) userLog << shipCodeNowFailureHeader;
    #else
      //cause linker to barf if pointer undefined:
      assert( shipCodeNowFailureHeader );
      //Unfortunately, the NOP statement
      //  shipCodeNowFailureHeader;
      //doesn't suffice for this because it'd be optimized out.
    #endif

    //The original version had the output of the false condition or
    //the "Traceback" line here, but it turns out to be more convenient
    //even in SYSTEM_TEST mode to let the caller's errorMsg be displayed
    //first; so the condition/Traceback stuff is now in the footer.

  #elif UNIT_TEST

    userLog << "[HEAD]" N;

  #else

    #error

  #endif

}//ErrorLog::writeLogHeader( ... )

//The behavior of the footer code is analogous, with one added complication.
//It's unhackworthy to require the programmer to terminate every errorMsg
//with a newline, so if errorMsg was nonempty, the newline must be inserted
//here; but if errorMsg was empty (as it will be in most cases), inserting a
//newline would place a spurious blank line on userLog. In now.h, an I (this
//C++ doesn't have bools) was declared & assigned to indicate whether the
//newline is necessary. It's defined & referenced here.

//Note that the newline needs to be handled even if cascadeOfNowsInProgress.

I errorMsgNonemptyInCallOfNOW;

V ErrorLog::writeLogFooterAndFlagCascade (
  K C *errorFile, K I errorLine, K C *condition
)K{

  if( errorMsgNonemptyInCallOfNOW ) userLog N;

  //The original version had the output of the false condition or the
  //"Traceback" line in the header, but it turns out to be more convenient
  //even in SYSTEM_TEST mode to let the caller's errorMsg be displayed first,
  //so now those go here.

  #if SHIP || SYSTEM_TEST

    #if SHIP

      if( !cascadeOfNowsInProgress ){
        userLog << shipCodeNowFailureFooter << flush;
      }

    #else

      if( cascadeOfNowsInProgress ){
        debugLog << "Traceback:\n   " << condition << "\nfailed at line " <<
          errorLine << " in file " << errorFile << "." N;
      }else{
        assert( shipCodeNowFailureFooter );
        debugLog <<
          (errorMsgNonemptyInCallOfNOW ? "Debugging data" : "Program failure")
          << ": the assertion\n  now( " << condition << " )" N <<
          "was false at line " << errorLine <<
            " in file " << errorFile << "." N;
        if( !getenv("TZ") ) putenv( "TZ=???0" );
        tzset(); time_t t; time(&t);
        debugLog << "Error occurred at " << ctime(&t) << flush;
        //ctime() gives \n
      }//if( cascadeOfNowsInProgress )else

    #endif

  #elif UNIT_TEST

    userLog << "[FOOT]" N;

  #else

    #error

  #endif

  cascadeOfNowsInProgress = 1;

}//ErrorLog::writeLogFooter( ... )

//The rest of this file is the UNIT_TEST scaffolding.

#if UNIT_TEST

  //Here are test cases for checking that errorCode & errorMsg are handled
  //correctly. These functions just generate the now() exceptions; they'll be
  //invoked later in a context that does the checking. The extra uses of <<
  //just test that expression fragments as well as expressions work.

  //Note that these functions return I because all now()-protocol functions
  //must do so; that's the type of the error code that's propagated back up
  //the call stack to unwind it.

  I Case0a (){ now6( 1 == 0,,"Case 0" << " error" ); }
  I Case1a (){ now6( 0,101, ); }
  I Case2a (){ now6( 0,102, "Message " << "from " << "Case2()" ); }

  //Since now() is supposed to be a synonym for now6(), those tests are
  //duplicated here calling now(). If you add tests to the above collection,
  //you can just duplicate them into the lower collection, changing the name
  //from Case#a() to Case#b() & "now6(" to "now( ".

  I Case0b (){ now(  1 == 0,,"Case 0" << " error" ); }
  I Case1b (){ now(  0,101, ); }
  I Case2b (){ now(  0,102, "Message " << "from " << "Case2()" ); }

  //For the benefit of Make jobs, a unit test will return non0 if an error
  //was detected. In main() this is implemented by having each test case
  //produce a non0 value if there is an error, & |ing the values together.

  //Test cases (the Case[0-9][ab]() functions) produce these values by
  //being passed as function pointers, along with their expected results, to
  //a function that runs them & examines their actual results. That function
  //returns 0 or non0 depending on whether results match; main() must use
  //that value somehow. In some modules I've had main() just abend when an
  //error was detected, but in Now the error is reported on standard output,
  //the fact that it occurred is remembered, & testing continues.

  //There are 2 places errors can be detected in the test cases above: in
  //the returned errorCode, & in the output errorMsg. It costs nothing extra
  //to distinguish those 2 errors by setting separate bits in the return code
  //for each of them, so I do, altho there's currently no logic that makes
  //use of that distinction.

  //The returned value can therefore have either of 2 bits set to indicate
  //error. In main(), an I named mainReturn starts as 0 & has each test
  //case's returned value |ed into it; it becomes the program's exit status.

  //A major goal is to make test cases cheap, so there will be more of them.
  //In main(), I want each test case to be callable as a single line of code
  //if possible. This requires making the call concise. One way to facilitate
  //that is to do the |ing of mainReturn in a macro. Because the entire
  //errorMsg, plus the header & footer, are part of the expected results,
  //every little bit helps, so the macro allows abbreviating a function
  //pointer like "Case0a" to just "0a".

  //This macro will be called for each test case; it will translate into a
  //function call. Therefore, the macro name should be easier to type than
  //the function name, so the macro is test() & the function is TEST().

  //__FILE__ & __LINE__ are passed in so a check could be done of whether
  //those were being handled correctly, but in this version I haven't
  //bothered to actually code a check.

  #define test(caseCode,expectedR,expectedLog) mainReturn |= TEST(\
    Case##caseCode,expectedR,expectedLog,__FILE__,__LINE__\
  );

  //In long test suites I find it very helpful to display a tally of the
  //total # so far of test cases tried & errors detected, continuously
  //updated in place on the bottom line of the screen. Those #s need to
  //have file scope so TEST() & main() can access them.

  static U testCount = 0, errorCount = 0;

  //This test suite is actually so fast that the updates are instantaneous
  //on a 486, so all you see in a successful run is the final summary; but
  //I've coded this test scaffolding according to a general pattern that's
  //useful in unit-testing various kinds of modules.

  //To update those #s in place, I put them in a line of text that begins
  //with \r & doesn't end with \n. This line is displayed before a test
  //case is executed; while the case is executing, the cursor is resting
  //at the end of the displayed line. If no errors are detected, that line
  //is then overwritten with a similar line for the next case; but if errors
  //are detected, they're logged on the screen, which requires first
  //outputting a \n. Whether that \n is needed is something each error-
  //reporting block of code needs to check, so it needs to be another
  //file-scope I (construed as a boolean). (This is another example of
  //the previous paragraph; newlineNeededBeforeNextOutput actually only
  //happens to be accessed in TEST() in this module, so it could be static to
  //TEST(). However, in general, in unit-test routines that produce this kind
  //of output, it needs file scope or program scope.)

  static I newlineNeededBeforeNextOutput = 0;

  I TEST ( I (*caseFunction)()
         , I expectedReturn
         , K C *expectedLog
         , K C *file
         , U line
  ){

    clearNow();//Because we're catching the cascade before it abends

    I TEST_return = 0;

    //Output bottom-of-screen status report

    O "\rTest " << setfill('0') << W(2) ++testCount << setfill(' ') <<
      " on line " << line << " in " << file << flush;
    newlineNeededBeforeNextOutput = 1;

    //Call the test case. If that call tries to write {user,debug}Log, it'll
    //fail unless {user,debug}Log.good(). For the kind of ostream that's used
    //for such logs normally, that's a safe assumption unless disk space runs
    //out. However, #if UNIT_TEST, those ostreams refer to a strstream that's
    //also used as an istream for checking that the actual output matched the
    //expected output, which requires reading all the way to the END of the
    //istream, which sets {user,debug}Log.eof(). That must be clear()ed
    //before the next test case is called.

    if( ss.eof() ) ss.clear();
    I actualReturn = caseFunction();

    //Check errorCode

    if( actualReturn != expectedReturn ){
      TEST_return |= 1;
      errorCount += 1;
      if( newlineNeededBeforeNextOutput ) O "\n";
      newlineNeededBeforeNextOutput = 0;
      O "Error: return code was " << actualReturn <<
        " but should've been " << expectedReturn << "." N;
    }//if( actualReturn != expectedReturn )

    //Check errorMsg

    C scratch[888];
    ss.get( scratch, sizeof scratch, 0 );
    if( strcmp( scratch, expectedLog ) ){
      TEST_return |= 2;
      errorCount += 1;
      if( newlineNeededBeforeNextOutput ) O "\n";
      newlineNeededBeforeNextOutput = 0;
      O "Error: userLog was\n--------\n" << scratch <<
        (strlen(scratch) ? "\n" : "") <<
        "--------\nbut should've been\n--------\n" <<
        expectedLog << "\n--------." N;
    }//if( strcmp( scratch, expectedLog ) )

    return TEST_return;

  }//TEST

  //All the Case[0-9][ab]() functions test false assertions, allowing
  //correct handling of errorCode & errorMsg to be verified. True assertions
  //also need to be checked, but I find those easier to do just by using
  //direct now#() calls rather than bothering to code Case[0-9][ab]()s.
  //The true now#()s are used to check that all the different importance
  //levels work, & that all the types that it's common to implicitly convert
  //to bool are correctly interpreted as true.

  I main ( I argc, C **argv ){
    C scratch[333];
    I mainReturn = 0;
    O "=======Starting Now unit test at " << _strtime(scratch) <<
      " on " << _strdate(scratch + 10) N;
    now4( 1 == 1,, );
    now4( '1', 42, );
    now4( scratch,, "harder" );
    now4( Case0a, 1729, "msg" );
    now6( 1 == 1,, );
    now6( '1', 42, );
    now6( scratch,, "harder" );
    now6( Case0a, 1729, "msg" );
    now(  1 == 1,, );
    now(  '1', 42, );
    now(  scratch,, "harder" );
    now(  Case0a, 1729, "msg" );
    now8( 1 == 1,, );
    now8( '1', 42, );
    now8( scratch,, "harder" );
    now8( Case0a, 1729, "msg" );
    O "Got past the true now#()s." N;
    testCount = 12;
    test(0a,defaultErrorCode,"[HEAD]\nCase 0 error\n[FOOT]\n");
    test(1a,101,"[HEAD]\n[FOOT]\n");
    test(2a,102,"[HEAD]\nMessage from Case2()\n[FOOT]\n");
    test(0b,defaultErrorCode,"[HEAD]\nCase 0 error\n[FOOT]\n");
    test(1b,101,"[HEAD]\n[FOOT]\n");
    test(2b,102,"[HEAD]\nMessage from Case2()\n[FOOT]\n");
    O "\rTests " << testCount <<
      ", errors " << errorCount << "                         " N;
    O "=======Finished Now unit test at " <<
      _strtime(scratch) << " on " << _strdate(scratch + 10) N;
    return mainReturn;
  }//main( I argc, C **argv )

#endif //#if UNIT_TEST
