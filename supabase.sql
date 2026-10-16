-- Gemeinsame private Gruppe: für Produktion Authentifizierung und gruppenbezogene RLS ergänzen.
-- Dieses vereinfachte Schema ist NUR für einen privaten Prototyp geeignet.
create extension if not exists pgcrypto;
create table if not exists public.places (id uuid primary key default gen_random_uuid(),name text not null,url text,category text not null default 'Café',author text not null default 'J',address text,comment text,proposed_date timestamptz,visited boolean not null default false,ambience integer check(ambience between 1 and 5),service integer check(service between 1 and 5),price integer check(price between 1 and 5),lat double precision,lng double precision,image_url text,created_at timestamptz not null default now());
create table if not exists public.activity(id uuid primary key default gen_random_uuid(),type text not null,item_name text not null,author text,created_at timestamptz not null default now());
alter table public.places enable row level security;
alter table public.activity enable row level security;
-- ACHTUNG: Jeder mit der Projekt-URL und dem öffentlichen Key könnte lesen/schreiben.
-- Für einen echten privaten Betrieb nicht diese offenen Policies verwenden.
create policy "prototype places read" on public.places for select to anon using (true);
create policy "prototype places insert" on public.places for insert to anon with check (true);
create policy "prototype places update" on public.places for update to anon using (true) with check (true);
create policy "prototype activity read" on public.activity for select to anon using (true);
create policy "prototype activity insert" on public.activity for insert to anon with check (true);
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types) values ('memories','memories',true,4194304,array['image/jpeg','image/png','image/webp','image/heic']) on conflict (id) do nothing;
create policy "prototype memory upload" on storage.objects for insert to anon with check(bucket_id='memories');
alter publication supabase_realtime add table public.places;
alter publication supabase_realtime add table public.activity;
