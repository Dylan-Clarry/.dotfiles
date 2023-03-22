#include QMK_KEYBOARD_H

#define GTS_0 LGUI(KC_0)
#define GTS_1 LGUI(KC_1)
#define GTS_2 LGUI(KC_2)
#define GTS_3 LGUI(KC_3)
#define GTS_4 LGUI(KC_4)
#define GTS_5 LGUI(KC_5)
#define GTS_6 LGUI(KC_6)
#define GTS_7 LGUI(KC_7)
#define GTS_8 LGUI(KC_8)
#define GTS_9 LGUI(KC_9)

#define HOME_A GUI_T(KC_A)
#define HOME_R ALT_T(KC_R)
#define HOME_S SFT_T(KC_S) 
#define HOME_T CTL_T(KC_T) 
#define HOME_N RCTL_T(KC_N)
#define HOME_E RSFT_T(KC_E) 
#define HOME_I RALT_T(KC_I)
#define HOME_O RGUI_T(KC_O)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_split_3x5_2(
        KC_Q, KC_W, KC_F, KC_P, KC_B,                   KC_J, KC_L, KC_U, KC_Y, KC_SCLN,
        KC_A, KC_R, KC_S, KC_T, KC_G,                   KC_M, KC_N, KC_E, KC_I, KC_O,
        KC_Z, KC_X, KC_C, KC_D, KC_V,                   KC_K, KC_H, KC_COMM, KC_DOT, KC_QUOTE,
        KC_LSFT,      MO(1),                            KC_SPC,     MO(2)
    ),
    [1] = LAYOUT_split_3x5_2(
        KC_TAB, KC_PMNS, KC_EQL, KC_DQUO, KC_EXLM,      KC_DOWN, KC_RIGHT, KC_AMPR, KC_BSPC, KC_DEL,
        KC_COLN, KC_LBRC, KC_LPRN, KC_LCBR, KC_PERC,    KC_GRV, KC_RCBR, KC_RPRN, KC_RBRC, KC_ENTER, 
        KC_SLSH, KC_PIPE, KC_AT, KC_BSLS, KC_HASH,      KC_UP, KC_LEFT, KC_LT, KC_GT, KC_QUES, 
        KC_NO, KC_NO,                                   KC_SPC, KC_NO
    ),
    [2] = LAYOUT_split_3x5_2(
        KC_NO, KC_CIRC, KC_PLUS, KC_ASTR, KC_NO,       KC_NO, KC_NO, KC_6, KC_DLR, KC_NO, 
        KC_4,  KC_3,  KC_2,  KC_1,  KC_NO,             KC_NO, KC_0,  KC_7,  KC_8,  KC_9, 
        KC_DLR, KC_HASH, KC_AT, KC_5,  KC_NO,          KC_NO, KC_NO, KC_UNDS, KC_ASTR, KC_NO, 
        KC_NO, KC_NO,                                  KC_SPC, KC_NO
    ),
    [3] = LAYOUT_split_3x5_2(
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, GTS_7, GTS_8, GTS_9, KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, GTS_4, GTS_5, GTS_6, KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             GTS_0, GTS_1, GTS_2, GTS_3, KC_NO, 
        KC_NO, KC_NO,                                  KC_NO, KC_NO
    ),
    [4] = LAYOUT_split_3x5_2(
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, LSFT(GTS_7), LSFT(GTS_8), LSFT(GTS_9), KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, LSFT(GTS_4), LSFT(GTS_5), LSFT(GTS_6), KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             LSFT(GTS_0), LSFT(GTS_1), LSFT(GTS_2), LSFT(GTS_3), KC_NO, 
        KC_NO, KC_NO,                                  KC_NO, KC_NO
    ),
    [5] = LAYOUT_split_3x5_2(
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, KC_7, KC_8, KC_9, KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_NO, KC_4, KC_5, KC_6, KC_NO, 
        KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,             KC_0, KC_1, KC_2, KC_3, KC_NO, 
        KC_NO, KC_NO,                                  KC_SPC, KC_NO
    )
};

enum combos {
    COMBO_ESC,
    COMBO_GTS,
    COMBO_SGTS,
    COMBO_NUMPAD,

    COMBO_LCTL,
    COMBO_LSFT,
    COMBO_LALT,
    COMBO_LGUI,
    COMBO_LALTGUI,
    COMBO_LCTLSFT,

    COMBO_RCTL,
    COMBO_RSFT,
    COMBO_RALT,
    COMBO_RGUI,
    COMBO_RALTGUI,
    COMBO_RCTLSFT,

    COMBO_LENGTH
};

uint16_t COMBO_LEN = COMBO_LENGTH;

const uint16_t PROGMEM esc_combo[] = {KC_W, KC_F, COMBO_END};
const uint16_t PROGMEM cd_combo[] = {KC_C, KC_D, COMBO_END};
const uint16_t PROGMEM sd_combo[] = {KC_S, KC_D, COMBO_END};
const uint16_t PROGMEM rcd_combo[] = {KC_R, KC_C, KC_D, COMBO_END};

const uint16_t PROGMEM st_combo[] = {KC_S, KC_T, COMBO_END};
const uint16_t PROGMEM rs_combo[] = {KC_R, KC_S, COMBO_END};
const uint16_t PROGMEM rc_combo[] = {KC_R, KC_C, COMBO_END};
const uint16_t PROGMEM ar_combo[] = {KC_A, KC_R, COMBO_END};
const uint16_t PROGMEM arc_combo[] = {KC_A, KC_R, KC_C, COMBO_END};
const uint16_t PROGMEM rst_combo[] = {KC_R, KC_S, KC_T, COMBO_END};

const uint16_t PROGMEM ne_combo[] = {KC_N, KC_E, COMBO_END};
const uint16_t PROGMEM ei_combo[] = {KC_E, KC_I, COMBO_END};
const uint16_t PROGMEM commai_combo[] = {KC_COMM, KC_I, COMBO_END};
const uint16_t PROGMEM io_combo[] = {KC_I, KC_O, COMBO_END};
const uint16_t PROGMEM commaio_combo[] = {KC_COMM, KC_I, KC_O, COMBO_END};
const uint16_t PROGMEM nei_combo[] = {KC_N, KC_E, KC_I, COMBO_END};

combo_t key_combos[] = {
    [COMBO_ESC] = COMBO(esc_combo, KC_ESC),
    [COMBO_GTS] = COMBO(cd_combo, MO(3)),
    [COMBO_SGTS] = COMBO(rcd_combo, MO(4)),
    [COMBO_NUMPAD] = COMBO(sd_combo, MO(5)),

    [COMBO_LCTL] = COMBO(st_combo, KC_LCTL),
    [COMBO_LSFT] = COMBO(rs_combo, KC_LSFT),
    [COMBO_LALT] = COMBO(rc_combo, KC_LALT),
    [COMBO_LGUI] = COMBO(ar_combo, KC_LGUI),
    [COMBO_LALTGUI] = COMBO(arc_combo, LALT(KC_LGUI)),
    [COMBO_LCTLSFT] = COMBO(rst_combo, LSFT(KC_LCTL)),

    [COMBO_RCTL] = COMBO(ne_combo, KC_RCTL),
    [COMBO_RSFT] = COMBO(ei_combo, KC_RSFT),
    [COMBO_RALT] = COMBO(commai_combo, KC_RALT),
    [COMBO_RGUI] = COMBO(io_combo, KC_RGUI),
    [COMBO_RALTGUI] = COMBO(commaio_combo, RALT(KC_RGUI)),
    [COMBO_RCTLSFT] = COMBO(nei_combo, RSFT(KC_RCTL)),
};
