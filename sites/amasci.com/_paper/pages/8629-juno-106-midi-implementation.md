---
title: "Juno-106 MIDI Implementation"
source_domain: amasci.com
source_path: ~syzygy/juno106midi.html
order: 8629
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T17:16:23Z
extractor: site_to_paper.py (pandoc)
---

# Juno-106 MIDI Implementation

*Source page: `~syzygy/juno106midi.html`*

# Juno-106 MIDI Implementation

This information is taken from the Juno-106 Owner's Manual. Corrections can be mailed to Chad Beeder at <syzygy@eskimo.com>.

------------------------------------------------------------------------

## Transmitted Data

### When MIDI Function is 1.

Note events, Hold on/off, and Channel Mode messages are sent.

| Status      | Second      | Third       | Description                    |
|-------------|-------------|-------------|--------------------------------|
| `1001 nnnn` | `0kkk kkkk` | `0100 0000` | Note On                        |
| `1001 nnnn` | `0kkk kkkk` | `0`         | Note Off                       |
| `1011 nnnn` | `0100 0000` | `0111 1111` | Hold On (from rear panel jack) |
| `1011 nnnn` | `0100 0000` | `0`         | Hold Off                       |
| `1011 nnnn` | `0111 1011` | `0`         | All Notes Off\*                |
| `1011 nnnn` | `0111 1100` | `0`         | Omni Off\*\*                   |
| `1011 nnnn` | `0111 1111` | `0`         | Poly On\*\*                    |

##### Notes:

nnnn: MIDI channel number-1. (If chan=1, nnnn=0000)\
kkkkkkk: 24-108\
\* When all notes turn off\
\*\* When power up or MIDI channel number is set\

### When MIDI Function is 2.

All messages in Function 1, plus Program Change, Bender, and LFO Modulation are sent.

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th>Status</th>
<th>Second</th>
<th>Third</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>1100 nnnn</code></td>
<td><code>0ppp pppp</code></td>
<td></td>
<td>Program Change (0-127)</td>
</tr>
<tr>
<td><code>1110 nnnn</code></td>
<td><code>0bb0 0000</code><br />
<code>(LSB)</code></td>
<td><code>0bbb bbbb</code><br />
<code>(MSB)</code></td>
<td>Pitch Bender<br />
MAX (high): MSB=127, LSB=96<br />
CENTER: MSB=64, LSB=0<br />
MIN (low): MSB=0, LSB=0</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0000 0001</code></td>
<td><code>0111 1111</code></td>
<td>LFO Modulation On</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0000 0001</code></td>
<td><code>0</code></td>
<td>LFO Modulation Off</td>
</tr>
</tbody>
</table>

### When MIDI Function is 3.

All messages in Function 1, plus Bender, LFO Modulation and System Exclusive messages are sent.

------------------------------------------------------------------------

## Recognized Receive Data

### When MIDI Function is 1.

When power is first applied, receiver's mode is Omni On, Poly mode. Note events, Hold on/off and Channel Mode messages are recognized.

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr>
<th>Status</th>
<th>Second</th>
<th>Third</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>1000 nnnn</code></td>
<td><code>0kkk kkkk</code></td>
<td><code>0vvv vvvv</code></td>
<td>Note Off, velocity ignored</td>
</tr>
<tr>
<td><code>1001 nnnn</code></td>
<td><code>0kkk kkkk</code></td>
<td><code>0000 0000</code></td>
<td>Note Off<br />
kkkkkkk=0-127 (24-108)</td>
</tr>
<tr>
<td><code>1001 nnnn</code></td>
<td><code>0kkk kkkk</code></td>
<td><code>0vvv vvvv</code></td>
<td>Note On<br />
kkkkkkk=0-127 (24-108)<br />
vvvvvvv=1-127, velocity ignored</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0100 0000</code></td>
<td><code>0</code></td>
<td>Hold Off</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0100 0000</code></td>
<td><code>0vvv vvvv</code></td>
<td>Hold On<br />
vvvvvvv=1-127</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0111 1011</code></td>
<td><code>0</code></td>
<td>All Notes Off</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0111 1100</code></td>
<td><code>0</code></td>
<td>Omni Off</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0111 1101</code></td>
<td><code>0</code></td>
<td>Omni On</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0111 1110</code></td>
<td><code>0mmm mmmm</code></td>
<td>Mono On</td>
</tr>
<tr>
<td><code>1011 nnnn</code></td>
<td><code>0111 1111</code></td>
<td><code>0</code></td>
<td>Poly On</td>
</tr>
</tbody>
</table>

