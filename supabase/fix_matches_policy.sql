-- Fix for Start Game Error
-- The matches table has RLS enabled but is missing an INSERT policy
-- This prevents authenticated users from creating matches

-- Add policy to allow authenticated users to insert matches
create policy "Authenticated users can create matches."
  on public.matches for insert
  with check ( auth.role() = 'authenticated' );
