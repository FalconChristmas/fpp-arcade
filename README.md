# fpp-arcade

Interactive games playable on Pixel Overlay Models for [Falcon Player (FPP)](https://github.com/FalconChristmas/fpp).

The plugin renders each game onto an FPP Pixel Overlay Model (typically an LED matrix), so a
prop becomes a playable screen. Input comes from FPP Commands, which means anything that can
trigger a command — physical buttons via GPIO, a USB gamepad, MQTT, a web request — can drive
the games.

## Games

| Game | Input used |
|------|-----------|
| **Tetris** | The four directional "Pressed" events. "Up" rotates the block. |
| **Pong** | Both "Pressed" and "Released" for all four directions. Player one uses Up/Down, player two uses Left/Right. |
| **Snake** | The four directional "Pressed" events. |
| **Breakout** | Directional "Pressed"/"Released" events. |

## Installation

Install from **Content Setup → Plugins** in the FPP web UI, then restart FPPD.

## Configuration

Two pages are added to the FPP UI:

- **Content Setup → Arcade Games** — pick the game and the Pixel Overlay Model to play it on.
- **Input/Output Setup → FPP Arcade Joysticks** — map a connected USB joystick or gamepad to
  the arcade button/axis commands. Detected controllers are listed automatically; "Set Defaults"
  fills in a standard mapping for a game pad or a dance mat.

## Commands

The plugin registers three FPP Commands:

- **FPP Arcade Select Game** — select the game at a given row number on an overlay model.
  `Game` is the row number shown in the **#** column on the Arcade Games setup page, and
  `Target` is the game's overlay model. The selected game starts on the next directional
  button press.
- **FPP Arcade Button** — deliver a button press/release (Up, Down, Left, Right, Fire, Select, Start).
- **FPP Arcade Axis** — deliver an analog axis position.

Wire these to GPIO inputs, the joystick page, or any other FPP event source to provide controls.

For example, to give each game its own physical button on a podium, create an
**FPP Arcade Select Game** command for each button with `Game` set to that game's row
number and `Target` set to its model, then assign each GPIO input to the matching
command. A button labeled "Break Out" wired to `Game: 3` selects row 3; the next
directional button press starts that game.

## License

GPLv2 — see [LICENSE](LICENSE).
