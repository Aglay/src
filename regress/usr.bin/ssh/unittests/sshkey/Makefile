#	$OpenBSD: Makefile,v 1.4 2016/11/01 13:43:27 tb Exp $

PROG=test_sshkey
SRCS=tests.c test_sshkey.c test_file.c test_fuzz.c common.c
REGRESS_TARGETS=run-regress-${PROG}

run-regress-${PROG}: ${PROG}
	env ${TEST_ENV} ./${PROG} -d ${.CURDIR}/testdata

.include <bsd.regress.mk>
