// Copyright 2021-2022 Espressif Systems (Shanghai) PTE LTD
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

    .text
    .align   4
    .literal_position
    .literal .LC0, 1073741824
    .literal .LC1, -1073741823
    .literal .LC2, 2147483647
    .literal .LC3, -2147483648
    .type    esp_nn_add_elementwise_s8_esp32s3, @function
    .align   4
    .global  esp_nn_add_elementwise_s8_esp32s3

esp_nn_add_elementwise_s8_esp32s3:
    entry   sp, 80
    l32i    a9, sp, 116
    s32i.n  a4, sp, 28
    s32i.n  a5, sp, 32
    blti    a9, 1, .L1
    l32i    a4, sp, 80
    movi.n  a11, 1
    neg     a4, a4
    s32i.n  a4, sp, 4
    l32i    a4, sp, 84
    l32r    a12, .LC2
    neg     a4, a4
    s32i.n  a4, sp, 8
    l32i    a4, sp, 104
    l32i.n  a10, sp, 8
    neg     a4, a4
    s32i.n  a4, sp, 12
    ssl     a10
    sll     a5, a11
    l32i.n  a4, sp, 4
    l32i.n  a10, sp, 12
    ssl     a4
    sll     a8, a11
    ssl     a10
    sll     a4, a11
    addi.n  a4, a4, -1
    addi.n  a8, a8, -1
    s32i.n  a4, sp, 16
    s32i.n  a8, sp, 24
    ssr     a11
    sra     a4, a8
    l32i.n  a8, sp, 16
    addi.n  a5, a5, -1
    s32i.n  a5, sp, 20
    ssr     a11
    sra     a8, a8
    ssr     a11
    sra     a5, a5
    l32i    a14, sp, 92
    s32i.n  a4, sp, 44
    s32i.n  a5, sp, 40
    s32i.n  a8, sp, 36
    movi.n  a13, 0
    s32i.n  a9, sp, 0
.L21:
    l8ui    a4, a2, 0
    l8ui    a5, a3, 0
    l32i.n  a9, sp, 28
    l32i    a10, sp, 88
    sext    a4, a4, 7
    add.n   a4, a4, a9
    sext    a8, a5, 7
    l32r    a9, .LC3
    l32i.n  a5, sp, 32
    ssl     a10
    sll     a4, a4
    add.n   a8, a8, a5
    add.n   a5, a4, a9
    ssl     a10
    sll     a8, a8
    bnez.n  a5, .L28
    mov.n   a5, a12
    beq     a6, a4, .L3
.L28:
    xor     a5, a6, a4
    bltz    a5, .L23
    l32r    a9, .LC1
    mov.n   a10, a13
    j       .L5
.L23:
    l32r    a9, .LC0
    movi.n  a10, -1
.L5:
    mull    a5, a6, a4
    mov.n   a15, a11
    add.n   a9, a5, a9
    mulsh   a4, a6, a4
    bltu    a9, a5, .L6
    mov.n   a15, a13
.L6:
    add.n   a4, a4, a10
    add.n   a4, a15, a4
    srai    a10, a4, 31
    and     a10, a10, a12
    add.n   a9, a10, a9
    srai    a15, a10, 31
    mov.n   a5, a11
    bltu    a9, a10, .L7
    mov.n   a5, a13
.L7:
    add.n   a15, a15, a4
    add.n   a5, a5, a15
    add.n   a5, a5, a5
    extui   a9, a9, 31, 1
    or      a5, a5, a9
.L3:
    l32r    a10, .LC3
    add.n   a4, a8, a10
    bnez.n  a4, .L29
    mov.n   a4, a12
    beq     a7, a8, .L8
.L29:
    xor     a4, a7, a8
    bltz    a4, .L25
    l32r    a4, .LC1
    mov.n   a10, a13
    j       .L10
.L25:
    l32r    a4, .LC0
    movi.n  a10, -1
.L10:
    mull    a15, a7, a8
    mulsh   a9, a7, a8
    add.n   a4, a15, a4
    mov.n   a8, a11
    bltu    a4, a15, .L11
    mov.n   a8, a13
.L11:
    add.n   a9, a9, a10
    add.n   a10, a8, a9
    srai    a9, a10, 31
    and     a9, a9, a12
    add.n   a8, a9, a4
    srai    a15, a9, 31
    mov.n   a4, a11
    bltu    a8, a9, .L12
    mov.n   a4, a13
.L12:
    add.n   a15, a15, a10
    add.n   a4, a4, a15
    add.n   a4, a4, a4
    extui   a8, a8, 31, 1
    or      a4, a4, a8
.L8:
    l32i.n  a10, sp, 24
    extui   a8, a5, 31, 1
    and     a9, a10, a5
    l32i.n  a10, sp, 44
    add.n   a8, a8, a10
    l32i.n  a10, sp, 4
    ssr     a10
    sra     a5, a5
    bge     a8, a9, .L13
    addi.n  a5, a5, 1
.L13:
    l32i.n  a10, sp, 20
    extui   a8, a4, 31, 1
    and     a9, a10, a4
    l32i.n  a10, sp, 40
    add.n   a8, a8, a10
    l32i.n  a10, sp, 8
    ssr     a10
    sra     a4, a4
    bge     a8, a9, .L14
    addi.n  a4, a4, 1
.L14:
    l32r    a8, .LC3
    add.n   a4, a4, a5
    add.n   a5, a4, a8
    bnez.n  a5, .L30
    l32i    a9, sp, 100
    mov.n   a5, a12
    beq     a9, a4, .L15
.L30:
    l32i    a10, sp, 100
    xor     a5, a10, a4
    bltz    a5, .L27
    l32r    a8, .LC1
    mov.n   a10, a13
    j       .L17
.L27:
    l32r    a8, .LC0
    movi.n  a10, -1
.L17:
    l32i    a5, sp, 100
    mull    a9, a5, a4
    mulsh   a4, a5, a4
    add.n   a8, a9, a8
    mov.n   a5, a11
    bltu    a8, a9, .L18
    mov.n   a5, a13
.L18:
    add.n   a4, a4, a10
    add.n   a4, a5, a4
    srai    a9, a4, 31
    and     a9, a9, a12
    add.n   a8, a9, a8
    srai    a10, a9, 31
    mov.n   a5, a11
    bltu    a8, a9, .L19
    mov.n   a5, a13
.L19:
    add.n   a10, a10, a4
    add.n   a5, a5, a10
    add.n   a5, a5, a5
    extui   a8, a8, 31, 1
    or      a5, a5, a8
.L15:
    l32i.n  a9, sp, 16
    l32i.n  a10, sp, 36
    extui   a4, a5, 31, 1
    and     a8, a9, a5
    l32i.n  a9, sp, 12
    add.n   a4, a4, a10
    ssr     a9
    sra     a5, a5
    bge     a4, a8, .L20
    addi.n  a5, a5, 1
.L20:
    l32i    a10, sp, 96
    l32i    a8, sp, 112
    add.n   a5, a10, a5
    l32i    a9, sp, 108
    l32i.n  a10, sp, 0
    min     a5, a5, a8
    max     a5, a5, a9
    addi.n  a10, a10, -1
    s8i     a5, a14, 0
    s32i.n  a10, sp, 0
    addi.n  a2, a2, 1
    addi.n  a3, a3, 1
    addi.n  a14, a14, 1
    bnez.n  a10, .L21
.L1:
    retw.n
    .size   esp_nn_add_elementwise_s8_esp32s3, . - esp_nn_add_elementwise_s8_esp32s3
