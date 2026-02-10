-- Fix multiplayer game synchronization issue
-- This adds the missing UPDATE policy to allow players to update game state

-- Allow authenticated users to update match state (for game moves)
create policy "Authenticated users can update matches."
  on public.matches for update
  using ( auth.role() = 'authenticated' );

-- Enable Realtime for matches table to broadcast changes
alter publication supabase_realtime add table matches;

-- Set replica identity to FULL for complete row data in Realtime events
-- This ensures result_json updates are properly broadcast
alter table public.matches replica identity full;
