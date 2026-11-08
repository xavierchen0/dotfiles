#include QMK_KEYBOARD_H
#ifdef OLED_ENABLE
#    include <stdio.h>
#    include "bongo.h"
#endif

enum layer_number {
  _QWERTY = 0,
  _LOWER,
  _RAISE,
  _ADJUST,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* QWERTY
 * Default:
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * | ESC  |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  |  `   |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |                    |   Y  |   U  |   I  |   O  |   P  |  -   |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |LCTRL |   A  |   S  |   D  |   F  |   G  |-------.    ,-------|   H  |   J  |   K  |   L  |   ;  |  '   |
 * |------+------+------+------+------+------|   [   |    |    ]  |------+------+------+------+------+------|
 * |LShift|   Z  |   X  |   C  |   V  |   B  |-------|    |-------|   N  |   M  |   ,  |   .  |   /  |RShift|
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /ENTER  /       \SPACE \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 * Mine:
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  | -    |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |                    |   Y  |   U  |   I  |   O  |   P  |  =   |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * | ESC  |   A  |   S  |   D  |   F  |   G  |-------.    ,-------|   H  |   J  |   K  |   L  |   ;  |  '   |
 * |------+------+------+------+------+------| LOWER |    |RAISE  |------+------+------+------+------+------|
 * |LShift|   Z  |   X  |   C  |   V  |   B  |-------|    |-------|   N  |   M  |   ,  |   .  |   /  |RShift|
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LCTRL| LALT |LCMD  | /Space  /       \Enter \  | RCMD |RALT  | BSPC |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */

 [_QWERTY] = LAYOUT(
  KC_GRV,    KC_1,   KC_2,    KC_3,    KC_4,    KC_5,                     KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS,
  KC_TAB,    KC_Q,   KC_W,    KC_E,    KC_R,    KC_T,                     KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_EQL,
  KC_ESC,    KC_A,   KC_S,    KC_D,    KC_F,    KC_G,                     KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  KC_LSFT,   KC_Z,   KC_X,    KC_C,    KC_V,    KC_B, MO(_LOWER),  MO(_RAISE),  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH,  KC_RSFT,
                        KC_LALT, KC_LCTL, KC_LGUI, KC_ENT,       KC_SPC, KC_RGUI, KC_RALT, KC_BSPC
),
/* LOWER
 * Default:
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |       |     |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |                    |  F7  |  F8  |  F9  | F10  | F11  | F12  |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |   `  |   !  |   @  |   #  |   $  |   %  |-------.    ,-------|   ^  |   &  |   *  |   (  |   )  |   ~  |
 * |------+------+------+------+------+------|   [   |    |    ]  |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|      |   _  |   +  |   {  |   }  |   |  |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /Space  /       \Enter \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 * Mine:
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |BRI_UP|BRI_DW|VOL_MU|VOL_DW|VOL_UP|      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |                    |  F7  |  F8  |  F9  | F10  | F11  | F12  |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |   `  |   !  |   @  |   #  |   $  |   %  |-------.    ,-------|   ^  |   &  |   *  |   (  |   )  |   ~  |
 * |------+------+------+------+------+------|   [   |    |    ]  |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|      |   _  |   +  |   {  |   }  |   |  |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /Space  /       \Enter \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */
[_LOWER] = LAYOUT(
  _______, _______, _______, _______, _______, _______,                   KC_BRID, KC_BRIU, KC_MUTE, KC_VOLD, KC_VOLU, _______,
  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,                     KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,
  KC_GRV, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC,                   KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_TILD,
  _______, _______, _______, _______, _______, _______, _______, _______, XXXXXXX, KC_UNDS, KC_PLUS, KC_LCBR, KC_RCBR, KC_PIPE,
                             _______, _______, _______, _______, _______,  _______, _______, _______
),
/* RAISE
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |   `  |   1  |   2  |   3  |   4  |   5  |                    |   6  |   7  |   8  |   9  |   0  |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |-------.    ,-------|      | Left | Down |  Up  |Right |      |
 * |------+------+------+------+------+------|   [   |    |    ]  |------+------+------+------+------+------|
 * |  F7  |  F8  |  F9  | F10  | F11  | F12  |-------|    |-------|   +  |   -  |   =  |   [  |   ]  |   \  |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /Space  /       \Enter \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */

[_RAISE] = LAYOUT(
  _______, _______, _______, _______, _______, _______,                     _______, _______, _______, _______, _______, _______,
  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                        KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    _______,
  KC_F1,  KC_F2,    KC_F3,   KC_F4,   KC_F5,   KC_F6,                       XXXXXXX, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, XXXXXXX,
  KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,   _______, _______,  KC_PLUS, KC_MINS, KC_EQL,  KC_LBRC, KC_RBRC, KC_BSLS,
                             _______, _______, _______,  _______, _______,  _______, _______, _______
),
/* ADJUST
 * ,-----------------------------------------.                    ,-----------------------------------------.
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |                    |      |      |      |      |      |      |
 * |------+------+------+------+------+------|                    |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------.    ,-------|      |      |RGB ON| HUE+ | SAT+ | VAL+ |
 * |------+------+------+------+------+------|       |    |       |------+------+------+------+------+------|
 * |      |      |      |      |      |      |-------|    |-------|      |      | MODE | HUE- | SAT- | VAL- |
 * `-----------------------------------------/       /     \      \-----------------------------------------'
 *                   | LAlt | LGUI |LOWER | /Space  /       \Enter \  |RAISE |BackSP| RGUI |
 *                   |      |      |      |/       /         \      \ |      |      |      |
 *                   `----------------------------'           '------''--------------------'
 */
  [_ADJUST] = LAYOUT(
  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, TG(_LOWER), TG(_RAISE), XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                             _______, _______, _______, _______, _______,  _______, _______, _______
  )
};