##### Notes:

Mode messages (123-127) are also recognized as All Notes Off.\
The Juno-106 does not respond to Mono On messages.

Mode messages are recognized as follows:

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr>
<td></td>
<td>Poly On</td>
<td>Mono On<br />
mmmmmmm=1</td>
<td>Mono On<br />
mmmmmmm&lt;&gt;1</td>
</tr>
<tr>
<td>Omni Off ($7C)</td>
<td>Omni=Off, Poly</td>
<td>Omni=Off, Poly</td>
<td>Omni=On, Poly</td>
</tr>
<tr>
<td>Omni On ($7D)</td>
<td>Omni=On, Poly</td>
<td>Omni=On, Poly</td>
<td>Omni=On, Poly</td>
</tr>
</tbody>
</table>

Recognized channels are as follows:

| Mode          | Voice Messages     | Mode Messages      |
|---------------|--------------------|--------------------|
| Omni Off mode | Basic channel only | Basic channel only |
| Omni On mode  | All channels       | Basic channel only |

### When MIDI Function is 2.

All messages in Function 1, plus Program Change, Bender, and LFO Modulation are recognized.

| Status | Second | Third | Description |
|----|----|----|----|
| `1100 nnnn` | `0ppp pppp` |  | Program Change (0-63: Bank A, 64-127: Bank B) |
| `1110 nnnn` | `0b00 0000` | `0bbb bbbb` | Pitch Bender (Least significant 6 bits are ignored) |
| `1011 nnnn` | `0000 0001` | `0vvv vvvv` | LFO Modulation (v=0-127) |

##### Notes:

Sensitivity of the pitch bender and modulation can be adjusted by receiver.

### When MIDI Function is 3.

All messages in Function 2, plus System Exclusive messages are recognized.

------------------------------------------------------------------------

## Exclusive Messages

### When Group, Bank, or Patch Number is changed.

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td></td>
<td>Byte</td>
<td>Description</td>
</tr>
<tr>
<td>a</td>
<td><code>1111 0000 ($F0)</code></td>
<td>Exclusive</td>
</tr>
<tr>
<td>b</td>
<td><code>0100 0001 ($41)</code></td>
<td>Roland ID#</td>
</tr>
<tr>
<td>c</td>
<td><code>0011 0000 ($30)</code></td>
<td>Function Type</td>
</tr>
<tr>
<td>d</td>
<td><code>0000 nnnn ($0N)</code></td>
<td>N+1=MIDI channel (N=0-15)</td>
</tr>
<tr>
<td>e</td>
<td><code>0xxx xxxx</code></td>
<td>Program Number (0-127)</td>
</tr>
<tr>
<td>f</td>
<td><code>0zzz zzzz</code></td>
<td>Value (0-127)<br />
(18 bytes total for values)</td>
</tr>
<tr>
<td>g</td>
<td><code>1111 0111 ($F7)</code></td>
<td>EOX (End of Exclusive)</td>
</tr>
</tbody>
</table>

##### Example:

       a  b  c  d  e   f  f  f  f  f  f  f  f  f
       F0 41 30 00 00  39 2D 00 37 00 55 00 00 00

       f  f  f  f  f  f  f  f  f   g
       19 34 3B 20 56 28 00 1A 18  F7

### When Manual button is pressed.

