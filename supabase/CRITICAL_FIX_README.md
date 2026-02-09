# Critical Fix: Missing Database Column

## Issue

The `room_players` table is missing the `selected_color` column, which causes:
1. ❌ Color selection buttons don't work (no column to update)
2. ❌ No pawns appear in game (player initialization fails)

## Solution

Run this SQL query in your Supabase SQL Editor:

```sql
-- Add selected_color column to room_players table
alter table public.room_players 
add column selected_color text;
```

## Steps to Apply Fix

1. Go to [Supabase SQL Editor](https://app.supabase.com/)
2. Select your project
3. Click **SQL Editor** → **New query**
4. Copy and paste the SQL above
5. Click **Run**
6. Refresh your game page

## Why This Fixes Both Issues

### Color Selection
- The lobby tries to save color selection to `selected_color` column
- Without the column, the update fails silently
- Adding the column allows color choices to be saved

### No Pawns in Game
- The Ludo game initialization queries `selected_color` from database
- Missing column causes query issues
- Player objects fail to initialize properly
- No pawns render because `gameState.players` is empty or broken

## After Applying the Fix

✅ Color selection will work immediately
✅ Pawns will appear in the game
✅ Game will initialize properly with correct player colors
