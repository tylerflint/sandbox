/* include/internal/i386-apple-darwin10.7.0/ethread_header_config.h.  Generated from ethread_header_config.h.in by configure.  */
/*
 * %CopyrightBegin%
 *
 * Copyright Ericsson AB 2004-2010. All Rights Reserved.
 *
 * The contents of this file are subject to the Erlang Public License,
 * Version 1.1, (the "License"); you may not use this file except in
 * compliance with the License. You should have received a copy of the
 * Erlang Public License along with this software. If not, it can be
 * retrieved online at http://www.erlang.org/.
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 *
 * %CopyrightEnd%
 */

/* Define to the size of pointers */
#define ETHR_SIZEOF_PTR 8

/* Define to the size of int */
#define ETHR_SIZEOF_INT 4

/* Define to the size of long */
#define ETHR_SIZEOF_LONG 8

/* Define to the size of long long */
#define ETHR_SIZEOF_LONG_LONG 8

/* Define to the size of __int64 */
#define ETHR_SIZEOF___INT64 0

/* Define if bigendian */
/* #undef ETHR_BIGENDIAN */

/* Define if you want to disable native ethread implementations */
/* #undef ETHR_DISABLE_NATIVE_IMPLS */

/* Define if you have win32 threads */
/* #undef ETHR_WIN32_THREADS */

/* Define if you have pthreads */
#define ETHR_PTHREADS 1

/* Define if you need the <nptl/pthread.h> header file. */
/* #undef ETHR_NEED_NPTL_PTHREAD_H */

/* Define if you have the <pthread.h> header file. */
#define ETHR_HAVE_PTHREAD_H 1

/* Define if the pthread.h header file is in pthread/mit directory. */
/* #undef ETHR_HAVE_MIT_PTHREAD_H */

/* Define if you have the pthread_spin_lock function. */
/* #undef ETHR_HAVE_PTHREAD_SPIN_LOCK */

/* Define if you want to force usage of pthread rwlocks */
/* #undef ETHR_FORCE_PTHREAD_RWLOCK */

/* Define if you have the pthread_rwlockattr_setkind_np() function. */
/* #undef ETHR_HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP */

/* Define if you have the PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP rwlock
   attribute. */
/* #undef ETHR_HAVE_PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP */

/* Define if you have a linux futex implementation. */
/* #undef ETHR_HAVE_LINUX_FUTEX */

/* Define if you have gcc atomic operations */
#define ETHR_HAVE_GCC_ATOMIC_OPS 1

/* Define if you prefer gcc native ethread implementations */
/* #undef ETHR_PREFER_GCC_NATIVE_IMPLS */

/* Define if you have the <sched.h> header file. */
#define ETHR_HAVE_SCHED_H 1

/* Define if you have the sched_yield() function. */
#define ETHR_HAVE_SCHED_YIELD 1

/* Define if you have the pthread_yield() function. */
/* #undef ETHR_HAVE_PTHREAD_YIELD */

/* Define if pthread_yield() returns an int. */
/* #undef ETHR_PTHREAD_YIELD_RET_INT */

/* Define if sched_yield() returns an int. */
#define ETHR_SCHED_YIELD_RET_INT 1

/* Define if you want compatibilty with x86 processors before pentium4. */
/* #undef ETHR_PRE_PENTIUM4_COMPAT */

/* Define if you have the pthread_rwlockattr_setkind_np() function. */
/* #undef ETHR_HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP */

/* Define if you have the PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP rwlock
   attribute. */
/* #undef ETHR_HAVE_PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP */

/* Define if you have gcc atomic operations */
#define ETHR_HAVE_GCC_ATOMIC_OPS 1

/* Define if you prefer gcc native ethread implementations */
/* #undef ETHR_PREFER_GCC_NATIVE_IMPLS */

/* Define if you have libatomic_ops atomic operations */
/* #undef ETHR_HAVE_LIBATOMIC_OPS */

/* Define if you prefer libatomic_ops native ethread implementations */
/* #undef ETHR_PREFER_LIBATOMIC_OPS_NATIVE_IMPLS */

/* Define to the size of AO_t if libatomic_ops is used */
/* #undef ETHR_SIZEOF_AO_T */

/* Define if you have _InterlockedCompareExchange64() */
/* #undef ETHR_HAVE__INTERLOCKEDCOMPAREEXCHANGE64 */

/* Define if you have _InterlockedDecrement64() */
/* #undef ETHR_HAVE__INTERLOCKEDDECREMENT64 */

/* Define if you have _InterlockedIncrement64() */
/* #undef ETHR_HAVE__INTERLOCKEDINCREMENT64 */

/* Define if you have _InterlockedExchangeAdd64() */
/* #undef ETHR_HAVE__INTERLOCKEDEXCHANGEADD64 */

/* Define if you have _InterlockedExchange64() */
/* #undef ETHR_HAVE__INTERLOCKEDEXCHANGE64 */

/* Define if you have _InterlockedAnd64() */
/* #undef ETHR_HAVE__INTERLOCKEDAND64 */

/* Define if you have _InterlockedOr64() */
/* #undef ETHR_HAVE__INTERLOCKEDOR64 */

/* Define if you want to turn on extra sanity checking in the ethread library */
/* #undef ETHR_XCHK */

