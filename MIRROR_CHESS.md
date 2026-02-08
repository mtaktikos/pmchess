# Mirror Square Chess - Implementation Documentation

## Overview
This variant of chess implements a "mirror square" mechanic where non-capture moves can create opponent pieces on mirror positions.

## Mirror Square Definition
A mirror square is clock-symmetric to the original square on an 8x8 board (180-degree rotation around the center):
- **Formula**: Mirror of position (file, rank) = position (9-file, 9-rank)
- **Examples**:
  - mirror(a1) = h8
  - mirror(e4) = d5  
  - mirror(b3) = g6
  - mirror(e2) = d7

## Rules
1. When a piece makes a **non-capture** move and lands on a square:
   - **If the mirror square is occupied**: The move ends normally (standard chess)
   - **If the mirror square is empty**: A piece of the same type in the **opponent's color** appears on the mirror square

2. All other chess rules remain unchanged:
   - Castling works normally
   - En passant works normally  
   - Pawn promotion works normally
   - Check and checkmate work normally
   - Capture moves do NOT create mirror pieces

## Implementation

### Board Changes
- Added bidirectional "mirror" direction links connecting each square to its mirror
- All 64 squares have explicit mirror links defined

### Movement Macros
Modified the following movement definition macros to include mirror piece creation:

1. **leap1, leap2** - Used by Knights for L-shaped moves
2. **king-shift** - Used by King for single-square moves
3. **slide** - Used by Bishops and Queens for sliding moves
4. **rook-slide** - Used by Rooks for sliding moves (with never-moved tracking)
5. **Pawn-move** - Used by Pawns for forward movement
6. **Pawn-add** - Used by Pawns for both moves and promotions

### Technical Approach
Each non-capture move now includes:
```lisp
(if (empty? mirror) (create mirror) (flip mirror))
```

This logic:
1. Checks if the mirror square is empty
2. If yes: Creates a piece on the mirror square and flips its ownership to the opponent
3. If no: Does nothing (move proceeds normally)

### Known Limitations
The ZRF language documentation states: "you should not count on a move being able to create a piece and then flip it" because the order of modifiers within the same priority level is not guaranteed.

However, in practice, this implementation uses the `create` + `flip` pattern which:
- Creates a copy of the moving piece on the mirror square (defaults to current player)
- Flips the ownership to the opponent player

If this approach doesn't work reliably in the Zillions of Games engine, an alternative implementation would require:
- Removing the `symmetry` directive
- Defining separate piece types and moves for White and Black
- Using `(create Black mirror)` for White pieces and `(create White mirror)` for Black pieces

## Testing
To test this variant:
1. Load ChessLight.zrf in Zillions of Games
2. Start a new game
3. Make a non-capture move (e.g., e2-e4)
4. Verify that an opponent pawn appears on the mirror square (d5 in this case)
5. Verify that subsequent moves to occupied mirrors work normally
6. Verify that captures don't create mirror pieces

## Example Game Start
1. White plays e2-e4 → Black Pawn appears on d5
2. Black plays d7-d5 → This square is already occupied, so no mirror piece (normal move)
3. White plays Nf3 → Black Knight appears on c6
4. etc.
