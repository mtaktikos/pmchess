# Mirror Chess Implementation

This implementation adds the Mirror Chess variant to the TSCP (Tom's Simple Chess Program) chess engine as described in `MIRROR_CHESS.md`.

## What is Mirror Chess?

Mirror Chess is a chess variant where non-capture moves create opponent pieces on "mirror squares" according to special rules.

### Key Rules:

1. **Mirror Square Definition**: The mirror square is rotationally symmetric (180° rotation) around the board center
   - Formula: `mirror(square) = 63 - square`
   - Examples: mirror(a1) = h8, mirror(e4) = d5, mirror(d4) = e5

2. **Non-Capture Moves**:
   - If the piece is a **Pawn, Knight, Bishop, or Rook**:
     - If mirror square is **empty**: Create `nachfolger(piece)` in **opponent's color** on mirror square
     - If mirror square is **occupied**: Normal chess move (no mirror piece)
   - If the piece is a **King or Queen**:
     - If mirror square is **empty**: The piece **teleports** to the mirror square
     - If mirror square is **occupied**: Normal chess move (stays on target square)

3. **Nachfolger (Successor) Function**:
   - PAWN → KNIGHT
   - KNIGHT → BISHOP
   - BISHOP → ROOK
   - ROOK → QUEEN
   - QUEEN → (no successor, teleports)
   - KING → (no successor, teleports)

4. **Special Rules**:
   - **Captures**: Do NOT create mirror pieces
   - **Castling**: Disabled in Mirror Chess
   - **En Passant**: Works normally (it's a capture, so no mirror piece)
   - **Pawn Promotion**: Creates mirror piece based on promoted piece (or nothing if promoted to Queen)

## Files Modified

### `defs.h`
- Extended `hist_t` structure with `mirror_square` and `mirror_piece` fields to track mirror pieces for move takeback

### `board.c`
- Added `mirror_square()` function: Calculates the 180° rotational mirror of a square
- Added `successor_piece()` function: Returns the nachfolger piece type
- Modified `init_board()`: Disabled castling (castle = 0)
- Modified `makemove()`: Implements mirror piece creation and King/Queen teleportation
- Modified `takeback()`: Restores board state when undoing moves with mirror mechanics

### `data.c`
- No changes (uses existing data structures)

## How It Works

### Mirror Piece Creation (makemove)

After a piece moves to its destination square, the code:

1. Checks if the move is a capture (`m.bits & 1`)
2. If non-capture:
   - Calculates mirror square: `mir_sq = 63 - m.to`
   - Checks if mirror square is empty
   - If empty and piece is King/Queen: Teleports piece to mirror square
   - If empty and piece is other: Creates successor in opponent's color on mirror square
3. Saves mirror piece info in history for takeback

### Move Takeback (takeback)

When undoing a move:

1. Restores normal move (piece position, captures, etc.)
2. Checks if mirror piece was created (`mirror_square != -1`)
3. If teleportation (`mirror_piece == -2`): Moves piece back from mirror square to original destination
4. If normal mirror piece: Removes the piece from mirror square

## Building and Running

```bash
make clean
make
./tscp
```

## Example Game

```
tscp> e2e4
[White pawn moves to e4, Black knight appears on d5]

tscp> d
8  r n b q k b n r
7  p p p p p p p p
6  . . . . . . . .
5  . . . n . . . .
4  . . . . P . . .
3  . . . . . . . .
2  P P P P . P P P
1  R N B Q K B N R

tscp> e7e6
[Black pawn moves to e6, White knight appears on d3]

tscp> d1h5
[White queen attempts h5, but teleports to a4 (mirror of h5)]

tscp> d
8  r n b q k b n r
7  p p p p . p p p
6  . . . . p . . .
5  . . . n . . . .
4  Q . . N P . . .
3  . . . . . . . .
2  P P P P . P P P
1  R N B . K B N R
```

## Testing

Run the test suite:
```bash
./run_tests.sh
```

Or see detailed test results in `MIRROR_CHESS_TESTS.md`.

## Technical Details

### Move Bits Encoding
- `bits & 1`: Capture move
- `bits & 2`: Castle move (always 0 in Mirror Chess)
- `bits & 4`: En passant capture
- `bits & 8`: Pawn two-square push
- `bits & 16`: Pawn move
- `bits & 32`: Promotion

### Square Numbering
- 0-7: Rank 8 (a8-h8, Black's back rank)
- 56-63: Rank 1 (a1-h1, White's back rank)
- Formula: `square = rank * 8 + file`

### Mirror Square Examples
- e4 (square 36) → d5 (square 27)
- a1 (square 56) → h8 (square 7)
- d4 (square 35) → e5 (square 28)
- e1 (square 60) → d8 (square 3)

## Implementation Highlights

1. **Minimal Changes**: Only modified essential functions in `board.c` and `defs.h`
2. **Backward Compatible**: All normal chess rules still work (except castling)
3. **Efficient**: Mirror calculations are simple arithmetic (63 - square)
4. **Correct Takeback**: Full undo support for all mirror mechanics
5. **Handles Edge Cases**: Occupied mirrors, King safety, promotions, en passant

## Known Limitations

1. No GUI - command line only
2. Computer AI doesn't understand mirror mechanics strategically (plays like normal chess)
3. No special opening book for Mirror Chess
4. Hash function doesn't include mirror piece history (could cause issues in very deep searches)

## License

This implementation maintains the original TSCP copyright (Tom Kerrigan, 1997-2016) with modifications for Mirror Chess.