layer_state_t layer_state_set_user(layer_state_t state) {
  return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}

//SSD1306 OLED update loop, make sure to enable OLED_ENABLE=yes in rules.mk
#ifdef OLED_ENABLE

#define HISTORY_LEN 20
#define CAT_X 54
#define CAT_W 74
#define CAT_H 24

static char key_history[HISTORY_LEN + 1] =
    "                    ";

static uint32_t last_bongo_press = 0;

// Convert a keycode to a displayable character
static char key_to_char(uint16_t keycode) {
    if (keycode >= KC_A && keycode <= KC_Z)
        return 'A' + (keycode - KC_A);

    if (keycode >= KC_1 && keycode <= KC_9)
        return '1' + (keycode - KC_1);

    if (keycode == KC_0)
        return '0';

    switch (keycode) {
        case KC_SPC:  return '_';
        case KC_BSPC: return '<';
        case KC_ENT:  return '|';
        case KC_TAB:  return '>';
        case KC_DOT:  return '.';
        case KC_COMM: return ',';
        case KC_SLSH: return '/';
        case KC_MINS: return '-';
        case KC_EQL:  return '=';
        case KC_SCLN: return ';';
        case KC_QUOT: return '\'';
        default:      return '\0';
    }
}

// Scroll history left and append newest key
static void push_history(char c) {
    if (!c) return;

    for (uint8_t i = 0; i < HISTORY_LEN - 1; i++) {
        key_history[i] = key_history[i + 1];
    }

    key_history[HISTORY_LEN - 1] = c;
    key_history[HISTORY_LEN] = '\0';
}

// Scale original Bongo Cat frames onto the
// top-right portion of the OLED
static void draw_small_bongo(void) {
    uint32_t elapsed =
        timer_elapsed32(last_bongo_press);

    const char *frame;

    if (elapsed < 160) {
        frame = tap[(elapsed / 80) % TAP_FRAMES];
    } else if (elapsed < 700) {
        frame = prep[0];
    } else {
        frame = idle[
            (timer_read32() / 175) % IDLE_FRAMES
        ];
    }

    // Original artwork uses 128-pixel-wide pages,
    // with approximately 40 pixels of height.
    for (uint8_t y = 0; y < CAT_H; y++) {
        uint8_t sy = ((uint16_t)y * 40) / CAT_H;

        for (uint8_t x = 0; x < CAT_W; x++) {
            uint8_t sx =
                ((uint16_t)x * 128) / CAT_W;

            uint16_t index =
                (sy / 8) * 128 + sx;

            if (index >= ANIM_SIZE) continue;

            uint8_t bits = pgm_read_byte(
                (const uint8_t *)frame + index
            );

            if (bits & (1 << (sy % 8))) {
                oled_write_pixel(
                    CAT_X + x, y, true
                );
            }
        }
    }
}

oled_rotation_t oled_init_user(
    oled_rotation_t rotation
) {
    if (!is_keyboard_master())
        return OLED_ROTATION_180;

    return rotation;
}

bool oled_task_user(void) {
    // Only render on USB-connected/master half
    if (!is_keyboard_master())
        return false;

    oled_clear();

    char line[12];

    // Row 1: WPM
    snprintf(
        line, sizeof(line),
        "WPM:%03u",
        (unsigned)get_current_wpm()
    );
    oled_set_cursor(0, 0);
    oled_write(line, false);

    // Row 2: Layer
    const char *layer_name = "BASE";

    switch (get_highest_layer(layer_state)) {
        case _QWERTY:
            layer_name = "QWERTY";
            break;
        case _LOWER:
            layer_name = "LOWER";
            break;
        case _RAISE:
            layer_name = "RAISE";
            break;
        case _ADJUST:
            layer_name = "ADJUST";
            break;
    }

    snprintf(
        line, sizeof(line),
        "L:%s", layer_name
    );
    oled_set_cursor(0, 1);
    oled_write(line, false);

    // Row 3: Label
    oled_set_cursor(0, 2);
    oled_write("RECENT:", false);

    // Row 4: Last 20 keystrokes
    oled_set_cursor(0, 3);
    oled_write(key_history, false);

    // Bongo Cat in the top-right corner
    draw_small_bongo();

    return false;
}

#endif // OLED_ENABLE

// Keep only ONE process_record_user function
bool process_record_user(
    uint16_t keycode,
    keyrecord_t *record
) {
#ifdef OLED_ENABLE
    if (record->event.pressed) {
        last_bongo_press = timer_read32();
        push_history(key_to_char(keycode));
    }
#endif
    return true;
}
