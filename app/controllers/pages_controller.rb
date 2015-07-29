class PagesController < ApplicationController
  def default
    render :index
  end

  THEME_NAMES.each do |theme|

    define_method(theme) do
      render :index
    end

  end

end