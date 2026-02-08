# Mirror Square Chess - Implementation Documentation

## Overview
This variant of chess implements a "mirror square" mechanic where non-capture moves can create opponent pieces on mirror positions.

## Mirror Square Definition
A mirror square is rotationally symmetric to the original square on an 8x8 board (180-degree rotation around the center):
- **Formula**: Mirror of position (file, rank) = position (9-file, 9-rank)
- **Examples**:
  - mirror(a1) = h8
  - mirror(e4) = d5  
  - mirror(b3) = g6
  - mirror(e2) = d7
  - mirror(d4) = e5

## Rules
1.1. We define a function nachfolger, where
nachfolger(PAWN) = KNIGHT;
nachfolger(KNIGHT) = BiSHOP;
nachfolger(BISHOP) = ROOK;
nachfolger(ROOK) = QUEEN;

1.2 When a piece except King or Queen makes a **non-capture** move and lands on a square:
   - **If the mirror square is occupied**: The move ends normally (standard chess)
   - **If the mirror square is empty**: nachfolger(piece) in the **opponent's color** appears on the mirror square
 1.3 When a King or Queen makes a  **non-capture** move and lands on a square:
   - **If the mirror square is occupied**: The move ends normally (standard chess)
   - **If the mirror square is empty**: The King or Queen is transported to the mirror square 

2. Other changed and unchanged chess rules:
   - There is no castling
   - En passant works normally (doesn't create mirror pieces - it's a capture)
   - Pawns promote normally: if they promote to Queen, then nothing in the mirror square is produced, since
     nachfolger(Queen) doesn't exist; if they promote to another piece and the mirror square is empty, then there is nachfolger(piece) with opponent's colors created
   - Check and checkmate work normally
   - Capture moves do NOT create mirror pieces

## Examples

### Example 1: Opening Move
1. White plays **e2-e4** 
   - e2 is empty (non-capture) ✓
   - Mirror of e4 is d5
   - d5 is empty ✓  
   - **Result**: White pawn on e4, Black knight appears on d5

### Example 2: Mirror Occupied
2. Black plays **d7-d5**
   - d7 is empty (non-capture) ✓
   - d5 is already occupied (from example 1) 
   - **Result**: Black pawn on d5, no mirror piece created (normal chess move)

### Example 3: Knight Move
3. White plays **Nf3**
   - f3 is empty (non-capture) ✓
   - Mirror of f3 is c6
   - c6 is empty ✓
   - **Result**: White knight on f3, Black Bishop appears on c6

### Example 4: Capture
4. White plays **exd5** (pawn captures on d5)
   - This is a capture ✗
   - **Result**: White pawn on d5, no mirror piece created

## Implementation

### Board Changes
- Added bidirectional "mirror" direction links connecting each square to its mirror
- All 64 squares have explicit mirror links defined in the Board-Definitions section

and then flip it."

This implementation uses the `(create mirror) (flip mirror)` pattern where:
- `create` places a copy of the moving piece on the mirror square (defaults to current player)
- `flip` changes the ownership to the opponent player (in a 2-player game)

Both are priority level 2 modifiers that are queued and applied when the move is executed. If they are executed in order (create first, then flip), this works correctly. However, the documentation warns that the order is not guaranteed.

**If this approach fails**, an alternative implementation would require:
1. Removing the `symmetry` directive
2. Defining separate piece types for White and Black players
3. Using `(create Black mirror)` for White pieces and `(create White mirror)` for Black pieces
4. Duplicating all move definitions for each player

## Testing Checklist

To verify this implementation in Zillions of Games:

- [ ] Load ChessLight.zrf successfully
- [ ] Opening move e2-e4 creates Black pawn on d5
- [ ] Move to occupied mirror (e.g., d7-d5 after e2-e4) works normally
- [ ] Knight moves create mirror knights
- [ ] Bishop slides create mirror bishops on each empty square
- [ ] Rook slides create mirror rooks on each empty square  
- [ ] Queen moves create mirror queens
- [ ] King moves create mirror kings
- [ ] Pawn two-square advance creates mirror pawn
- [ ] Pawn captures do NOT create mirror pieces
- [ ] En passant works and doesn't create mirror pieces
- [ ] Castling works and doesn't create mirror pieces
- [ ] Pawn promotion works correctly
- [ ] Check and checkmate work normally
- [ ] Mirror pieces are in opponent's color
- [ ] Mirrors use correct 180-degree rotation

## File Changes

- **ChessLight.zrf**: Modified with mirror square implementation
  - Added mirror-piece macro
  - Modified leap1, leap2, king-shift, slide, rook-slide, Pawn-move, Pawn-add, Pawn-capture
  - Added mirror direction links for all 64 squares
  
- **MIRROR_CHESS.md**: This documentation file
