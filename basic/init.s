init    jsr initv       ;go init vectors
        jsr initcz      ;go init charset & z-page
        jsr initms      ;go print initalization messages
        ldx #stkend-256 ;set up end of stack
        txs
        jmp ready       ;go to ready

initat  inc chrget+7
        bne chdgot
        inc chrget+8
chdgot  lda 60000
        cmp #':'
        bcs chdrts
        cmp #' '
        beq initat
        sec
        sbc #'0'
        sec
        sbc #$d0
chdrts  rts
        .byt 128,79,199,82,88

initcz  lda #76
        sta jmper
        sta usrpok
        lda #<fcerr
        ldy #>fcerr
        sta usrpok+1
        sty usrpok+2
        lda #<givayf
        ldy #>givayf
        sta adray2
        sty adray2+1
        lda #<flpint
        ldy #>flpint
        sta adray1
        sty adray1+1
        ldx #initcz-initat-1
movchg  lda initat,x
        sta chrget,x
        dex
        bpl movchg
        lda #strsiz
        sta four6
        lda #0
        sta bits
        sta channl
        sta lastpt+1
        ldx #1
        stx buf-3
        stx buf-4
        ldx #tempst
        stx temppt
        sec             ;read bottom of memory
        jsr $ff9c
        stx txttab      ;now txtab has it
        sty txttab+1
        sec
        jsr $ff99       ;read top of memory
usedef  stx memsiz
        sty memsiz+1
        stx fretop
        sty fretop+1
        ldy #0
        tya
        sta (txttab),y
        inc txttab
        bne init20
        inc txttab+1
init20  rts

initms  lda txttab
        ldy txttab+1
        jsr reason
        lda #<fremes
        ldy #>fremes
        jsr strout
        lda memsiz
        sec
        sbc txttab
        tax
        lda memsiz+1
        sbc txttab+1
        jsr linprt
        lda #<words
        ldy #>words
        jsr strout
        jmp scrtch

words   .byt " BYTES FREE",13,0
fremes  .byt 147,"**** CBM BASIC V2 ****",13,0

bvtrs   .word nerror,nmain,ncrnch,nqplop,ngone,neval
;
initv   ldx #initv-bvtrs-1  ;init vectors
initv1  lda bvtrs,x
        sta ierror,x
        dex
        bpl initv1
        rts

panic   jsr clschn      ;warm start basic...
        lda #0          ;clear channels
        sta channl
        jsr stkini      ;restore stack
        cli             ;enable irq's
        jmp ready       ;display ready entry
chke0   .byt $00
;
;program load patch
;
plink   jsr lnkprg      ;go link the loaded program
        jsr fload       ;use normal entry to keep variables
