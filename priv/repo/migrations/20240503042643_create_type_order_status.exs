defmodule Rentaj.Repo.Migrations.CreateTypeOrderStatus do
  use Ecto.Migration

  def up do
    execute """
    DO $$ BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'order_status') THEN
        CREATE TYPE order_status AS ENUM ('draft', 'waiting_for_renter', 'declined', 'completed');
      END IF;
    END $$;
    """
  end

  def down do
    execute """
    DROP TYPE IF EXISTS order_status;
    """
  end
end
