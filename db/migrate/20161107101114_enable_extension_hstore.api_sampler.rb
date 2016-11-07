# This migration comes from api_sampler (originally 20161026094729)
# frozen_string_literal: true

class EnableExtensionHstore < ActiveRecord::Migration[5.0]
  def change
    enable_extension :hstore
  end
end
