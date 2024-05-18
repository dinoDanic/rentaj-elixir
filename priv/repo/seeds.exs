seed_files = [
  "priv/repo/seeds/seed_users.ex",
  "priv/repo/seeds/seed_categories.ex",
  "priv/repo/seeds/seed_items.ex",
  "priv/repo/seeds/seed_orders.ex"
]

Enum.each(seed_files, fn seed_file ->
  IO.puts("Running seed file: #{seed_file}")
  Code.eval_file(seed_file)
end)
