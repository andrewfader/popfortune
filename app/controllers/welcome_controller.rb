class WelcomeController < ApplicationController
  def index
    Hot100.new.create_items_for_week

  end
end
