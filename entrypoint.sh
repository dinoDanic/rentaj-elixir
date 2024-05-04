#!/bin/bash

mix ecto.migrate && mix ecto.setup && mix phx.server
