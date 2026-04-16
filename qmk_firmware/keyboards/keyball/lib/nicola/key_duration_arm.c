/*
 * (C) 2025 Keiji Momose @beatkz
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H
#include "key_duration.h"
#include "ch.h"    // ChibiOSの基本ヘッダー
#include "chvt.h"  // 仮想タイマーヘッダー

static keypress_timer_expired_func_t callback;
static virtual_timer_t timer_vt;

// タイマーのコールバック関数（ChibiOSの仮想タイマー形式に準拠）
static void timer_callback(virtual_timer_t *vtp, void *p) {
    (void)vtp;
    (void)p;
    if (callback) {
        callback(); // 登録されたコールバックを呼び出し
    }
}

// タイマー初期化関数
void keypress_timer_init(keypress_timer_expired_func_t _clbk) {
    callback = _clbk;
    chVTObjectInit(&timer_vt); // 仮想タイマーオブジェクトを初期化
}

// タイマー開始関数（カウントはミリ秒単位と仮定）
void keypress_timer_start(uint16_t count) {
    // 既存のタイマーをリセット
    chVTReset(&timer_vt);
    // 新しいタイマーをスケジュール（countをミリ秒単位で指定）
    chVTSet(&timer_vt, TIME_MS2I(count), timer_callback, NULL);
}
