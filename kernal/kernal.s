;****************************************
;*                                      *
;* KK  K EEEEE RRRR  NN  N  AAA  LL     *
;* KK KK EE    RR  R NNN N AA  A LL     *
;* KKK   EE    RR  R NNN N AA  A LL     *
;* KKK   EEEE  RRRR  NNNNN AAAAA LL     *
;* KK K  EE    RR  R NN NN AA  A LL     *
;* KK KK EE    RR  R NN NN AA  A LL     *
;* KK KK EEEEE RR  R NN NN AA  A LLLLL  *
;*                                      *
;***************************************
;
;***************************************
;* pet kernal                          *
;*   memory and i/o dependent routines *
;* driving the hardware of the         *
;* following cbm models:               *
;*   vixen                             *
;* copyright (c) 1980 by               *
;* commodore business machines (cbm)   *
;***************************************


;****listing date --1200 09 oct.  1980**


;***************************************
;* this software is furnished for use  *
;* use in the micro-pet computer       *
;* only.                               *
;*                                     *
;* copies thereof may not be provided  *
;* or made available for use on any    *
;* other system.                       *
;*                                     *
;* the information in this document is *
;* subject to change without notice.   *
;*                                     *
;* no responsibility is assumed for    *
;* reliability of this software.       *
;*                                     *
;***************************************

.feature labels_without_colons, pc_assignment

.include "declare.s"
.include "editor1.s"
.include "editor2.s"
.include "editor3.s"
.include "serial21.s"
.include "rs232trans.s"
.include "rs232rcvr.s"
.include "rs232inout.s"
.include "messages.s"
.include "channelio.s"
.include "openchannel.s"
.include "close.s"
.include "clall.s"
.include "open.s"
.include "load.s"
.include "save.s"
.include "time.s"
.include "errorhandler.s"
.include "tapefile.s"
.include "tapecontrol.s"
.include "read.s"
.include "write.s"
.include "init.s"
.include "rs232nmifile.s"
.include "irqfile.s"
.include "vectors.s"

;2023-04-10: Updated kernal.s for use with cc65.