<table data-border="1" data-cellpadding="2">
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr>
<td></td>
<td>Byte</td>
<td>Description</td>
</tr>
<tr>
<td>a</td>
<td><code>1111 0000 ($F0)</code></td>
<td>Exclusive</td>
</tr>
<tr>
<td>b</td>
<td><code>0100 0001 ($41)</code></td>
<td>Roland ID#</td>
</tr>
<tr>
<td>c</td>
<td><code>0011 0001 ($31)</code></td>
<td>Function Type</td>
</tr>
<tr>
<td>d</td>
<td><code>0000 nnnn ($0N)</code></td>
<td>N+1=MIDI channel (N=0-15)</td>
</tr>
<tr>
<td>e</td>
<td><code>0000 0000 ($00)</code></td>
<td>Number indicates "Manual"</td>
</tr>
<tr>
<td>f</td>
<td><code>0zzz zzzz</code></td>
<td>Value (0-127)<br />
(18 bytes total for values)</td>
</tr>
<tr>
<td>g</td>
<td><code>1111 0111 ($F7)</code></td>
<td>EOX (End of Exclusive)</td>
</tr>
</tbody>
</table>

##### Example:

       a  b  c  d  e   f  f  f  f  f  f  f  f  f
       F0 41 31 00 00  03 00 00 00 00 3F 3C 00 00

       f  f  f  f  f  f  f  f  f   g
       7F 45 00 00 7F 00 00 2A 19  F7

### When sliders are adjusted or switches are changed.

|     |                   |                                     |
|-----|-------------------|-------------------------------------|
|     | Byte              | Description                         |
| a   | `1111 0000 ($F0)` | Exclusive                           |
| b   | `0100 0001 ($41)` | Roland ID#                          |
| c   | `0011 0010 ($32)` | Function Type                       |
| d   | `0000 nnnn ($0N)` | N+1=MIDI channel (N=0-15)           |
| e   | `0yyy yyyy`       | Parameter number (0-17) (See below) |
| f   | `0zzz zzzz`       | Value (0-127)                       |
| g   | `1111 0111 ($F7)` | EOX (End of Exclusive)              |

##### Example:

       a  b  c  d  e   f   g
       F0 41 32 00 03  04  F7

### Parameter number table

|      |                           |
|------|---------------------------|
| \$00 | LFO rate                  |
| \$01 | LFO delay                 |
| \$02 | DCO LFO modulation level  |
| \$03 | DCO PWM modulation level  |
| \$04 | Noise level               |
| \$05 | VCF cutoff level          |
| \$06 | VCF resonance level       |
| \$07 | VCF ENV level             |
| \$08 | VCF LFO modulation level  |
| \$09 | VCF KYBD modulation level |
| \$0A | VCA level                 |
| \$0B | ENV attack rate           |
| \$0C | ENV decay rate            |
| \$0D | ENV sustain level         |
| \$0E | ENV release rate          |
| \$0F | Sub level                 |

**For sliders:** {border="1" cellpadding="2"}

<table data-border="1" data-cellpadding="2">
<caption><p><strong>For buttons/switches:</strong></p></caption>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<tbody>
<tr>
<td>bit:</td>
<td>6</td>
<td>5</td>
<td>4</td>
<td>3</td>
<td>2</td>
<td>1</td>
<td>0</td>
</tr>
<tr>
<td>$10</td>
<td>Chorus Level<br />
1: I, 0: II</td>
<td>Chorus<br />
1: Off, 0: On</td>
<td>Sawtooth<br />
1: On, 0: Off</td>
<td>Pulse<br />
1: On, 0: Off</td>
<td colspan="3">Range<br />
100: 4', 010: 8', 001: 16'</td>
</tr>
<tr>
<td>$11</td>
<td>0</td>
<td>0</td>
<td colspan="2">High Pass Filter<br />
11: Off, 10: 1, 01: 2, 00: 3</td>
<td>VCA<br />
1: gate, 0: ENV</td>
<td>ENV<br />
1: -, 0: +</td>
<td>PWM<br />
1: Manual, 0: LFO</td>
</tr>
</tbody>
</table>
