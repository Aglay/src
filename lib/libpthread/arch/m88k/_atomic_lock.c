/*	$OpenBSD: _atomic_lock.c,v 1.4 2004/02/27 22:19:46 deraadt Exp $	*/

/*
 * Copyright (c) 2003, Miodrag Vallat.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * Atomic lock for m88k
 */

#include "spinlock.h"

int
_atomic_lock(volatile _spinlock_lock_t *lock)
{
	_spinlock_lock_t old;

	old = _SPINLOCK_LOCKED;
	__asm__ __volatile__
	    ("xmem %0, %2, r0" : "=r" (old) : "0" (old), "r" (lock));

	return (old != _SPINLOCK_UNLOCKED);
}

int
_atomic_is_locked(volatile _spinlock_lock_t *lock)
{

	return (*lock != _SPINLOCK_UNLOCKED);
}
