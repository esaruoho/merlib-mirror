#include <iostream.h>

typedef char            C;
typedef double          D;
#define                 E  cerr <<
typedef float           F;
#define                 H  handle
typedef int             I;
#define                 K  const
typedef long            L;
typedef long double     LD;
#define                 N  << endl
#define                 O  (ostream &) cout <<
#define                 R  return
typedef unsigned        U;
typedef unsigned char   UC;
typedef unsigned long   UL;
typedef void            V;
#define                 W(width) setw(width) <<

//The following definitions implement expressions of the form
//  if( month == either(4) | 6 | 9 | 11 )
//and
//  if( code != either(EXCELLENT) | GOOD )
//The effect of their use in other contexts is "unspecified".

#ifndef TRACE_EITHER
  #define TRACE_EITHER 0
#endif

template<class T> class Either {
  T t;
  I p;
public:
  friend class Neither<T>;
  Either( T t ): t(t), p(0) {}
  friend Either<T> operator == ( K T t, Either<T> e ){
    #if TRACE_EITHER
      E "operator == ( K T t, Either<T> e ) invoked." N;
    #endif
    e.p = t == e.t;
    e.t = t;
    R e;
  }
  friend Neither<T> operator != ( K T t, Either<T> e ){
    #if TRACE_EITHER
      E "operator == ( K T t, Either<T> e ) invoked." N;
    #endif
    e.p = t != e.t;
    e.t = t;
    R e;
  }
  friend Either<T> operator | ( Either<T> e, K T t ){
    #if TRACE_EITHER
      E "operator | ( Either<T> e, K T t ) invoked." N;
    #endif
    e.p |= e.t == t;
    R e;
  }
  operator int () { R p; }
}

template<class T> class Neither {
  T t;
  I p;
public:
  Neither( K Either<T> &e ): t(e.t), p(e.p) {}
  friend K Neither<T> operator | ( Neither<T> n, K T t ){
    #if TRACE_EITHER
      E "operator | ( Neither<T> n, K T t ) invoked." N;
    #endif
    n.p &= n.t != t;
    R n;
  }
  operator int () K { R p; }
}

template<class T> Either<T> either( T t ){ R Either<T>(t); }

C main(){
  O "Beginning tests." N;
  O (1 == either(1) | 2 | 3) N;
  O (2 == either(1) | 2 | 3) N;
  O (3 == either(1) | 2 | 3) N;
  O (4 == either(1) | 2 | 3) N;
  O endl;
  O (1 != either(1) | 2 | 3) N;
  O (2 != either(1) | 2 | 3) N;
  O (3 != either(1) | 2 | 3) N;
  O (4 != either(1) | 2 | 3) N;
  O "Concluded tests." N;
R 0;}
