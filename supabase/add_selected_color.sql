-- Add selected_color column to room_players table
-- This allows players to select their preferred color in the lobby

alter table public.room_players 
add column selected_color text;

-- No constraint needed as colors are assigned dynamically in the game
